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

#pragma once

#include <mutex>

#include "include/proxy-wasm/wasm.h"

namespace proxy_wasm {

class SharedQueue {
public:
  SharedQueue(bool register_vm_id_callback = true);

  uint32_t registerQueue(std::string_view vm_id, std::string_view queue_name, uint32_t context_id,
                         CallOnThreadFunction call_on_thread, std::string_view vm_key);
  uint32_t resolveQueue(std::string_view vm_id, std::string_view queue_name);
  WasmResult dequeue(uint32_t token, std::string *data);
  WasmResult enqueue(uint32_t token, std::string_view value);

  void deleteByVmId(std::string_view vm_id);
  uint32_t nextQueueToken();

private:
  std::size_t queueKeyHash(std::string_view vm_id, std::string_view queue_name) {
    return std::hash<std::string_view>()(vm_id) ^ std::hash<std::string_view>()(queue_name);
  };

  struct Queue {
    std::string vm_key;
    uint32_t context_id;
    CallOnThreadFunction call_on_thread;
    std::deque<std::string> queue;
  };

  // TODO: use std::shared_mutex in C++17.
  std::mutex mutex_;
  uint32_t next_queue_token_ = 1;

  // vm_id -> queue keys
  std::unordered_map<std::string, std::unordered_set<std::size_t>> vm_queue_keys_;

  // queue key -> token
  std::unordered_map<std::size_t, uint32_t> queue_tokens_;

  // token -> queue
  std::map<uint32_t, Queue> queues_;
};

extern SharedQueue global_shared_queue;

} // namespace proxy_wasm
