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
#include <utility>
#include <vector>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/wasm.h"

#if defined(PROXY_WASM_HOST_ENGINE_V8)
#include "include/proxy-wasm/v8.h"
#endif
#if defined(PROXY_WASM_HOST_ENGINE_WAVM)
#include "include/proxy-wasm/wavm.h"
#endif
#if defined(PROXY_WASM_HOST_ENGINE_WASMTIME)
#include "include/proxy-wasm/wasmtime.h"
#endif
#if defined(PROXY_WASM_HOST_ENGINE_WAMR)
#include "include/proxy-wasm/wamr.h"
#endif

namespace proxy_wasm {

std::vector<std::string> getWasmEngines();
std::string readTestWasmFile(const std::string &filename);

class TestIntegration : public WasmVmIntegration {
public:
  ~TestIntegration() override = default;
  WasmVmIntegration *clone() override { return new TestIntegration{}; }

  void setLogLevel(LogLevel level) { log_level_ = level; }

  LogLevel getLogLevel() override { return log_level_; }

  void error(std::string_view message) override {
    std::cout << "ERROR from integration: " << message << std::endl;
    error_log_ += std::string(message) + "\n";
  }

  bool isErrorLogEmpty() { return error_log_.empty(); }

  bool isErrorLogged(std::string_view message) {
    return error_log_.find(message) != std::string::npos;
  }

  void trace(std::string_view message) override {
    std::cout << "TRACE from integration: " << message << std::endl;
    trace_log_ += std::string(message) + "\n";
  }

  bool isTraceLogEmpty() { return trace_log_.empty(); }

  bool isTraceLogged(std::string_view message) {
    return trace_log_.find(message) != std::string::npos;
  }

  bool getNullVmFunction(std::string_view /*function_name*/, bool /*returns_word*/,
                         int /*number_of_arguments*/, NullPlugin * /*plugin*/,
                         void * /*ptr_to_function_return*/) override {
    return false;
  };

private:
  std::string error_log_;
  std::string trace_log_;
  LogLevel log_level_ = LogLevel::trace;
};

class TestContext : public ContextBase {
public:
  TestContext(WasmBase *wasm) : ContextBase(wasm) {}

  WasmResult log(uint32_t /*log_level*/, std::string_view message) override {
    log_ += std::string(message) + "\n";
    return WasmResult::Ok;
  }

  bool isLogEmpty() { return log_.empty(); }

  bool isLogged(std::string_view message) { return log_.find(message) != std::string::npos; }

  uint64_t getCurrentTimeNanoseconds() override {
    return std::chrono::duration_cast<std::chrono::nanoseconds>(
               std::chrono::system_clock::now().time_since_epoch())
        .count();
  }
  uint64_t getMonotonicTimeNanoseconds() override {
    return std::chrono::duration_cast<std::chrono::nanoseconds>(
               std::chrono::steady_clock::now().time_since_epoch())
        .count();
  }

private:
  std::string log_;
};

class TestWasm : public WasmBase {
public:
  TestWasm(std::unique_ptr<WasmVm> wasm_vm, std::unordered_map<std::string, std::string> envs = {})
      : WasmBase(std::move(wasm_vm), "", "", "", std::move(envs), {}) {}

  ContextBase *createVmContext() override { return new TestContext(this); };
};

class TestVm : public testing::TestWithParam<std::string> {
public:
  TestVm() {
    engine_ = GetParam();
    vm_ = newVm();
  }

  std::unique_ptr<proxy_wasm::WasmVm> newVm() {
    std::unique_ptr<proxy_wasm::WasmVm> vm;
    if (engine_.empty()) {
      ADD_FAILURE() << "engine must not be empty";
#if defined(PROXY_WASM_HOST_ENGINE_V8)
    } else if (engine_ == "v8") {
      vm = proxy_wasm::createV8Vm();
#endif
#if defined(PROXY_WASM_HOST_ENGINE_WAVM)
    } else if (engine_ == "wavm") {
      vm = proxy_wasm::createWavmVm();
#endif
#if defined(PROXY_WASM_HOST_ENGINE_WASMTIME)
    } else if (engine_ == "wasmtime") {
      vm = proxy_wasm::createWasmtimeVm();
#endif
#if defined(PROXY_WASM_HOST_ENGINE_WAMR)
    } else if (engine_ == "wamr") {
      vm = proxy_wasm::createWamrVm();
#endif
    } else {
      ADD_FAILURE() << "compiled without support for the requested \"" << engine_ << "\" engine";
    }
    vm->integration() = std::make_unique<TestIntegration>();
    return vm;
  };

  std::unique_ptr<proxy_wasm::WasmVm> vm_;
  std::string engine_;
};

} // namespace proxy_wasm
