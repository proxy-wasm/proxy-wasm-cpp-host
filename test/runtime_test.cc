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

#include "gtest/gtest.h"
#include <fstream>
#include <iostream>
#include <memory>
#include <sstream>
#include <string>
#include <vector>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/wasm.h"

#if defined(WASM_V8)
#include "include/proxy-wasm/v8.h"
#endif
#if defined(WASM_WAVM)
#include "include/proxy-wasm/wavm.h"
#endif
#if defined(WASM_WASMTIME)
#include "include/proxy-wasm/wasmtime.h"
#endif

namespace proxy_wasm {
namespace {

struct DummyIntegration : public WasmVmIntegration {
  ~DummyIntegration() override{};
  WasmVmIntegration *clone() override { return new DummyIntegration{}; }
  void error(std::string_view message) override {
    std::cout << "ERROR from integration: " << message << std::endl;
    error_message_ = message;
  }
  void trace(std::string_view message) override {
    std::cout << "TRACE from integration: " << message << std::endl;
    trace_message_ = message;
  }
  bool getNullVmFunction(std::string_view function_name, bool returns_word, int number_of_arguments,
                         NullPlugin *plugin, void *ptr_to_function_return) override {
    return false;
  };

  LogLevel getLogLevel() override { return log_level_; }
  std::string error_message_;
  std::string trace_message_;
  LogLevel log_level_ = LogLevel::info;
};

class TestVM : public testing::TestWithParam<std::string> {
public:
  std::unique_ptr<proxy_wasm::WasmVm> vm_;

  TestVM() : integration_(new DummyIntegration{}) {
    runtime_ = GetParam();
    if (runtime_ == "") {
      EXPECT_TRUE(false) << "runtime must not be empty";
#if defined(WASM_V8)
    } else if (runtime_ == "v8") {
      vm_ = proxy_wasm::createV8Vm();
#endif
#if defined(WASM_WAVM)
    } else if (runtime_ == "wavm") {
      vm_ = proxy_wasm::createWavmVm();
#endif
#if defined(WASM_WASMTIME)
    } else if (runtime_ == "wasmtime") {
      vm_ = proxy_wasm::createWasmtimeVm();
#endif
    }
    vm_->integration().reset(integration_);
  }

  DummyIntegration *integration_;

  void initialize(std::string filename) {
    auto path = "test/test_data/" + filename;
    std::ifstream file(path, std::ios::binary);
    EXPECT_FALSE(file.fail()) << "failed to open: " << path;
    std::stringstream file_string_stream;
    file_string_stream << file.rdbuf();
    source_ = file_string_stream.str();
  }

