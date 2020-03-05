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

#pragma once

#include "include/proxy-wasm/compat.h"

#include <time.h>
#include <atomic>
#include <iostream>
#include <map>
#include <memory>
#include <vector>

namespace proxy_wasm {

#include "proxy_wasm_common.h"
#include "proxy_wasm_enums.h"

class WasmBase;
class WasmVm;

using Pairs = std::vector<std::pair<string_view, string_view>>;
using PairsWithStringValues = std::vector<std::pair<string_view, std::string>>;
using CallOnThreadFunction = std::function<void(std::function<void()>)>;

struct BufferInterface {
  virtual ~BufferInterface() {}
  virtual size_t size() const = 0;
  // Returns true on success.
  virtual bool copyTo(WasmBase *wasm, size_t start, size_t length, uint64_t ptr_ptr,
                      uint64_t size_ptr) const = 0;
};

// Opaque context object.
class StorageObject {
public:
  virtual ~StorageObject() = default;
};

struct PluginBase {
  PluginBase(string_view name, string_view root_id, string_view vm_id,
             string_view plugin_configuration)
      : name_(std::string(name)), root_id_(std::string(root_id)), vm_id_(std::string(vm_id)),
        plugin_configuration_(plugin_configuration) {}

  const std::string name_;
  const std::string root_id_;
  const std::string vm_id_;
  std::string plugin_configuration_;
  const std::string &log_prefix() const { return log_prefix_; }

private:
  std::string makeLogPrefix() const;

  std::string log_prefix_;
};

// A context which will be the target of callbacks for a particular session
// e.g. a handler of a stream.
class ContextBase {
public:
  ContextBase();                                                   // Testing.
  ContextBase(WasmBase *wasm);                                     // Vm Context.
  ContextBase(WasmBase *wasm, std::shared_ptr<PluginBase> plugin); // Root Context.
  ContextBase(WasmBase *wasm, uint32_t root_context_id,
              std::shared_ptr<PluginBase> plugin); // Stream context.
  virtual ~ContextBase();

  WasmBase *wasm() const { return wasm_; }
  uint32_t id() const { return id_; }
  bool isVmContext() { return id_ == 0; }
  bool isRootContext() { return root_context_id_ == 0; }
  ContextBase *root_context() { return root_context_; }
  string_view root_id() const { return plugin_->root_id_; }
  string_view log_prefix() const { return plugin_->log_prefix(); }
  WasmVm *wasmVm() const;

  // Called before deleting the context.
  virtual void destroy();

  //
  // VM level downcalls into the WASM code on Context(id == 0).
  //
  virtual bool onStart(std::shared_ptr<PluginBase> plugin);
  virtual bool onConfigure(std::shared_ptr<PluginBase> plugin);

  //
  // Stream downcalls on Context(id > 0).
  //
  // General stream downcall on a new stream.
  virtual void onCreate(uint32_t root_context_id);
  // Network
  virtual FilterStatus onNetworkNewConnection() {
    unimplemented();
    return FilterStatus::Continue;
  }
  virtual FilterStatus onDownstreamData(int /* data_length */, bool /* end_of_stream */) {
    unimplemented();
    return FilterStatus::Continue;
  }
  virtual FilterStatus onUpstreamData(int /* data_length */, bool /* end_of_stream */) {
    unimplemented();
    return FilterStatus::Continue;
  }
  enum class PeerType : uint32_t {
    Unknown = 0,
    Local = 1,
    Remote = 2,
  };
  virtual void onDownstreamConnectionClose(PeerType) { unimplemented(); }
  virtual void onUpstreamConnectionClose(PeerType) { unimplemented(); }
  // HTTP Filter Stream Request Downcalls.
  virtual FilterHeadersStatus onRequestHeaders() {
    unimplemented();
    return FilterHeadersStatus::Continue;
  }
  virtual FilterDataStatus onRequestBody(int /* body_buffer_length */, bool /* end_of_stream */) {
    unimplemented();
    return FilterDataStatus::Continue;
  }
  virtual FilterTrailersStatus onRequestTrailers() {
    unimplemented();
    return FilterTrailersStatus::Continue;
  }
  virtual FilterMetadataStatus onRequestMetadata() {
    unimplemented();
    return FilterMetadataStatus::Continue;
  }
  // HTTP Filter Stream Response Downcalls.
  virtual FilterHeadersStatus onResponseHeaders() {
    unimplemented();
    return FilterHeadersStatus::Continue;
  }
  virtual FilterDataStatus onResponseBody(int /* body_buffer_length */, bool /* end_of_stream */) {
    unimplemented();
    return FilterDataStatus::Continue;
  }
  virtual FilterTrailersStatus onResponseTrailers() {
    unimplemented();
    return FilterTrailersStatus::Continue;
  }
  virtual FilterMetadataStatus onResponseMetadata() {
    unimplemented();
    return FilterMetadataStatus::Continue;
  }
  // Async call response.
  virtual void onHttpCallResponse(uint32_t /* token */, uint32_t /* headers */,
                                  uint32_t /* body_size */, uint32_t /* trailers */) {}
  // Inter-VM shared queue message arrival.
  virtual void onQueueReady(uint32_t /* token */) { unimplemented(); }
  // General stream downcall when the stream/vm has ended.
  virtual bool onDone();
  // General stream downcall for logging. Occurs after onDone().
  virtual void onLog();
  // General stream downcall when no further stream calls will occur.
  virtual void onDelete();

