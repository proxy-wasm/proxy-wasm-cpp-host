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

#include <memory>
#include <string>
#include <vector>

#include "include/proxy-wasm/wasm_vm.h"

#include "test/utility.h"

namespace proxy_wasm {
namespace {

std::vector<std::string> getDynEngines() {
  std::vector<std::string> engines = {
#if defined(PROXY_WASM_HOST_ENGINE_DYN)
    "dyn",
#endif
    ""
  };
  engines.pop_back();
  return engines;
}

INSTANTIATE_TEST_SUITE_P(WasmEngines, TestVm, testing::ValuesIn(getDynEngines()),
                         [](const testing::TestParamInfo<std::string> &info) {
                           return info.param;
                         });

TEST_P(TestVm, Basic) {
  EXPECT_EQ(vm_->getEngineName(), engine_);
  EXPECT_EQ(vm_->getEngineName(), "dyn");
  EXPECT_EQ(vm_->cloneable(), proxy_wasm::Cloneable::InstantiatedModule);
}

TEST_P(TestVm, Memory) {
  auto source = readTestWasmFile("abi_export.so");
  ASSERT_TRUE(vm_->load(source, {}, {}));
  ASSERT_TRUE(vm_->link(""));

  uint64_t raw_word = 0;

  Word word;
  ASSERT_TRUE(vm_->setWord(reinterpret_cast<uint64_t>(&raw_word), Word(100)));
  ASSERT_TRUE(vm_->getWord(reinterpret_cast<uint64_t>(&raw_word), &word));
  ASSERT_EQ(100, word.u64_);
  ASSERT_EQ(100, raw_word);

  uint32_t raw_data[2] = {0, 0};

  uint32_t data[2] = {htowasm(static_cast<uint32_t>(-1), vm_->usesWasmByteOrder()),
                      htowasm(200, vm_->usesWasmByteOrder())};
  ASSERT_TRUE(vm_->setMemory(reinterpret_cast<uint64_t>(&raw_data[0]), sizeof(int32_t) * 2,
                             static_cast<void *>(data)));
  ASSERT_TRUE(vm_->getWord(reinterpret_cast<uint64_t>(&raw_data[0]), &word));
  ASSERT_EQ(-1, static_cast<int32_t>(word.u64_));
  ASSERT_TRUE(vm_->getWord(reinterpret_cast<uint64_t>(&raw_data[1]), &word));
  ASSERT_EQ(200, static_cast<int32_t>(word.u64_));
}

TEST_P(TestVm, ReadWrite) {
  auto source = readTestWasmFile("abi_export.so");
  ASSERT_TRUE(vm_->load(source, {}, {}));
  ASSERT_TRUE(vm_->link(""));
  BufferBase buffer;
  buffer.set("test data");
  uint64_t buffer_raw = 0;
  uint64_t buffer_len = 0;
  auto wasm = TestWasm(std::move(vm_), {});
  ASSERT_TRUE(wasm.initialize());
  ASSERT_EQ(buffer.copyTo(&wasm, 0, buffer.size(), reinterpret_cast<uint64_t>(&buffer_raw),
                          reinterpret_cast<uint64_t>(&buffer_len)),
            WasmResult::Ok);

  ASSERT_NE(buffer_raw, 0);
  ASSERT_NE(buffer_len, 0);

  char *buffer_ptr = reinterpret_cast<char *>(buffer_raw);
  ASSERT_EQ(buffer_len, buffer.size());
  std::string buffer_str(buffer_ptr, buffer_ptr + buffer_len);
  ASSERT_EQ(buffer_str, "test data");
}

} // namespace
} // namespace proxy_wasm
