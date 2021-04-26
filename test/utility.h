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
  TestVM() : integration_(new DummyIntegration{}), runtime_(GetParam()) {
    if (runtime_ == "") {
      EXPECT_TRUE(false) << "runtime must not be empty";
#if defined(WASM_V8)
    } else if (runtime_ == "v8") {
      wasm_vm_ = proxy_wasm::createV8Vm();
#endif
#if defined(WASM_WAVM)
    } else if (runtime_ == "wavm") {
      wasm_vm_ = proxy_wasm::createWavmVm();
#endif
#if defined(WASM_WASMTIME)
    } else if (runtime_ == "wasmtime") {
      wasm_vm_ = proxy_wasm::createWasmtimeVm();
#endif
    }
    wasm_vm_->integration().reset(integration_);
  }

  void initialize(const std::string source, std::string_view vm_id = "",
                  std::string_view vm_configuration = "", std::string_view vm_key = "",
                  std::unordered_map<std::string, std::string> envs = {},
                  AllowedCapabilitiesMap allowed_capabilities = {}) {
    wasm_base_ = std::make_unique<WasmBase>(std::move(wasm_vm_), vm_id, vm_key, vm_configuration,
                                            envs, allowed_capabilities);
    ASSERT_TRUE(wasm_base_->wasm_vm()->load(source, false));
    wasm_base_->registerCallbacks();
    ASSERT_TRUE(wasm_base_->wasm_vm()->link(""));
  }
  std::string runtime() { return runtime_; }
  proxy_wasm::WasmBase *wasmBase() { return wasm_base_.get(); }
  proxy_wasm::WasmVm *wasmVm() { return wasm_vm_ ? wasm_vm_.get() : wasm_base_->wasm_vm(); }
  DummyIntegration *integration() { return integration_; }

private:
  DummyIntegration *integration_;
  std::string runtime_;
  std::unique_ptr<WasmBase> wasm_base_;
  std::unique_ptr<proxy_wasm::WasmVm> wasm_vm_;
};
} // namespace proxy_wasm
