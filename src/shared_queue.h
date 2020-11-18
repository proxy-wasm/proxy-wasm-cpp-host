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
  uint32_t registerQueue(std::string_view vm_id, std::string_view queue_name, uint32_t context_id,
                         CallOnThreadFunction call_on_thread, std::string_view vm_key);
  uint32_t resolveQueue(std::string_view vm_id, std::string_view queue_name);
  WasmResult dequeue(uint32_t token, std::string *data);
  WasmResult enqueue(uint32_t token, std::string_view value);

private:
  uint32_t nextQueueToken() {
    while (true) {
      uint32_t token = next_queue_token_++;
      if (token == 0) {
        continue; // 0 is an illegal token.
      }
      if (queue_token_set_.find(token) == queue_token_set_.end()) {
        return token;
      }
    }
  }

  struct Queue {
    std::string vm_key;
    uint32_t context_id;
    CallOnThreadFunction call_on_thread;
    std::deque<std::string> queue;
  };

  // TODO: use std::shared_mutex in C++17.
  std::mutex mutex_;
  std::map<uint32_t, Queue> queues_;
  uint32_t next_queue_token_ = 1;
  struct pair_hash {
    template <class T1, class T2> std::size_t operator()(const std::pair<T1, T2> &pair) const {
      return std::hash<T1>()(pair.first) ^ std::hash<T2>()(pair.second);
    }
  };
  std::unordered_map<std::pair<std::string, std::string>, uint32_t, pair_hash> queue_tokens_;
  std::unordered_set<uint32_t> queue_token_set_;
};

extern SharedQueue global_shared_queue;

} // namespace proxy_wasm
