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

#include <deque>
#include <memory>
#include <map>
#include <mutex>
#include <unordered_map>
#include <unordered_set>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/wasm.h"

namespace proxy_wasm {

namespace {

class DeferAfterCallActions {
public:
  DeferAfterCallActions(ContextBase *context) : wasm_(context->wasm()) {}
  ~DeferAfterCallActions() { wasm_->doAfterVmCallActions(); }

private:
  WasmBase *const wasm_;
};

using CallOnThreadFunction = std::function<void(std::function<void()>)>;

class SharedData {
public:
  WasmResult get(string_view vm_id, const string_view key,
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

  WasmResult set(string_view vm_id, string_view key, string_view value, uint32_t cas) {
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

  uint32_t registerQueue(string_view vm_id, string_view queue_name, uint32_t context_id,
                         CallOnThreadFunction call_on_thread) {
    std::lock_guard<std::mutex> lock(mutex_);
    auto key = std::make_pair(std::string(vm_id), std::string(queue_name));
    auto it = queue_tokens_.insert(std::make_pair(key, static_cast<uint32_t>(0)));
    if (it.second) {
      it.first->second = nextQueueToken();
      queue_token_set_.insert(it.first->second);
    }
    uint32_t token = it.first->second;
    auto &q = queues_[token];
    q.vm_id = std::string(vm_id);
    q.context_id = context_id;
    q.call_on_thread = std::move(call_on_thread);
    // Preserve any existing data.
    return token;
  }

  uint32_t resolveQueue(string_view vm_id, string_view queue_name) {
    std::lock_guard<std::mutex> lock(mutex_);
    auto key = std::make_pair(std::string(vm_id), std::string(queue_name));
    auto it = queue_tokens_.find(key);
    if (it != queue_tokens_.end()) {
      return it->second;
    }
    return 0; // N.B. zero indicates that the queue was not found.
  }

  WasmResult dequeue(uint32_t token, std::string *data) {
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
  WasmResult enqueue(uint32_t token, string_view value) {
    std::lock_guard<std::mutex> lock(mutex_);
    auto it = queues_.find(token);
    if (it == queues_.end()) {
      return WasmResult::NotFound;
    }
    it->second.queue.push_back(std::string(value));
    auto vm_id = it->second.vm_id;
    auto context_id = it->second.context_id;
    it->second.call_on_thread([vm_id, context_id, token] {
      auto wasm = getThreadLocalWasm(vm_id);
      if (wasm) {
        wasm->wasm()->queueReady(context_id, token);
      }
    });
    return WasmResult::Ok;
  }

  uint32_t nextCas() {
    auto result = cas_;
    cas_++;
    if (!cas_) { // 0 is not a valid CAS value.
      cas_++;
    }
    return result;
  }

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
    std::string vm_id;
    uint32_t context_id;
    CallOnThreadFunction call_on_thread;
    std::deque<std::string> queue;
  };

  // TODO: use std::shared_mutex in C++17.
  std::mutex mutex_;
  uint32_t cas_ = 1;
  uint32_t next_queue_token_ = 1;
  std::map<std::string, std::unordered_map<std::string, std::pair<std::string, uint32_t>>> data_;
  std::map<uint32_t, Queue> queues_;
  struct pair_hash {
    template <class T1, class T2> std::size_t operator()(const std::pair<T1, T2> &pair) const {
      return std::hash<T1>()(pair.first) ^ std::hash<T2>()(pair.second);
    }
  };
  std::unordered_map<std::pair<std::string, std::string>, uint32_t, pair_hash> queue_tokens_;
  std::unordered_set<uint32_t> queue_token_set_;
};

SharedData global_shared_data;

} // namespace

// Test support.

uint32_t resolveQueueForTest(string_view vm_id, string_view queue_name) {
  return global_shared_data.resolveQueue(vm_id, queue_name);
}

std::string PluginBase::makeLogPrefix() const {
  std::string prefix;
  if (!name_.empty()) {
    prefix = prefix + " " + name_;
  }
  if (!root_id_.empty()) {
    prefix = prefix + " " + std::string(root_id_);
  }
  if (vm_id_.empty()) {
    prefix = prefix + " " + std::string(vm_id_);
  }
  return prefix;
}

ContextBase::ContextBase() : root_context_(this) {}

ContextBase::ContextBase(WasmBase *wasm) : wasm_(wasm), root_context_(this) {
  wasm_->contexts_[id_] = this;
}

ContextBase::ContextBase(WasmBase *wasm, std::shared_ptr<PluginBase> plugin) {
  initializeRootBase(wasm, plugin);
}

ContextBase::ContextBase(WasmBase *wasm, uint32_t root_context_id,
                         std::shared_ptr<PluginBase> plugin)
    : wasm_(wasm), id_(wasm->allocContextId()), root_context_id_(root_context_id), plugin_(plugin) {
  wasm_->contexts_[id_] = this;
  root_context_ = wasm_->contexts_[root_context_id_];
}

WasmVm *ContextBase::wasmVm() const { return wasm_->wasm_vm(); }

void ContextBase::initializeRootBase(WasmBase *wasm, std::shared_ptr<PluginBase> plugin) {
  wasm_ = wasm;
  id_ = wasm->allocContextId();
  root_id_ = plugin->root_id_;
  root_log_prefix_ = makeRootLogPrefix(plugin->vm_id_);
  root_context_ = this;
  wasm_->contexts_[id_] = this;
}

std::string ContextBase::makeRootLogPrefix(string_view vm_id) const {
  std::string prefix;
  if (!root_id_.empty()) {
    prefix = prefix + " " + std::string(root_id_);
  }
  if (vm_id.empty()) {
    prefix = prefix + " " + std::string(vm_id);
  }
  return prefix;
}

//
// Calls into the WASM code.
//
bool ContextBase::onStart(std::shared_ptr<PluginBase> plugin) {
  DeferAfterCallActions actions(this);
  bool result = 0;
  if (wasm_->on_context_create_) {
    plugin_ = plugin;
    wasm_->on_context_create_(this, id_, 0);
    plugin_.reset();
  }
  if (wasm_->on_vm_start_) {
    result =
        wasm_->on_vm_start_(this, id_, static_cast<uint32_t>(wasm()->vm_configuration().size()))
            .u64_ != 0;
    plugin_.reset();
  }
  return result;
}

bool ContextBase::onConfigure(std::shared_ptr<PluginBase> plugin) {
  if (!wasm_->on_configure_) {
    return true;
  }
  DeferAfterCallActions actions(this);
  plugin_ = plugin;
  auto result =
      wasm_->on_configure_(this, id_, static_cast<uint32_t>(plugin->plugin_configuration_.size()))
          .u64_ != 0;
  plugin_.reset();
  return result;
}

void ContextBase::onCreate(uint32_t parent_context_id) {
  if (wasm_->on_context_create_) {
    DeferAfterCallActions actions(this);
    wasm_->on_context_create_(this, id_, parent_context_id);
  }
}

// Shared Data
WasmResult ContextBase::getSharedData(string_view key, std::pair<std::string, uint32_t> *data) {
  return global_shared_data.get(wasm_->vm_id(), key, data);
}

WasmResult ContextBase::setSharedData(string_view key, string_view value, uint32_t cas) {
  return global_shared_data.set(wasm_->vm_id(), key, value, cas);
}

// Shared Queue

WasmResult ContextBase::registerSharedQueue(string_view queue_name,
                                            SharedQueueDequeueToken *result) {
  // Get the id of the root context if this is a stream context because onQueueReady is on the
  // root.
  *result = global_shared_data.registerQueue(wasm_->vm_id(), queue_name,
                                             isRootContext() ? id_ : root_context_id_,
                                             wasm_->callOnThreadFunction());
  return WasmResult::Ok;
}

WasmResult ContextBase::lookupSharedQueue(string_view vm_id, string_view queue_name,
                                          uint32_t *token_ptr) {
  uint32_t token = global_shared_data.resolveQueue(vm_id, queue_name);
  if (!token) {
    return WasmResult::NotFound;
  }
  *token_ptr = token;
  return WasmResult::Ok;
}

WasmResult ContextBase::dequeueSharedQueue(uint32_t token, std::string *data) {
  return global_shared_data.dequeue(token, data);
}

WasmResult ContextBase::enqueueSharedQueue(uint32_t token, string_view value) {
  return global_shared_data.enqueue(token, value);
}
void ContextBase::destroy() {
  if (destroyed_) {
    return;
  }
  destroyed_ = true;
  onDone();
}

void ContextBase::onTick(uint32_t) {
  if (wasm_->on_tick_) {
    DeferAfterCallActions actions(this);
    wasm_->on_tick_(this, id_);
  }
}

FilterStatus ContextBase::onNetworkNewConnection() {
  DeferAfterCallActions actions(this);
  onCreate(root_context_id_);
  if (!wasm_->on_new_connection_) {
    return FilterStatus::Continue;
  }
  if (wasm_->on_new_connection_(this, id_).u64_ == 0) {
    return FilterStatus::Continue;
  }
  return FilterStatus::StopIteration;
}

FilterStatus ContextBase::onDownstreamData(uint32_t data_length, bool end_of_stream) {
  if (!wasm_->on_downstream_data_) {
    return FilterStatus::Continue;
  }
  DeferAfterCallActions actions(this);
  auto result = wasm_->on_downstream_data_(this, id_, static_cast<uint32_t>(data_length),
                                           static_cast<uint32_t>(end_of_stream));
  // TODO(PiotrSikora): pull Proxy-WASM's FilterStatus values.
  return result.u64_ == 0 ? FilterStatus::Continue : FilterStatus::StopIteration;
}

FilterStatus ContextBase::onUpstreamData(uint32_t data_length, bool end_of_stream) {
  if (!wasm_->on_upstream_data_) {
    return FilterStatus::Continue;
  }
  DeferAfterCallActions actions(this);
  auto result = wasm_->on_upstream_data_(this, id_, static_cast<uint32_t>(data_length),
                                         static_cast<uint32_t>(end_of_stream));
  // TODO(PiotrSikora): pull Proxy-WASM's FilterStatus values.
  return result.u64_ == 0 ? FilterStatus::Continue : FilterStatus::StopIteration;
}

void ContextBase::onDownstreamConnectionClose(CloseType close_type) {
  if (wasm_->on_downstream_connection_close_) {
    DeferAfterCallActions actions(this);
    wasm_->on_downstream_connection_close_(this, id_, static_cast<uint32_t>(close_type));
  }
}

void ContextBase::onUpstreamConnectionClose(CloseType close_type) {
  if (wasm_->on_upstream_connection_close_) {
    DeferAfterCallActions actions(this);
    wasm_->on_upstream_connection_close_(this, id_, static_cast<uint32_t>(close_type));
  }
}

// Empty headers/trailers have zero size.
template <typename P> static uint32_t headerSize(const P &p) { return p ? p->size() : 0; }

FilterHeadersStatus ContextBase::onRequestHeaders(uint32_t headers) {
  DeferAfterCallActions actions(this);
  onCreate(root_context_id_);
  in_vm_context_created_ = true;
  if (!wasm_->on_request_headers_) {
    return FilterHeadersStatus::Continue;
  }
  if (static_cast<FilterHeadersStatus>(wasm_->on_request_headers_(this, id_, headers).u64_) ==
      FilterHeadersStatus::Continue) {
    return FilterHeadersStatus::Continue;
  }
  return FilterHeadersStatus::StopIteration;
}

FilterDataStatus ContextBase::onRequestBody(uint32_t data_length, bool end_of_stream) {
  if (!wasm_->on_request_body_) {
    return FilterDataStatus::Continue;
  }
  DeferAfterCallActions actions(this);
  auto result =
      wasm_->on_request_body_(this, id_, data_length, static_cast<uint32_t>(end_of_stream)).u64_;
  if (result > static_cast<uint64_t>(FilterDataStatus::StopIterationNoBuffer))
    return FilterDataStatus::StopIterationNoBuffer;
  return static_cast<FilterDataStatus>(result);
}

FilterTrailersStatus ContextBase::onRequestTrailers(uint32_t trailers) {
  if (!wasm_->on_request_trailers_) {
    return FilterTrailersStatus::Continue;
  }
  DeferAfterCallActions actions(this);
  if (static_cast<FilterTrailersStatus>(wasm_->on_request_trailers_(this, id_, trailers).u64_) ==
      FilterTrailersStatus::Continue) {
    return FilterTrailersStatus::Continue;
  }
  return FilterTrailersStatus::StopIteration;
}

FilterMetadataStatus ContextBase::onRequestMetadata(uint32_t elements) {
  if (!wasm_->on_request_metadata_) {
    return FilterMetadataStatus::Continue;
  }
  DeferAfterCallActions actions(this);
  if (static_cast<FilterMetadataStatus>(wasm_->on_request_metadata_(this, id_, elements).u64_) ==
      FilterMetadataStatus::Continue) {
    return FilterMetadataStatus::Continue;
  }
  return FilterMetadataStatus::Continue; // This is currently the only return code.
}

FilterHeadersStatus ContextBase::onResponseHeaders(uint32_t headers) {
  DeferAfterCallActions actions(this);
  if (!in_vm_context_created_) {
    // If the request is invalid then onRequestHeaders() will not be called and neither will
    // onCreate() then sendLocalReply be called which will call this function. In this case we
    // need to call onCreate() so that the Context inside the VM is created before the
    // onResponseHeaders() call.
    onCreate(root_context_id_);
    in_vm_context_created_ = true;
  }
  if (!wasm_->on_response_headers_) {
    return FilterHeadersStatus::Continue;
  }
  if (static_cast<FilterHeadersStatus>(wasm_->on_response_headers_(this, id_, headers).u64_) ==
      FilterHeadersStatus::Continue) {
    return FilterHeadersStatus::Continue;
  }
  return FilterHeadersStatus::StopIteration;
}

FilterDataStatus ContextBase::onResponseBody(uint32_t body_length, bool end_of_stream) {
  if (!wasm_->on_response_body_) {
    return FilterDataStatus::Continue;
  }
  DeferAfterCallActions actions(this);
  auto result =
      wasm_->on_response_body_(this, id_, body_length, static_cast<uint32_t>(end_of_stream)).u64_;
  if (result > static_cast<uint64_t>(FilterDataStatus::StopIterationNoBuffer))
    return FilterDataStatus::StopIterationNoBuffer;
  return static_cast<FilterDataStatus>(result);
}

FilterTrailersStatus ContextBase::onResponseTrailers(uint32_t trailers) {
  if (!wasm_->on_response_trailers_) {
    return FilterTrailersStatus::Continue;
  }
  DeferAfterCallActions actions(this);
  if (static_cast<FilterTrailersStatus>(wasm_->on_response_trailers_(this, id_, trailers).u64_) ==
      FilterTrailersStatus::Continue) {
    return FilterTrailersStatus::Continue;
  }
  return FilterTrailersStatus::StopIteration;
}

FilterMetadataStatus ContextBase::onResponseMetadata(uint32_t elements) {
  if (!wasm_->on_response_metadata_) {
    return FilterMetadataStatus::Continue;
  }
  DeferAfterCallActions actions(this);
  if (static_cast<FilterMetadataStatus>(wasm_->on_response_metadata_(this, id_, elements).u64_) ==
      FilterMetadataStatus::Continue) {
    return FilterMetadataStatus::Continue;
  }
  return FilterMetadataStatus::Continue; // This is currently the only return code.
}

void ContextBase::onHttpCallResponse(uint32_t token, uint32_t headers, uint32_t body_size,
                                     uint32_t trailers) {
  if (!wasm_->on_http_call_response_) {
    return;
  }
  DeferAfterCallActions actions(this);
  wasm_->on_http_call_response_(this, id_, token, headers, body_size, trailers);
}

void ContextBase::onQueueReady(uint32_t token) {
  if (wasm_->on_queue_ready_) {
    DeferAfterCallActions actions(this);
    wasm_->on_queue_ready_(this, id_, token);
  }
}

void ContextBase::onGrpcReceiveInitialMetadata(uint32_t token, uint32_t elements) {
  if (!wasm_->on_grpc_receive_initial_metadata_) {
    return;
  }
  DeferAfterCallActions actions(this);
  wasm_->on_grpc_receive_initial_metadata_(this, id_, token, elements);
}

void ContextBase::onGrpcReceiveTrailingMetadata(uint32_t token, uint32_t trailers) {
  if (!wasm_->on_grpc_receive_trailing_metadata_) {
    return;
  }
  DeferAfterCallActions actions(this);
  wasm_->on_grpc_receive_trailing_metadata_(this, id_, token, trailers);
}

void ContextBase::onGrpcReceive(uint32_t token, uint32_t response_size) {
  if (!wasm_->on_grpc_receive_) {
    return;
  }
  DeferAfterCallActions actions(this);
  wasm_->on_grpc_receive_(this, id_, token, response_size);
}

void ContextBase::onGrpcClose(uint32_t token, uint32_t status_code) {
  if (!wasm_->on_grpc_close_) {
    return;
  }
  DeferAfterCallActions actions(this);
  wasm_->on_grpc_close_(this, id_, token, status_code);
}

bool ContextBase::onDone() {
  DeferAfterCallActions actions(this);
  if (wasm_->on_done_) {
    return wasm_->on_done_(this, id_).u64_ != 0;
  }
  return true;
}

void ContextBase::onLog() {
  DeferAfterCallActions actions(this);
  if (wasm_->on_log_) {
    wasm_->on_log_(this, id_);
  }
}

void ContextBase::onDelete() {
  DeferAfterCallActions actions(this);
  if (wasm_->on_delete_) {
    wasm_->on_delete_(this, id_);
  }
}

ContextBase::~ContextBase() {
  // Do not remove vm or root contexts which have the same lifetime as wasm_.
  if (root_context_id_) {
    wasm_->contexts_.erase(id_);
  }
}

} // namespace proxy_wasm
