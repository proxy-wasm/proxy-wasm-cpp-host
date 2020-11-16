#include "src/shared_data.h"

#include <deque>
#include <map>
#include <memory>
#include <mutex>
#include <unordered_map>
#include <unordered_set>

namespace proxy_wasm {

WasmResult SharedData::get(std::string_view vm_id, const std::string_view key,
                           std::pair<std::string, uint32_t> *result) {
  std::lock_guard<std::mutex> lock(mutex_);
  auto map = data_.find(std::string(vm_id));
  if (map == data_.end()) {
    return WasmResult::NotFound;
  }
  auto it = map->second.find(std::string(key));
  if (it != map->second.end()) {
    *result = it->second;
    return WasmResult::Ok;
  }
  return WasmResult::NotFound;
}

WasmResult SharedData::set(std::string_view vm_id, std::string_view key, std::string_view value,
                           uint32_t cas) {
  std::lock_guard<std::mutex> lock(mutex_);
  std::unordered_map<std::string, std::pair<std::string, uint32_t>> *map;
  auto map_it = data_.find(std::string(vm_id));
  if (map_it == data_.end()) {
    map = &data_[std::string(vm_id)];
  } else {
    map = &map_it->second;
  }
  auto it = map->find(std::string(key));
  if (it != map->end()) {
    if (cas && cas != it->second.second) {
      return WasmResult::CasMismatch;
    }
    it->second = std::make_pair(std::string(value), nextCas());
  } else {
    map->emplace(key, std::make_pair(std::string(value), nextCas()));
  }
  return WasmResult::Ok;
}

uint32_t SharedData::registerQueue(std::string_view vm_id, std::string_view queue_name,
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

uint32_t SharedData::resolveQueue(std::string_view vm_id, std::string_view queue_name) {
  std::lock_guard<std::mutex> lock(mutex_);
  auto key = std::make_pair(std::string(vm_id), std::string(queue_name));
  auto it = queue_tokens_.find(key);
  if (it != queue_tokens_.end()) {
    return it->second;
  }
  return 0; // N.B. zero indicates that the queue was not found.
}

WasmResult SharedData::dequeue(uint32_t token, std::string *data) {
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

WasmResult SharedData::enqueue(uint32_t token, std::string_view value) {
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