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
#if defined(WASM_WASMTIME)
#include "include/proxy-wasm/wamr.h"
#endif

namespace proxy_wasm {

std::vector<std::string> getRuntimes();
std::string readTestWasmFile(std::string filename);

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

  void initialize(std::string filename) { source_ = readTestWasmFile(filename); }

  DummyIntegration *integration_;
  std::string source_;
  std::string runtime_;
};
} // namespace proxy_wasm
