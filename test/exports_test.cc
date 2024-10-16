// Copyright 2021 Google LLC
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

#include <fstream>
#include <iostream>
#include <memory>
#include <sstream>
#include <string>
#include <vector>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/exports.h"
#include "include/proxy-wasm/wasm.h"

#include "test/utility.h"

namespace proxy_wasm {
namespace {

INSTANTIATE_TEST_SUITE_P(WasmEngines, TestVm, testing::ValuesIn(getWasmEngines()),
                         [](const testing::TestParamInfo<std::string> &info) {
                           return info.param;
                         });

TEST_P(TestVm, Environment) {
  std::unordered_map<std::string, std::string> envs = {{"KEY1", "VALUE1"}, {"KEY2", "VALUE2"}};
  auto source = readTestWasmFile("env.wasm");
  ASSERT_FALSE(source.empty());
  auto wasm = TestWasm(std::move(vm_), envs);
  ASSERT_TRUE(wasm.load(source, false));
  ASSERT_TRUE(wasm.initialize());

  WasmCallVoid<0> run;
  wasm.wasm_vm()->getFunction("run", &run);
  ASSERT_TRUE(run != nullptr);
  run(wasm.vm_context());

  // Check application logs.
  auto *context = dynamic_cast<TestContext *>(wasm.vm_context());
  EXPECT_TRUE(context->isLogged("KEY1: VALUE1\n"));
  EXPECT_TRUE(context->isLogged("KEY2: VALUE2\n"));
}

TEST_P(TestVm, WithoutEnvironment) {
  auto source = readTestWasmFile("env.wasm");
  ASSERT_FALSE(source.empty());
  auto wasm = TestWasm(std::move(vm_), {});
  ASSERT_TRUE(wasm.load(source, false));
  ASSERT_TRUE(wasm.initialize());

  WasmCallVoid<0> run;
  wasm.wasm_vm()->getFunction("run", &run);
  ASSERT_TRUE(run != nullptr);
  run(wasm.vm_context());

  // Check application logs.
  auto *context = dynamic_cast<TestContext *>(wasm.vm_context());
  EXPECT_TRUE(context->isLogEmpty());
}

TEST_P(TestVm, Clock) {
  auto source = readTestWasmFile("clock.wasm");
  ASSERT_FALSE(source.empty());
  auto wasm = TestWasm(std::move(vm_));
  ASSERT_TRUE(wasm.load(source, false));
  ASSERT_TRUE(wasm.initialize());

  WasmCallVoid<0> run;
  wasm.wasm_vm()->getFunction("run", &run);
  ASSERT_TRUE(run != nullptr);
  run(wasm.vm_context());

  // Check application logs.
  auto *context = dynamic_cast<TestContext *>(wasm.vm_context());
  EXPECT_TRUE(context->isLogged("monotonic: "));
  EXPECT_TRUE(context->isLogged("realtime: "));
}

TEST_P(TestVm, RandomZero) {
  auto source = readTestWasmFile("random.wasm");
  ASSERT_FALSE(source.empty());
  auto wasm = TestWasm(std::move(vm_));
  ASSERT_TRUE(wasm.load(source, false));
  ASSERT_TRUE(wasm.initialize());

  WasmCallVoid<1> run;
  wasm.wasm_vm()->getFunction("run", &run);
  ASSERT_TRUE(run != nullptr);
  run(wasm.vm_context(), Word{0});

  // Check application logs.
  auto *context = dynamic_cast<TestContext *>(wasm.vm_context());
  EXPECT_TRUE(context->isLogged("random_get(0) succeeded."));
}

TEST_P(TestVm, RandomSmall) {
  auto source = readTestWasmFile("random.wasm");
  ASSERT_FALSE(source.empty());
  auto wasm = TestWasm(std::move(vm_));
  ASSERT_TRUE(wasm.load(source, false));
  ASSERT_TRUE(wasm.initialize());

  WasmCallVoid<1> run;
  wasm.wasm_vm()->getFunction("run", &run);
  ASSERT_TRUE(run != nullptr);
  run(wasm.vm_context(), Word{32});

  // Check application logs.
  auto *context = dynamic_cast<TestContext *>(wasm.vm_context());
  EXPECT_TRUE(context->isLogged("random_get(32) succeeded."));
}

TEST_P(TestVm, RandomLarge) {
  auto source = readTestWasmFile("random.wasm");
  ASSERT_FALSE(source.empty());
  auto wasm = TestWasm(std::move(vm_));
  ASSERT_TRUE(wasm.load(source, false));
  ASSERT_TRUE(wasm.initialize());

  WasmCallVoid<1> run;
  wasm.wasm_vm()->getFunction("run", &run);
  ASSERT_TRUE(run != nullptr);
  run(wasm.vm_context(), Word{64 * 1024});

  // Check application logs.
  auto *context = dynamic_cast<TestContext *>(wasm.vm_context());
  EXPECT_TRUE(context->isLogged("random_get(65536) succeeded."));
}

TEST_P(TestVm, RandomTooLarge) {
  auto source = readTestWasmFile("random.wasm");
  ASSERT_FALSE(source.empty());
  auto wasm = TestWasm(std::move(vm_));
  ASSERT_TRUE(wasm.load(source, false));
  ASSERT_TRUE(wasm.initialize());

  WasmCallVoid<1> run;
  wasm.wasm_vm()->getFunction("run", &run);
  ASSERT_TRUE(run != nullptr);
  run(wasm.vm_context(), Word{65 * 1024});

  // Check application logs.
  auto *context = dynamic_cast<TestContext *>(wasm.vm_context());
  EXPECT_TRUE(context->isLogged("random_get(66560) failed."));
}

TEST_P(TestVm, SendLocalResponse) {
  auto source = readTestWasmFile("local_response.wasm");
  ASSERT_FALSE(source.empty());
  auto wasm = TestWasm(std::move(vm_));
  ASSERT_TRUE(wasm.load(source, false));
  ASSERT_TRUE(wasm.initialize());

  auto *context = dynamic_cast<TestContext *>(wasm.vm_context());

  // We first try the negative case - proxy_send_local_response fails
  WasmCallVoid<0> run_fail;
  wasm.wasm_vm()->getFunction("run_fail", &run_fail);
  ASSERT_TRUE(run_fail != nullptr);
  run_fail(context);

  // We expect application to log whatever status
  // proxy_send_local_response returns.
  EXPECT_TRUE(context->isLogged(stringify("proxy_send_local_response returned ",
                                          static_cast<uint32_t>(WasmResult::Unimplemented))));
  // When we fail to send local response we don't pause processing.
  EXPECT_FALSE(context->wasm()->isNextIterationStopped());

  // Then we try the positive case - proxy_send_local_response succeeds
  WasmCallVoid<0> run_success;
  wasm.wasm_vm()->getFunction("run_success", &run_success);
  ASSERT_TRUE(run_success != nullptr);
  run_success(context);

  EXPECT_TRUE(context->isLogged(
      stringify("proxy_send_local_response returned ", static_cast<uint32_t>(WasmResult::Ok))));
  // When we succeed to send local response we stop processing.
  EXPECT_TRUE(context->wasm()->isNextIterationStopped());
}

} // namespace
} // namespace proxy_wasm