  virtual void error(string_view message) {
    std::cerr << message << "\n";
    abort();
  }
  virtual void unimplemented() { error("unimplemented proxy-wasm API"); }

  //
  // General Callbacks.
  //
  virtual WasmResult log(uint64_t /* level */, string_view /* message */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult setTimerPeriod(std::chrono::milliseconds /* period */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual uint64_t getCurrentTimeNanoseconds() {
    struct timespec tpe;
    clock_gettime(CLOCK_REALTIME, &tpe);
    uint64_t t = tpe.tv_sec;
    t *= 1000000000;
    t += tpe.tv_nsec;
    return t;
  }
  virtual std::pair<uint32_t, string_view> getStatus() {
    unimplemented();
    return std::make_pair(1, "unimplmemented");
  }

  // Buffer
  virtual const BufferInterface *getBuffer(WasmBufferType /* type */) {
    unimplemented();
    return nullptr;
  }
  virtual bool end_of_stream() {
    unimplemented();
    return true;
  }

  // HTTP
  // Returns a token which will be used with the corresponding onHttpCallResponse.
  virtual WasmResult httpCall(string_view /* target */, const Pairs & /*request_headers */,
                              string_view /* request_body */, const Pairs & /* request_trailers */,
                              int /* timeout_millisconds */, uint32_t * /* token_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // gRPC
  // Returns a token which will be used with the corresponding onGrpc and grpc calls.
  virtual WasmResult grpcCall(string_view /* grpc_service */, string_view /* service_name */,
                              string_view /* method_name */, string_view /* request */,
                              const optional<std::chrono::milliseconds> & /* timeout */,
                              uint32_t * /* token_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult grpcStream(string_view /* grpc_service */, string_view /* service_name */,
                                string_view /* method_name */, uint32_t * /* token_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult grpcClose(uint32_t /* token */) { // cancel on call, close on stream.
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult grpcCancel(uint32_t /* token */) { // cancel on call, reset on stream.
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult grpcSend(uint32_t /* token */, string_view /* message */,
                              bool /* end_stream */) { // stream only
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // Metrics
  virtual WasmResult defineMetric(MetricType /* type */, string_view /* name */,
                                  uint32_t * /* metric_id_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult incrementMetric(uint32_t /* metric_id */, int64_t /* offset */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult recordMetric(uint32_t /* metric_id */, uint64_t /* value */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult getMetric(uint32_t /* metric_id */, uint64_t * /* value_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // Properties
  virtual WasmResult getProperty(string_view /* path */, std::string * /* result */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  virtual WasmResult setProperty(string_view /* key */, string_view /* serialized_value */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // Continue
  virtual void continueRequest() { unimplemented(); }
  virtual void continueResponse() { unimplemented(); }
  virtual void sendLocalResponse(uint64_t /* response_code */, string_view /* body_text */,
                                 Pairs /* additional_headers */, uint64_t /* grpc_status */,
                                 string_view /* details */) {
    unimplemented();
  }

  // Shared Data
  virtual WasmResult getSharedData(string_view /* key */,
                                   std::pair<std::string, uint32_t /* cas */> * /* data */);
  virtual WasmResult setSharedData(string_view /* key */, string_view /* value */,
                                   uint32_t /* cas */);

  // Shared Queue
  virtual uint32_t registerSharedQueue(string_view /* queue_name */);
  virtual WasmResult resolveSharedQueue(string_view /* vm_id */, string_view /* queue_name */,
                                        uint32_t * /* token */);
  virtual WasmResult dequeueSharedQueue(uint32_t /* token */, std::string * /* data */);
  virtual WasmResult enqueueSharedQueue(uint32_t /* token */, string_view /* value */);

  // Header/Trailer/Metadata Maps
  virtual void addHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                                 string_view /* value */) {
    unimplemented();
  }
  virtual string_view getHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */) {
    unimplemented();
    return "";
  }
  virtual Pairs getHeaderMapPairs(WasmHeaderMapType /* type */) {
    unimplemented();
    return {};
  }
  virtual void setHeaderMapPairs(WasmHeaderMapType /* type */, const Pairs & /* pairs */) {
    unimplemented();
  }

  virtual void removeHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */) {
    unimplemented();
  }
  virtual void replaceHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                                     string_view /* value */) {
    unimplemented();
  }

  virtual uint32_t getHeaderMapSize(WasmHeaderMapType /* type */) {
    unimplemented();
    return 0;
  }

protected:
  friend class WasmBase;

  virtual void initializeRoot(WasmBase *wasm, std::shared_ptr<PluginBase> plugin);
  std::string makeRootLogPrefix(string_view vm_id) const;

  WasmBase *wasm_{nullptr};
  uint32_t id_{0};
  uint32_t root_context_id_{0};        // 0 for roots and the general context.
  ContextBase *root_context_{nullptr}; // set in all contexts.
  std::string root_id_;                // set only in root context.
  std::string root_log_prefix_;        // set only in root context.
  std::shared_ptr<PluginBase> plugin_;
  bool in_vm_context_created_ = false;
  bool destroyed_ = false;
};

uint32_t resolveQueueForTest(string_view vm_id, string_view queue_name);

} // namespace proxy_wasm
