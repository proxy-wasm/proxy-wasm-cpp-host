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
#include <memory>

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

  // Define callbacks.
  WasmHandleFactory wasm_handle_factory =
      [this, vm_id, vm_config](std::string_view vm_key) -> std::shared_ptr<WasmHandleBase> {
    auto base_wasm = std::make_shared<WasmBase>(newVm(), vm_id, vm_config, vm_key,
                                                std::unordered_map<std::string, std::string>{},
                                                AllowedCapabilitiesMap{});
    return std::make_shared<WasmHandleBase>(base_wasm);
  };

  WasmHandleCloneFactory wasm_handle_clone_factory =
      [this](std::shared_ptr<WasmHandleBase> base_wasm_handle) -> std::shared_ptr<WasmHandleBase> {
    auto wasm = std::make_shared<WasmBase>(base_wasm_handle,
                                           [this]() -> std::unique_ptr<WasmVm> { return newVm(); });
    return std::make_shared<WasmHandleBase>(wasm);
  };

  PluginHandleFactory plugin_handle_factory =
      [](std::shared_ptr<WasmHandleBase> base_wasm,
         std::shared_ptr<PluginBase> plugin) -> std::shared_ptr<PluginHandleBase> {
    return std::make_shared<PluginHandleBase>(base_wasm, plugin);
  };

  // Read the minimal loadable binary.
  auto source = readTestWasmFile("abi_export.wasm");

  // Create base Wasm via createWasm.
  auto base_wasm_handle =
      createWasm("vm_key", source, plugin, wasm_handle_factory, wasm_handle_clone_factory, false);
  ASSERT_TRUE(base_wasm_handle && base_wasm_handle->wasm());

  // Create a thread local plugin.
  auto thread_local_plugin = getOrCreateThreadLocalPlugin(
      base_wasm_handle, plugin, wasm_handle_clone_factory, plugin_handle_factory);
  ASSERT_TRUE(thread_local_plugin && thread_local_plugin->plugin());
  // If the VM is not failed, same WasmBase should be used for the same configuration.
  ASSERT_EQ(getOrCreateThreadLocalPlugin(base_wasm_handle, plugin, wasm_handle_clone_factory,
                                         plugin_handle_factory)
                ->wasm(),
            thread_local_plugin->wasm());

  // Cause runtime crash.
  thread_local_plugin->wasm()->wasm_vm()->fail(FailState::RuntimeError, "runtime error msg");
  ASSERT_TRUE(thread_local_plugin->wasm()->isFailed());
  // the Base Wasm should not be affected by cloned ones.
  ASSERT_FALSE(base_wasm_handle->wasm()->isFailed());

  // Create another thread local plugin with the same configuration.
  // This one should not end up using the failed VM.
  auto thread_local_plugin2 = getOrCreateThreadLocalPlugin(
      base_wasm_handle, plugin, wasm_handle_clone_factory, plugin_handle_factory);
  ASSERT_TRUE(thread_local_plugin2 && thread_local_plugin2->plugin());
  ASSERT_FALSE(thread_local_plugin2->wasm()->isFailed());
  // Verify the pointer to WasmBase is different from the failed one.
  ASSERT_NE(thread_local_plugin2->wasm(), thread_local_plugin->wasm());

  // Cause runtime crash again.
  thread_local_plugin2->wasm()->wasm_vm()->fail(FailState::RuntimeError, "runtime error msg");
  ASSERT_TRUE(thread_local_plugin2->wasm()->isFailed());
  // the Base Wasm should not be affected by cloned ones.
  ASSERT_FALSE(base_wasm_handle->wasm()->isFailed());

  // This time, create another thread local plugin with *different* plugin key for the same vm_key.
  // This one also should not end up using the failed VM.
  const auto plugin2 = std::make_shared<PluginBase>(plugin_name, root_id, vm_id, runtime_,
                                                    plugin_config, fail_open, "another_plugin_key");
  auto thread_local_plugin3 = getOrCreateThreadLocalPlugin(
      base_wasm_handle, plugin2, wasm_handle_clone_factory, plugin_handle_factory);
  ASSERT_TRUE(thread_local_plugin3 && thread_local_plugin3->plugin());
  ASSERT_FALSE(thread_local_plugin3->wasm()->isFailed());
  // Verify the pointer to WasmBase is different from the failed one.
  ASSERT_NE(thread_local_plugin3->wasm(), thread_local_plugin->wasm());
  ASSERT_NE(thread_local_plugin3->wasm(), thread_local_plugin2->wasm());
}

TEST_P(TestVM, DifferentRootContextsFromDifferentPluginKeys) {
  const std::string plugin_name = "plugin_name";
  const std::string root_id = "root_id";
  const std::string vm_id = "vm_id";
  const std::string vm_config = "vm_config";
  const std::string plugin_config = "plugin_config";
  const bool fail_open = false;

  const std::shared_ptr<PluginBase> plugin1 = std::make_shared<PluginBase>(
      plugin_name, root_id, vm_id, runtime_, plugin_config, fail_open, "plugin1_key");

  // Define callbacks.
  WasmHandleFactory wasm_handle_factory =
      [this, vm_id, vm_config](std::string_view vm_key) -> std::shared_ptr<WasmHandleBase> {
    auto base_wasm = std::make_shared<WasmBase>(newVm(), vm_id, vm_config, vm_key,
                                                std::unordered_map<std::string, std::string>{},
                                                AllowedCapabilitiesMap{});
    return std::make_shared<WasmHandleBase>(base_wasm);
  };

  WasmHandleCloneFactory wasm_handle_clone_factory =
      [this](std::shared_ptr<WasmHandleBase> base_wasm_handle) -> std::shared_ptr<WasmHandleBase> {
    std::shared_ptr<WasmBase> wasm = std::make_shared<WasmBase>(
        base_wasm_handle, [this]() -> std::unique_ptr<WasmVm> { return newVm(); });
    return std::make_shared<WasmHandleBase>(wasm);
  };

  // Read the minimal loadable binary.
  std::string source = readTestWasmFile("abi_export.wasm");

  // Create base Wasm via createWasm.
  std::shared_ptr<WasmHandleBase> base_wasm_handle =
      createWasm("vm_key", source, plugin1, wasm_handle_factory, wasm_handle_clone_factory, false);
  EXPECT_TRUE(getThreadLocalWasm(vm_id) == base_wasm_handle);
  ContextBase *root_context1 = base_wasm_handle->wasm()->getRootContext(plugin1, false);
  EXPECT_TRUE(root_context1 != nullptr);

  // Create a new plugin with different key.
  const std::shared_ptr<PluginBase> plugin2 = std::make_shared<PluginBase>(
      plugin_name, root_id, vm_id, runtime_, plugin_config, fail_open, "plugin2_key");
  EXPECT_TRUE(base_wasm_handle->wasm()->getRootContext(plugin2, false) == nullptr);

  // Create context from a plugin2.
  base_wasm_handle->wasm()->createContext(plugin2);
  ContextBase *root_context2 = base_wasm_handle->wasm()->getRootContext(plugin2, false);
  EXPECT_TRUE(root_context2 != nullptr);

  // Verify that the 2 root contexts are different contexts with the same root id.
  EXPECT_TRUE(root_context1->isRootContext() && root_context2->isRootContext());
  EXPECT_TRUE(root_context1 != root_context2);
  EXPECT_TRUE(root_context1->root_id() == root_context2->root_id());
}

} // namespace proxy_wasm
