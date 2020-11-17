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

#include "src/shared_data.h"

#include "gtest/gtest.h"

namespace proxy_wasm {

TEST(SharedData, SingleThread) {
  SharedData shared_data;
  std::pair<std::string, uint32_t> result;
  EXPECT_EQ(WasmResult::NotFound, shared_data.get("non-exist", "non-exists", &result));

  std::string_view vm_id = "id";
  std::string_view key = "key";
  std::string_view value = "1";
  EXPECT_EQ(WasmResult::Ok, shared_data.set(vm_id, key, value, 0));
  // ok for cas == 0
  EXPECT_EQ(WasmResult::Ok, shared_data.set(vm_id, key, value, 0));
  EXPECT_EQ(WasmResult::CasMismatch, shared_data.set(vm_id, key, value, 100));

  EXPECT_EQ(WasmResult::Ok, shared_data.get(vm_id, key, &result));
  EXPECT_EQ(value, result.first);
  value = "2";
  EXPECT_EQ(result.second, 2);

  EXPECT_EQ(WasmResult::Ok, shared_data.set(vm_id, key, value, result.second));
  EXPECT_EQ(WasmResult::Ok, shared_data.get(vm_id, key, &result));
  EXPECT_EQ(value, result.first);
  EXPECT_EQ(result.second, 3);
}

// TODO(mathetake): add test cases for concurrent read/write

} // namespace proxy_wasm
