// Copyright 2016-2019 Envoy Project Authors
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

#include <memory>
#include <string>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/wasm.h"
#include "include/proxy-wasm/wasmtime.h"

#include "wasmtime/include/wasm.h"
#include "wasmtime/include/wasmtime.h"

#include "test/watdata.h"
#include "gtest/gtest.h"

namespace proxy_wasm {
namespace {

TEST(Wasmtime, CreateVM) {
  auto vm = proxy_wasm::createWasmtimeVm();
  EXPECT_EQ(vm->cloneable(), proxy_wasm::Cloneable::CompiledBytecode);
  EXPECT_EQ(vm->runtime(), "wasmtime");
}

struct DummyIntegration : public WasmVmIntegration {
  ~DummyIntegration() override{};
  WasmVmIntegration *clone() override { return new DummyIntegration{}; }
  void error(std::string_view message) override {
    std::cout << "ERROR from integration: " << message << std::endl;
    error_messages_ += message;
  }
  bool getNullVmFunction(std::string_view function_name, bool returns_word, int number_of_arguments,
                         NullPlugin *plugin, void *ptr_to_function_return) override {
    return false;
  };
  std::string error_messages_;
};

class WasmtimeTestVM : public testing::Test {
public:
  std::unique_ptr<proxy_wasm::WasmVm> vm_;

  WasmtimeTestVM() : vm_(proxy_wasm::createWasmtimeVm()) {
    vm_->integration().reset(new DummyIntegration{});
  }

  void initialize(std::string wat_str) {
    wasm_byte_vec_t wat;
    wasm_byte_vec_new_uninitialized(&wat, wat_str.size());
    ::memcpy(wat.data, wat_str.data(), wat_str.size());

    wasm_byte_vec_t source;
    wasmtime_error_t *error = wasmtime_wat2wasm(&wat, &source);
    EXPECT_TRUE(error == nullptr);
    source_ = std::string(source.data, source.size);

    wasm_byte_vec_delete(&wat);
    wasm_byte_vec_delete(&source);
  }
  std::string source_;
};

TEST_F(WasmtimeTestVM, ABIVersion) {
  initialize(wat_data::AbiVersion);
  ASSERT_TRUE(vm_->load(source_, false));
  ASSERT_EQ(vm_->getAbiVersion(), AbiVersion::ProxyWasm_0_2_0);
}

TEST_F(WasmtimeTestVM, CustomSection) {
  initialize(wat_data::AbiVersion);
  char custom_section[12] = {
      0x00,                         // custom section id
      0x0a,                         // section length
      0x04, 0x6e, 0x61, 0x6d, 0x65, // section name: "name"
      0x68, 0x65, 0x6c, 0x6c, 0x6f, // content: "hello"
  };

  source_ = source_.append(&custom_section[0], 12);
  ASSERT_TRUE(vm_->load(source_, false));
  auto name_section = vm_->getCustomSection("name");
  ASSERT_EQ(name_section, "hello");
}

// TEST_F(WasmtimeTestVM, Memory) {
//   initialize(wat_data::Memory);
//   ASSERT_TRUE(vm_->load(source_, false));
//   ASSERT_TRUE(vm_->link(""));
//   ASSERT_EQ(vm_->getAbiVersion(), AbiVersion::Unknown);

//   ASSERT_EQ(vm_->getMemorySize(), 0x20000);

//   Word word;
//   ASSERT_TRUE(vm_->getWord(0, &word));
//   ASSERT_EQ(0, word);
//   ASSERT_TRUE(vm_->getWord(0x1000, &word));
//   ASSERT_EQ(1, word.u64_);
//   ASSERT_TRUE(vm_->getWord(0x100c, &word));
//   ASSERT_EQ(4, word.u64_);

//   ASSERT_TRUE(vm_->setWord(0x2000, Word(100)));
//   ASSERT_TRUE(vm_->getWord(0x2000, &word));
//   ASSERT_EQ(100, word.u64_);

//   int32_t data[2] = {-1, 200};
//   ASSERT_TRUE(vm_->setMemory(0x200, sizeof(int32_t) * 2, static_cast<void *>(data)));
//   ASSERT_TRUE(vm_->getWord(0x200, &word));
//   ASSERT_EQ(-1, static_cast<int32_t>(word.u64_));
//   ASSERT_TRUE(vm_->getWord(0x204, &word));
//   ASSERT_EQ(200, static_cast<int32_t>(word.u64_));
// }

TEST_F(WasmtimeTestVM, Clone) {
  initialize(wat_data::Memory);
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

void callback(void *raw_context) {
  TestContext *context = static_cast<TestContext *>(raw_context);
  context->increment();
}

Word callback2(void *raw_context, Word val) { return val + 100; }

TEST_F(WasmtimeTestVM, Callback) {
  initialize(wat_data::Callback);
  ASSERT_TRUE(vm_->load(source_, false));

  TestContext context;
  current_context_ = &context;

  vm_->registerCallback(
      "hostenv", "callback", &callback,
      &ConvertFunctionWordToUint32<decltype(callback), callback>::convertFunctionWordToUint32);

  vm_->registerCallback(
      "hostenv2", "callback2", &callback2,
      &ConvertFunctionWordToUint32<decltype(callback2), callback2>::convertFunctionWordToUint32);

  ASSERT_TRUE(vm_->link(""));

  WasmCallVoid<0> run;
  vm_->getFunction("run", &run);
  EXPECT_TRUE(run != nullptr);
  for (auto i = 0; i < 100; i++)
    run(current_context_);
  ASSERT_EQ(context.counter, 100);

  WasmCallWord<1> run2;
  vm_->getFunction("run2", &run2);
  Word res = run2(current_context_, Word{0});
  ASSERT_EQ(res.u32(), 100100); // 10000 (global) + 100(in callback)
}

} // namespace
} // namespace proxy_wasm
