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

#include "src/shared_queue.h"

#include "gtest/gtest.h"

namespace proxy_wasm {

TEST(SharedQueue, SingleThread) {
  SharedQueue shared_queue;
  std::string_view vm_id = "id";
  std::string_view vm_key = "vm_key";
  std::string_view queue_name = "name";
  uint32_t context_id = 1;

  EXPECT_EQ(1, shared_queue.registerQueue(vm_id, queue_name, context_id, nullptr, vm_key));
  EXPECT_EQ(1, shared_queue.resolveQueue(vm_id, queue_name));
  EXPECT_EQ(0, shared_queue.resolveQueue(vm_id, "non-exist"));
  EXPECT_EQ(0, shared_queue.resolveQueue("non-exist", queue_name));

  bool called = false;
  std::function<void(std::function<void()>)> call_on_thread =
      [&called](const std::function<void()> &f) {
        called = true;
        f(); // TODO(mathetake): test whether onQueueReady is called with mock WasmHandle
      };
  queue_name = "name2";
  auto token = shared_queue.registerQueue(vm_id, queue_name, context_id, call_on_thread, vm_key);
  EXPECT_EQ(2, token);

  std::string data;
  EXPECT_EQ(WasmResult::NotFound, shared_queue.dequeue(0, &data));
  EXPECT_EQ(WasmResult::Empty, shared_queue.dequeue(token, &data));

  std::string value = "value";
  EXPECT_EQ(WasmResult::NotFound, shared_queue.enqueue(0, value));
  EXPECT_EQ(WasmResult::Ok, shared_queue.enqueue(token, value));
  EXPECT_TRUE(called);

  EXPECT_EQ(WasmResult::Ok, shared_queue.dequeue(token, &data));
  EXPECT_EQ(data, "value");
}

// TODO(mathetake): add test cases for concurrent read/write

} // namespace proxy_wasm
