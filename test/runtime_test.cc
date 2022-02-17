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

#include "include/proxy-wasm/bytecode_util.h"
#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/wasm.h"

#include "test/utility.h"

namespace proxy_wasm {
namespace {

INSTANTIATE_TEST_SUITE_P(WasmEngines, TestVM, testing::ValuesIn(getWasmEngines()),
                         [](const testing::TestParamInfo<std::string> &info) {
                           return info.param;
                         });

TEST_P(TestVM, Basic) {
  if (engine_ == "wamr") {
    EXPECT_EQ(vm_->cloneable(), proxy_wasm::Cloneable::NotCloneable);
  } else if (engine_ == "wasmtime" || engine_ == "v8") {
    EXPECT_EQ(vm_->cloneable(), proxy_wasm::Cloneable::CompiledBytecode);
  } else if (engine_ == "wavm") {
    EXPECT_EQ(vm_->cloneable(), proxy_wasm::Cloneable::InstantiatedModule);
  } else {
    FAIL();
  }
  EXPECT_EQ(vm_->getEngineName(), engine_);
}

TEST_P(TestVM, Memory) {
  auto source = readTestWasmFile("abi_export.wasm");
  ASSERT_TRUE(vm_->load(source, {}, {}));
  ASSERT_TRUE(vm_->link(""));

  Word word;
  ASSERT_TRUE(vm_->setWord(0x2000, Word(100)));
  ASSERT_TRUE(vm_->getWord(0x2000, &word));
  ASSERT_EQ(100, word.u64_);

  uint32_t data[2] = {htole32(static_cast<uint32_t>(-1)), htole32(200)};
  ASSERT_TRUE(vm_->setMemory(0x200, sizeof(int32_t) * 2, static_cast<void *>(data)));
  ASSERT_TRUE(vm_->getWord(0x200, &word));
  ASSERT_EQ(-1, static_cast<int32_t>(word.u64_));
  ASSERT_TRUE(vm_->getWord(0x204, &word));
  ASSERT_EQ(200, static_cast<int32_t>(word.u64_));
}

TEST_P(TestVM, Clone) {
  if (vm_->cloneable() == proxy_wasm::Cloneable::NotCloneable) {
    return;
  }
  auto source = readTestWasmFile("abi_export.wasm");
  ASSERT_TRUE(vm_->load(source, {}, {}));
  ASSERT_TRUE(vm_->link(""));
  const auto address = 0x2000;
  Word word;
  {
    auto clone = vm_->clone();
    ASSERT_TRUE(clone != nullptr);
    ASSERT_NE(vm_, clone);
    if (clone->cloneable() != proxy_wasm::Cloneable::InstantiatedModule) {
      ASSERT_TRUE(clone->link(""));
    }

    ASSERT_TRUE(clone->setWord(address, Word(100)));
    ASSERT_TRUE(clone->getWord(address, &word));
    ASSERT_EQ(100, word.u64_);
  }

  // check memory arrays are not overrapped
  ASSERT_TRUE(vm_->getWord(address, &word));
  ASSERT_NE(100, word.u64_);
}

#if defined(__linux__) && defined(__x86_64__)

TEST_P(TestVM, CloneUntilOutOfMemory) {
  if (vm_->cloneable() == proxy_wasm::Cloneable::NotCloneable) {
    return;
  }
  if (engine_ == "wavm") {
    // TODO(PiotrSikora): Figure out why this fails on the CI.
    return;
  }

  auto source = readTestWasmFile("abi_export.wasm");
  ASSERT_TRUE(vm_->load(source, {}, {}));
  ASSERT_TRUE(vm_->link(""));

  std::vector<std::unique_ptr<WasmVm>> clones;
  for (;;) {
    auto clone = vm_->clone();
    if (clone == nullptr) {
      break;
    }
    if (clone->cloneable() != proxy_wasm::Cloneable::InstantiatedModule) {
      if (clone->link("") == false) {
        break;
      }
    }
    // Prevent clone from droping out of scope and freeing memory.
    clones.push_back(std::move(clone));
  }
  EXPECT_GE(clones.size(), 1000);
}

#endif

class TestContext : public ContextBase {
public:
  TestContext(){};
  void increment() { counter++; }
  int64_t counter = 0;
};

void nopCallback() {}

void callback() {
  TestContext *context = static_cast<TestContext *>(contextOrEffectiveContext());
  context->increment();
}

Word callback2(Word val) { return val + 100; }

TEST_P(TestVM, StraceLogLevel) {
  if (engine_ == "wavm") {
    // TODO(mathetake): strace is yet to be implemented for WAVM.
    // See https://github.com/proxy-wasm/proxy-wasm-cpp-host/issues/120.
    return;
  }

  auto integration = static_cast<DummyIntegration *>(vm_->integration().get());
  auto source = readTestWasmFile("callback.wasm");
  ASSERT_TRUE(vm_->load(source, {}, {}));
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
  EXPECT_EQ(integration->trace_message_, "");

  integration->log_level_ = LogLevel::trace;
  run(nullptr);
  EXPECT_NE(integration->trace_message_, "");
}

TEST_P(TestVM, BadExportFunction) {
  auto source = readTestWasmFile("callback.wasm");
  ASSERT_TRUE(vm_->load(source, {}, {}));

  TestContext context;
  vm_->registerCallback(
      "env", "callback", &callback,
      &ConvertFunctionWordToUint32<decltype(callback), callback>::convertFunctionWordToUint32);
  vm_->registerCallback(
      "env", "callback2", &callback2,
      &ConvertFunctionWordToUint32<decltype(callback2), callback2>::convertFunctionWordToUint32);
  ASSERT_TRUE(vm_->link(""));

  WasmCallVoid<0> run;
  vm_->getFunction("non-existent", &run);
  EXPECT_TRUE(run == nullptr);

  WasmCallWord<2> bad_signature_run;
  vm_->getFunction("run", &bad_signature_run);
  EXPECT_TRUE(bad_signature_run == nullptr);

  vm_->getFunction("run", &run);
  EXPECT_TRUE(run != nullptr);
  for (auto i = 0; i < 100; i++) {
    run(&context);
  }
  ASSERT_EQ(context.counter, 100);
}

TEST_P(TestVM, Callback) {
  auto source = readTestWasmFile("callback.wasm");
  ASSERT_TRUE(vm_->load(source, {}, {}));

  TestContext context;

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
    run(&context);
  }
  ASSERT_EQ(context.counter, 100);

