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

#include <deque>
#include <map>
#include <memory>
#include <mutex>
#include <unordered_map>
#include <unordered_set>

#include "include/proxy-wasm/vm_id_handle.h"

namespace proxy_wasm {

SharedQueue global_shared_queue;

SharedQueue::SharedQueue() {
  registerVmIdHandleCallback([this](std::string_view vm_id) { this->deleteByVmId(vm_id); });
}

void SharedQueue::deleteByVmId(std::string_view vm_id) {}

uint32_t SharedQueue::registerQueue(std::string_view vm_id, std::string_view queue_name,
                                    uint32_t context_id, CallOnThreadFunction call_on_thread,
                                    std::string_view vm_key) {
  std::lock_guard<std::mutex> lock(mutex_);
  auto key = std::make_pair(std::string(vm_id), std::string(queue_name));
  auto it = queue_tokens_.insert(std::make_pair(key, static_cast<uint32_t>(0)));
  if (it.second) {
    it.first->second = nextQueueToken();
    queue_token_set_.insert(it.first->second);
  }
  uint32_t token = it.first->second;
  auto &q = queues_[token];
  q.vm_key = std::string(vm_key);
  q.context_id = context_id;
  q.call_on_thread = std::move(call_on_thread);
  // Preserve any existing data.
  return token;
}

uint32_t SharedQueue::resolveQueue(std::string_view vm_id, std::string_view queue_name) {
  std::lock_guard<std::mutex> lock(mutex_);
  auto key = std::make_pair(std::string(vm_id), std::string(queue_name));
  auto it = queue_tokens_.find(key);
  if (it != queue_tokens_.end()) {
    return it->second;
  }
  return 0; // N.B. zero indicates that the queue was not found.
}

WasmResult SharedQueue::dequeue(uint32_t token, std::string *data) {
  std::lock_guard<std::mutex> lock(mutex_);
  auto it = queues_.find(token);
  if (it == queues_.end()) {
    return WasmResult::NotFound;
  }
  if (it->second.queue.empty()) {
    return WasmResult::Empty;
  }
  *data = it->second.queue.front();
  it->second.queue.pop_front();
  return WasmResult::Ok;
}

WasmResult SharedQueue::enqueue(uint32_t token, std::string_view value) {
  std::string vm_key;
  uint32_t context_id;
  CallOnThreadFunction call_on_thread;

  {
    std::lock_guard<std::mutex> lock(mutex_);
    auto it = queues_.find(token);
    if (it == queues_.end()) {
      return WasmResult::NotFound;
    }
    Queue *target_queue = &(it->second);
    vm_key = target_queue->vm_key;
    context_id = target_queue->context_id;
    call_on_thread = target_queue->call_on_thread;
    target_queue->queue.push_back(std::string(value));
  }

  call_on_thread([vm_key, context_id, token] {
    // This code may or may not execute in another thread.
    // Make sure that the lock is no longer held here.
    auto wasm = getThreadLocalWasm(vm_key);
    if (wasm) {
      auto context = wasm->wasm()->getContext(context_id);
      if (context) {
        context->onQueueReady(token);
      }
    }
  });
  return WasmResult::Ok;
}

} // namespace proxy_wasm