  std::string source_;
  std::string runtime_;
};

static std::vector<std::string> getRuntimes() {
  std::vector<std::string> runtimes = {
#if defined(WASM_V8)
    "v8",
#endif
#if defined(WASM_WAVM)
    "wavm",
#endif
#if defined(WASM_WASMTIME)
    "wasmtime",
#endif
    ""
  };
  runtimes.pop_back();
  return runtimes;
}

auto test_values = testing::ValuesIn(getRuntimes());

INSTANTIATE_TEST_SUITE_P(Runtimes, TestVM, test_values);

TEST_P(TestVM, Basic) {
  EXPECT_EQ(vm_->cloneable(), proxy_wasm::Cloneable::CompiledBytecode);
  EXPECT_EQ(vm_->runtime(), runtime_);
}

TEST_P(TestVM, ABIVersion) {
  initialize("abi_export.wasm");
  ASSERT_TRUE(vm_->load(source_, false));
  ASSERT_EQ(vm_->getAbiVersion(), AbiVersion::ProxyWasm_0_2_0);
}

TEST_P(TestVM, CustomSection) {
  initialize("abi_export.wasm");
  char custom_section[12] = {
      0x00,                         // custom section id
      0x0a,                         // section length
      0x04, 0x68, 0x65, 0x79, 0x21, // section name: "hey!"
      0x68, 0x65, 0x6c, 0x6c, 0x6f, // content: "hello"
  };

  source_ = source_.append(&custom_section[0], 12);
  ASSERT_TRUE(vm_->load(source_, false));
  auto name_section = vm_->getCustomSection("hey!");
  ASSERT_EQ(name_section, "hello");
}

TEST_P(TestVM, Memory) {
  initialize("abi_export.wasm");
  ASSERT_TRUE(vm_->load(source_, false));
  ASSERT_TRUE(vm_->link(""));

  Word word;
  ASSERT_TRUE(vm_->setWord(0x2000, Word(100)));
  ASSERT_TRUE(vm_->getWord(0x2000, &word));
  ASSERT_EQ(100, word.u64_);

  int32_t data[2] = {-1, 200};
  ASSERT_TRUE(vm_->setMemory(0x200, sizeof(int32_t) * 2, static_cast<void *>(data)));
  ASSERT_TRUE(vm_->getWord(0x200, &word));
  ASSERT_EQ(-1, static_cast<int32_t>(word.u64_));
  ASSERT_TRUE(vm_->getWord(0x204, &word));
  ASSERT_EQ(200, static_cast<int32_t>(word.u64_));
}

TEST_P(TestVM, Clone) {
  initialize("abi_export.wasm");
  ASSERT_TRUE(vm_->load(source_, false));
  ASSERT_TRUE(vm_->link(""));
  const auto address = 0x2000;
  Word word;
  {
    auto clone = vm_->clone();
    ASSERT_TRUE(clone != nullptr);
    ASSERT_NE(vm_, clone);
    ASSERT_TRUE(clone->link(""));

    ASSERT_TRUE(clone->setWord(address, Word(100)));
    ASSERT_TRUE(clone->getWord(address, &word));
    ASSERT_EQ(100, word.u64_);
  }

  // check memory arrays are not overrapped
  ASSERT_TRUE(vm_->getWord(address, &word));
  ASSERT_NE(100, word.u64_);
}

class TestContext : public ContextBase {
public:
  TestContext(){};
  void increment() { counter++; }
  int64_t counter = 0;
};

void nopCallback(void *raw_context) {}

void callback(void *raw_context) {
  TestContext *context = static_cast<TestContext *>(raw_context);
  context->increment();
}

Word callback2(void *raw_context, Word val) { return val + 100; }

TEST_P(TestVM, StraceLogLevel) {
  initialize("callback.wasm");
  ASSERT_TRUE(vm_->load(source_, false));
  vm_->registerCallback("env", "callback", &nopCallback,
                        &ConvertFunctionWordToUint32<decltype(nopCallback),
                                                     nopCallback>::convertFunctionWordToUint32);
  vm_->registerCallback(
      "env", "callback2", &callback2,
      &ConvertFunctionWordToUint32<decltype(callback2), callback2>::convertFunctionWordToUint32);
  ASSERT_TRUE(vm_->link(""));

  WasmCallVoid<0> run;
  vm_->getFunction("run", &run);

  run(nullptr);
  // no trace message found since DummyIntegration's log_level_ defaults to  LogLevel::info
  EXPECT_EQ(integration_->trace_message_, "");

  integration_->log_level_ = LogLevel::trace;
  run(nullptr);
  EXPECT_NE(integration_->trace_message_, "");
}

TEST_P(TestVM, Callback) {
  initialize("callback.wasm");
  ASSERT_TRUE(vm_->load(source_, false));

  TestContext context;
  current_context_ = &context;

  vm_->registerCallback(
      "env", "callback", &callback,
      &ConvertFunctionWordToUint32<decltype(callback), callback>::convertFunctionWordToUint32);

  vm_->registerCallback(
      "env", "callback2", &callback2,
      &ConvertFunctionWordToUint32<decltype(callback2), callback2>::convertFunctionWordToUint32);

  ASSERT_TRUE(vm_->link(""));

  WasmCallVoid<0> run;
  vm_->getFunction("run", &run);
  EXPECT_TRUE(run != nullptr);
  for (auto i = 0; i < 100; i++) {
    run(current_context_);
  }
  ASSERT_EQ(context.counter, 100);

  WasmCallWord<1> run2;
  vm_->getFunction("run2", &run2);
  Word res = run2(current_context_, Word{0});
  ASSERT_EQ(res.u32(), 100100); // 10000 (global) + 100(in callback)
}

TEST_P(TestVM, Trap) {
  initialize("trap.wasm");
  ASSERT_TRUE(vm_->load(source_, false));
  ASSERT_TRUE(vm_->link(""));
  WasmCallVoid<0> trigger;
  vm_->getFunction("trigger", &trigger);
  EXPECT_TRUE(trigger != nullptr);
  trigger(current_context_);
  std::string exp_message = "Function: trigger failed";
  ASSERT_TRUE(integration_->error_message_.find(exp_message) != std::string::npos);

  WasmCallWord<1> trigger2;
  vm_->getFunction("trigger2", &trigger2);
  EXPECT_TRUE(trigger2 != nullptr);
  trigger2(current_context_, 0);
  exp_message = "Function: trigger2 failed:";
  ASSERT_TRUE(integration_->error_message_.find(exp_message) != std::string::npos);
}

} // namespace
} // namespace proxy_wasm