  WasmCallWord<1> run2;
  vm_->getFunction("run2", &run2);
  Word res = run2(&context, Word{0});
  ASSERT_EQ(res.u32(), 100100); // 10000 (global) + 100(in callback)
}

TEST_P(TestVM, Trap) {
  auto source = readTestWasmFile("trap.wasm");
  std::unordered_map<uint32_t, std::string> function_names;
  EXPECT_TRUE(BytecodeUtil::getFunctionNameIndex(source, function_names));
  ASSERT_TRUE(vm_->load(source, {}, function_names));
  ASSERT_TRUE(vm_->link(""));
  TestContext context;
  WasmCallVoid<0> trigger;
  vm_->getFunction("trigger", &trigger);
  ASSERT_TRUE(trigger != nullptr);
  trigger(&context);
  std::string exp_message = "Function: trigger failed";
  auto integration = static_cast<DummyIntegration *>(vm_->integration().get());
  EXPECT_TRUE(integration->error_message_.find(exp_message) != std::string::npos);

  if (runtime_ == "wamr" || runtime_ == "wasmtime") {
    // TODO(PiotrSikora): Stacktrace not supported in WAMR and Wasmtime.
    return;
  }
  exp_message = "Proxy-Wasm plugin in-VM backtrace:";
  EXPECT_TRUE(integration->error_message_.find(exp_message) != std::string::npos);

  if (runtime_ == "wavm") {
    // WAVM uses custom format for stacktraces.
    return;
  }
  exp_message = " - trigger";
  EXPECT_TRUE(integration->error_message_.find(exp_message) != std::string::npos);
}

TEST_P(TestVM, Trap2) {
  if (engine_ == "wavm") {
    // TODO(mathetake): Somehow WAVM exits with 'munmap_chunk(): invalid pointer' on unidentified
    // build condition in 'libstdc++ abi::__cxa_demangle' originally from
    // WAVM::Runtime::describeCallStack. Needs further investigation.
    return;
  }
  auto source = readTestWasmFile("trap.wasm");
  ASSERT_TRUE(vm_->load(source, {}, {}));
  ASSERT_TRUE(vm_->link(""));
  TestContext context;
  WasmCallWord<1> trigger2;
  vm_->getFunction("trigger2", &trigger2);
  ASSERT_TRUE(trigger2 != nullptr);
  trigger2(&context, 0);
  std::string exp_message = "Function: trigger2 failed";
  auto integration = static_cast<DummyIntegration *>(vm_->integration().get());
  EXPECT_TRUE(integration->error_message_.find(exp_message) != std::string::npos);
}

} // namespace
} // namespace proxy_wasm
