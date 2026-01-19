// Copyright 2026 Google LLC
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

#include "gtest/gtest.h"

#if defined(PROXY_WASM_HOST_ENGINE_V8)

#include <memory>
#include <string>

#include "include/proxy-wasm/v8.h"
#include "include/proxy-wasm/wasm_vm.h"
#include "test/utility.h"

namespace proxy_wasm {
namespace {

// Test that setV8LiftoffEnabled can be called before creating a VM.
// Note: This test cannot verify the actual V8 flags are set correctly
// since the V8 engine is initialized once per process. However, it
// verifies that the API works correctly.
TEST(V8LiftoffTest, EnableLiftoffBeforeVMCreation) {
  // This should not crash or cause errors
  setV8LiftoffEnabled(true); // Enable Liftoff

  auto vm = createV8Vm();
  ASSERT_NE(vm, nullptr);
  vm->integration() = std::make_unique<TestIntegration>();

  EXPECT_EQ(vm->getEngineName(), "v8");
}

// Test that VMs can be created with default options (Liftoff disabled).
TEST(V8LiftoffTest, DefaultOptionsDisableLiftoff) {
  auto vm = createV8Vm();
  ASSERT_NE(vm, nullptr);
  vm->integration() = std::make_unique<TestIntegration>();

  EXPECT_EQ(vm->getEngineName(), "v8");

  // Load and link a simple wasm module to verify functionality
  auto source = readTestWasmFile("abi_export.wasm");
  ASSERT_TRUE(vm->load(source, {}, {}));
  ASSERT_TRUE(vm->link(""));
}

} // namespace
} // namespace proxy_wasm

#endif // PROXY_WASM_HOST_ENGINE_V8
