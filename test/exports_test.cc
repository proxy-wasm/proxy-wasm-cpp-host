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

auto test_values = testing::ValuesIn(getRuntimes());

INSTANTIATE_TEST_SUITE_P(Runtimes, TestVM, test_values);

class TestContext : public ContextBase {
public:
  TestContext(WasmBase *base) : ContextBase(base){};
  WasmResult log(uint32_t, std::string_view msg) override {
    log_ += std::string(msg) + "\n";
    return WasmResult::Ok;
  }
  std::string &log_msg() { return log_; }

private:
  std::string log_;
};

TEST_P(TestVM, Callback) {
  std::map<std::string, std::string> envs = {{"KEY1", "VALUE1"}, {"KEY2", "VALUE2"}};
  initialize("env.wasm");

  auto wasm_base = WasmBase(std::move(vm_), "vm_id", "", "", envs, {});
  ASSERT_TRUE(wasm_base.wasm_vm()->load(source_, false));

  TestContext context(&wasm_base);
  current_context_ = &context;

  wasm_base.registerCallbacks();

  ASSERT_TRUE(wasm_base.wasm_vm()->link(""));

  WasmCallVoid<0> run;
  wasm_base.wasm_vm()->getFunction("run", &run);

  run(current_context_);

  auto exp = context.log_msg();
  EXPECT_NE(std::string::npos, exp.find("KEY1: VALUE1")) << exp;
  EXPECT_NE(std::string::npos, exp.find("KEY2: VALUE2")) << exp;
}

} // namespace
} // namespace proxy_wasm
