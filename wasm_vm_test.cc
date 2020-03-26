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

#include "include/proxy-wasm/wasm_vm.h"

#include "gtest/gtest.h"

namespace proxy_wasm {
namespace {

TEST(WasmVm, Compat) {
  string_view foo = "foo";
  std::string bar = "bar";

  EXPECT_NE(foo, bar);
  EXPECT_EQ(foo, "foo");

  optional<int> o = PROXY_WASM_NULLOPT;
  EXPECT_FALSE(o);

  o = 1;
  EXPECT_TRUE(o);
}

TEST(WasmVm, Word) {
  Word w(1);
  EXPECT_EQ(w.u32(), 1);
  EXPECT_EQ(sizeof(w.u32()), sizeof(uint32_t));
  EXPECT_EQ(w, 1);
  EXPECT_EQ(sizeof(w), sizeof(uint64_t));
}

} // namespace
} // namespace proxy_wasm
