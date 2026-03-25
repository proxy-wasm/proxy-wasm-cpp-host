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
#include "gmock/gmock.h"

#include <optional>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/wasm.h"

#include "test/utility.h"

namespace proxy_wasm {
namespace {

class EndiannessContext : public TestContext {
public:
  using TestContext::TestContext;
  WasmResult getHeaderMapPairs(WasmHeaderMapType /* type */, Pairs * /* result */) override {
    // GetHeaderMapPairs passes this value as the hostcall return value as
    // opposed to output parameter.
    return static_cast<WasmResult>(3333333333U);
  }
};

class EndiannessWasm : public TestWasm {
public:
  using TestWasm::TestWasm;
  ContextBase *createVmContext() override { return new EndiannessContext(this); };
};

class EndiannessTest : public TestVm {
public:
  void SetUp() {
    auto source = readTestWasmFile("endianness.wasm");
    ASSERT_FALSE(source.empty());
    wasm_.emplace(std::move(vm_));
    ASSERT_TRUE(wasm_->load(source, false));
    ASSERT_TRUE(wasm_->initialize());
    context_ = dynamic_cast<EndiannessContext *>(wasm_->vm_context());
    ASSERT_NE(context_, nullptr);
  }

  std::optional<EndiannessWasm> wasm_;
  EndiannessContext *context_;
};

INSTANTIATE_TEST_SUITE_P(WasmEngines, EndiannessTest, testing::ValuesIn(getWasmEngines()),
                         [](const testing::TestParamInfo<std::string> &info) {
                           return info.param;
                         });

TEST_P(EndiannessTest, WasmCallReturnsWordValue) {
  WasmCallWord<0> test_return_u32;
  wasm_->wasm_vm()->getFunction("test_return_u32", &test_return_u32);

  EXPECT_EQ(test_return_u32(context_).u32(), 3333333333U) << context_->getLog();
}

TEST_P(EndiannessTest, WasmCallReturnsNegativeWordValue) {
  WasmCallWord<0> test_return_i32;
  wasm_->wasm_vm()->getFunction("test_return_i32", &test_return_i32);

  EXPECT_EQ(test_return_i32(context_).u32(), -1111111111) << context_->getLog();
}

TEST_P(EndiannessTest, WasmCallReturnsUnsignedLongValue) {
  WasmCall_lf test_return_u64;
  wasm_->wasm_vm()->getFunction("test_return_u64", &test_return_u64);

  EXPECT_EQ(test_return_u64(context_, 1.0), 11111111111111111111UL) << context_->getLog();
}

TEST_P(EndiannessTest, WasmCallReturnsNegativeLongValue) {
  WasmCall_lf test_return_i64;
  wasm_->wasm_vm()->getFunction("test_return_i64", &test_return_i64);

  EXPECT_EQ(test_return_i64(context_, 1.0), -111111111111111111L) << context_->getLog();
}

TEST_P(EndiannessTest, WasmCallReturnsFloatValue) {
  WasmCall_fff test_return_f32;
  wasm_->wasm_vm()->getFunction("test_return_f32", &test_return_f32);

  EXPECT_THAT(test_return_f32(context_, 1.0, 1.0),
              testing::AllOf(testing::Lt(1112.0), testing::Gt(1110.0)))
      << context_->getLog();
}

TEST_P(EndiannessTest, WasmCallReturnsDoubleValue) {
  WasmCall_dfff test_return_f64;
  wasm_->wasm_vm()->getFunction("test_return_f64", &test_return_f64);

  EXPECT_THAT(test_return_f64(context_, 1.0, 1.0, 1.0),
              testing::AllOf(testing::Lt(1111111112.0), testing::Gt(1111111110.0)))
      << context_->getLog();
}

TEST_P(EndiannessTest, HostCallReturnsWordValue) {
  WasmCallWord<0> test_host_return;
  wasm_->wasm_vm()->getFunction("test_host_return", &test_host_return);

  EXPECT_TRUE(test_host_return(context_)) << context_->getLog();
}

TEST_P(EndiannessTest, HostPassesPrimitiveValues) {
  WasmCall_WWlfd test_primitives;
  wasm_->wasm_vm()->getFunction("test_primitives", &test_primitives);

  ASSERT_TRUE(test_primitives(context_, 3333333333U, 11111111111111111111UL, 1111, 1111111111))
      << context_->getLog();
}

TEST_P(EndiannessTest, HostPassesNegativePrimitiveValues) {
  WasmCall_WWlfd test_negative_primitives;
  wasm_->wasm_vm()->getFunction("test_negative_primitives", &test_negative_primitives);

  ASSERT_TRUE(
      test_negative_primitives(context_, -1111111111, -1111111111111111111, -1111, -1111111111))
      << context_->getLog();
}

TEST_P(EndiannessTest, HostReadsPointersToWasmMemory) {
  WasmCallWord<0> test_buffer_from_wasm;
  wasm_->wasm_vm()->getFunction("test_buffer_from_wasm", &test_buffer_from_wasm);

  ASSERT_TRUE(test_buffer_from_wasm(context_)) << context_->getLog();

  context_->isLogged("hello from wasm land!");
}

TEST_P(EndiannessTest, WasmCallReadsBufferPassedByHost) {
  context_->setBuffer(0, "hello from host land!");
  WasmCallWord<0> test_buffer_from_host;
  wasm_->wasm_vm()->getFunction("test_buffer_from_host", &test_buffer_from_host);

  ASSERT_TRUE(test_buffer_from_host(context_)) << context_->getLog();
}

GTEST_ALLOW_UNINSTANTIATED_PARAMETERIZED_TEST(EndiannessTest);

} // namespace
} // namespace proxy_wasm
