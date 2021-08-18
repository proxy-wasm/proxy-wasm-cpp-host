// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "include/proxy-wasm/wasm.h"

#include "gtest/gtest.h"

#include "test/utility.h"

namespace proxy_wasm {

auto test_values = testing::ValuesIn(getRuntimes());

INSTANTIATE_TEST_SUITE_P(Runtimes, TestVM, test_values);

// Failcallbacks only used for runtimes - not available for nullvm.
TEST_P(TestVM, GetOrCreateThreadLocalWasmFailCallbacks) {
  const auto plugin_name = "plugin_name";
  const auto root_id = "root_id";
  const auto vm_id = "vm_id";
  const auto vm_config = "vm_config";
  const auto plugin_config = "plugin_config";
  const auto fail_open = false;

  // Create a plugin.
  const auto plugin = std::make_shared<PluginBase>(plugin_name, root_id, vm_id, runtime_,
                                                   plugin_config, fail_open, "plugin_key");
  // Define Restart rate limitter. We limit with the maximum of two.
  VmCreationRateLimiter vm_create_rate_limiter = []() -> bool {
    static int64_t count = 0;
    return ++count < 2;
  };

  // Define callbacks.
  WasmHandleFactory wasm_handle_factory = [this, vm_id, vm_config, vm_create_rate_limiter](
                                              std::string_view vm_key) -> WasmHandleBaseSharedPtr {
    auto base_wasm = std::make_shared<WasmBase>(newVm(), vm_id, vm_config, vm_key,
                                                std::unordered_map<std::string, std::string>{},
                                                AllowedCapabilitiesMap{});
    return std::make_shared<WasmHandleBase>(base_wasm, vm_create_rate_limiter);
  };

  WasmHandleCloneFactory wasm_handle_clone_factory =
      [this](WasmHandleBaseSharedPtr base_wasm_handle) -> WasmHandleBaseSharedPtr {
    auto wasm = std::make_shared<WasmBase>(base_wasm_handle,
                                           [this]() -> std::unique_ptr<WasmVm> { return newVm(); });
    return std::make_shared<WasmHandleBase>(wasm);
  };

  PluginHandleFactory plugin_handle_factory =
      [](WasmHandleBaseSharedPtr base_wasm,
         std::shared_ptr<PluginBase> plugin) -> std::shared_ptr<PluginHandleBase> {
    return std::make_shared<PluginHandleBase>(base_wasm, plugin);
  };

  // Read the minimal loadable binary.
  auto source = readTestWasmFile("abi_export.wasm");

  // Create base Wasm via createBaseWasm.
  auto base_wasm_handle = createBaseWasm("vm_key", source, plugin, wasm_handle_factory,
                                         wasm_handle_clone_factory, false);
  ASSERT_TRUE(base_wasm_handle && base_wasm_handle->wasm());

  // Create PluginHandleManagerBase
  PluginHandleManagerBase plugin_handle_manager{
      base_wasm_handle,
      plugin,
      wasm_handle_clone_factory,
      plugin_handle_factory,
  };

  // Create a thread local plugin.
  auto thread_local_plugin = plugin_handle_manager.getHealthyPluginHandle();
  ASSERT_TRUE(thread_local_plugin && !thread_local_plugin->isFailed());
  // If the VM is not failed, same WasmBase should be used for the same configuration.
  {
    auto another_plugin =
        PluginHandleManagerBase{
            base_wasm_handle,
            plugin,
            wasm_handle_clone_factory,
            plugin_handle_factory,
        }
            .getHealthyPluginHandle();
    ASSERT_TRUE(another_plugin);
    ASSERT_EQ(another_plugin->wasmHandle(), thread_local_plugin->wasmHandle());
  }

  // Cause runtime crash.
  thread_local_plugin->wasmHandle()->wasm()->wasm_vm()->fail(FailState::RuntimeError,
                                                             "runtime error msg");
  ASSERT_TRUE(thread_local_plugin->isFailed());
  // the Base Wasm should not be affected by cloned ones.
  ASSERT_FALSE(base_wasm_handle->wasm()->isFailed());

  // Try restarting thread local plugin from the plugin manager, i.e. with the same configuration.
  // This one should not end up using the failed VM.
  ASSERT_TRUE(plugin_handle_manager.tryRestartPlugin());
  auto thread_local_plugin2 = plugin_handle_manager.getHealthyPluginHandle();
  ASSERT_TRUE(thread_local_plugin2 && thread_local_plugin2->wasmHandle()->wasm());
  ASSERT_FALSE(thread_local_plugin2->isFailed());
  // Verify the pointer to WasmBase is different from the failed one.
  ASSERT_NE(thread_local_plugin2->wasmHandle()->wasm(), thread_local_plugin->wasmHandle()->wasm());

  // Cause runtime crash again.
  thread_local_plugin2->wasmHandle()->wasm()->wasm_vm()->fail(FailState::RuntimeError,
                                                              "runtime error msg");
  ASSERT_TRUE(thread_local_plugin2->isFailed());
  // the Base Wasm should not be affected by cloned ones.
  ASSERT_FALSE(base_wasm_handle->wasm()->isFailed());

  // This time, create another thread local plugin with *different* plugin key for the same vm_key.
  // This one also should not end up using the failed VM.
  const auto plugin2 = std::make_shared<PluginBase>(plugin_name, root_id, vm_id, runtime_,
                                                    plugin_config, fail_open, "another_plugin_key");
  PluginHandleManagerBase plugin_handle_manager2{
      base_wasm_handle,
      plugin2,
      wasm_handle_clone_factory,
      plugin_handle_factory,
  };
  auto thread_local_plugin3 = plugin_handle_manager2.getHealthyPluginHandle();
  ASSERT_TRUE(thread_local_plugin3 && !thread_local_plugin3->isFailed());
  // Verify the pointer to WasmBase is different from the failed one.
  ASSERT_NE(thread_local_plugin3->wasmHandle()->wasm(), thread_local_plugin->wasmHandle()->wasm());
  ASSERT_NE(thread_local_plugin3->wasmHandle()->wasm(), thread_local_plugin2->wasmHandle()->wasm());

  // Though we've reached rate-limit max, the VM is still alive os restart plugin should succeed.
  ASSERT_TRUE(plugin_handle_manager.tryRestartPlugin());

  // Cause runtime crash again.
  thread_local_plugin2->wasmHandle()->wasm()->wasm_vm()->fail(FailState::RuntimeError,
                                                              "runtime error msg");
  ASSERT_TRUE(thread_local_plugin2->isFailed());
  // the Base Wasm should not be affected by cloned ones.
  ASSERT_FALSE(base_wasm_handle->wasm()->isFailed());

  // Now the restart is rate limitted - we shouldn't be able to create healthy PluginHandle.
  ASSERT_FALSE(plugin_handle_manager.tryRestartPlugin());
}

} // namespace proxy_wasm
