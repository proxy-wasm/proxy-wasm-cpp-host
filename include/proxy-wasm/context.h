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

#include <time.h>

#include <atomic>
#include <chrono>
#include <functional>
#include <iostream>
#include <map>
#include <memory>
#include <vector>

#include "include/proxy-wasm/compat.h"
#include "include/proxy-wasm/context_interface.h"

namespace proxy_wasm {

#include "proxy_wasm_common.h"
#include "proxy_wasm_enums.h"

class WasmBase;
class WasmVm;

/**
 * PluginBase is container to hold plugin information which is shared with all Context(s) created
 * for a given plugin. Embedders may extend this class with additional host-specific plugin
 * information as required.
 * @param name is the name of the plugin.
 * @param root_id is an identifier for the in VM handlers for this plugin.
 * @param vm_id is a string used to differentiate VMs with the same code and VM configuration.
 * @param plugin_configuration is configuration for this plugin.
 * @param fail_open if true the plugin will pass traffic as opposed to close all streams.
 */
struct PluginBase {
  PluginBase(string_view name, string_view root_id, string_view vm_id,
             string_view plugin_configuration, bool fail_open)
      : name_(std::string(name)), root_id_(std::string(root_id)), vm_id_(std::string(vm_id)),
        plugin_configuration_(plugin_configuration), fail_open_(fail_open) {}

  const std::string name_;
  const std::string root_id_;
  const std::string vm_id_;
  std::string plugin_configuration_;
  const bool fail_open_;
  const std::string &log_prefix() const { return log_prefix_; }

private:
  std::string makeLogPrefix() const;

  std::string log_prefix_;
};

struct BufferBase : public BufferInterface {
  BufferBase() = default;
  ~BufferBase() override = default;

  // BufferInterface
  size_t size() const override {
    if (owned_data_) {
      return owned_data_size_;
    }
    return data_.size();
  }
  WasmResult copyTo(WasmBase *wasm, size_t start, size_t length, uint64_t ptr_ptr,
                    uint64_t size_ptr) const override;
  WasmResult copyFrom(size_t /* start */, size_t /* length */, string_view /* data */) override {
    // Setting a string buffer not supported (no use case).
    return WasmResult::BadArgument;
  }

  virtual void clear() {
    data_ = "";
    owned_data_ = nullptr;
  }
  BufferBase *set(string_view data) {
    clear();
    data_ = data;
    return this;
  }
  BufferBase *set(std::unique_ptr<char[]> owned_data, uint32_t owned_data_size) {
    clear();
    owned_data_ = std::move(owned_data);
    owned_data_size_ = owned_data_size;
    return this;
  }

protected:
  string_view data_;
  std::unique_ptr<char[]> owned_data_;
  uint32_t owned_data_size_;
};

/**
 * ContextBase is the interface between the VM host and the VM. It has several uses:
 *
 * 1) To provide host-specific implementations of ABI calls out of the VM. For example, a proxy
 * which wants to provide the ability to make an HTTP call must implement the
 * ContextBase::httpCall() method.
 *
 * 2) To call into the VM. For example, when the above mentioned httpCall() completes, the host must
 * call ContextBase::onHttpCallResponse(). Similarly, when a new HTTP request arrives and the
 * headers are available, the host must create a new ContextBase object to manage the new stream and
 * call onRequestHeaders() on that object which will cause a corresponding Context to be allocated
 * in the VM which will receive the proxy_on_context_create and proxy_on_request_headers calls.
 *
 * 3) For testing and instrumentation the methods of ContextBase can be replaces or augmented.
 */
class ContextBase : public RootInterface,
                    public HttpInterface,
                    public NetworkInterface,
                    public StreamInterface,
                    public HeaderInterface,
                    public HttpCallInterface,
                    public GrpcCallInterface,
                    public GrpcStreamInterface,
                    public MetricsInterface,
                    public SharedDataInterface,
                    public SharedQueueInterface,
                    public GeneralInterface {
public:
  ContextBase();                                                   // Testing.
  ContextBase(WasmBase *wasm);                                     // Vm Context.
  ContextBase(WasmBase *wasm, std::shared_ptr<PluginBase> plugin); // Root Context.
  ContextBase(WasmBase *wasm, uint32_t parent_context_id,
              std::shared_ptr<PluginBase> plugin); // Stream context.
  virtual ~ContextBase();

  WasmBase *wasm() const { return wasm_; }
  uint32_t id() const { return id_; }
  // The VM Context used for calling "malloc" has an id_ == 0.
  bool isVmContext() const { return id_ == 0; }
  // Root Contexts have the VM Context as a parent.
  bool isRootContext() const { return parent_context_id_ == 0; }
  ContextBase *parent_context() const { return parent_context_; }
  ContextBase *root_context() const {
    const ContextBase *previous = this;
    ContextBase *parent = parent_context_;
    while (parent != previous) {
      previous = parent;
      parent = parent->parent_context_;
    }
    return parent;
  }
  string_view root_id() const { return isRootContext() ? root_id_ : plugin_->root_id_; }
  string_view log_prefix() const {
    return isRootContext() ? root_log_prefix_ : plugin_->log_prefix();
  }
  WasmVm *wasmVm() const;

  // Called before deleting the context.
  virtual void destroy();

  /**
   * Calls into the VM.
   * These are implemented by the proxy-independent host code. They are virtual to support some
   * types of testing.
   */

  // Context
  void onCreate() override;
  bool onDone() override;
  void onLog() override;
  void onDelete() override;
  void onForeignFunction(uint32_t foreign_function_id, uint32_t data_size) override;

  // Root
  bool onStart(std::shared_ptr<PluginBase> plugin) override;
  bool onConfigure(std::shared_ptr<PluginBase> plugin) override;
  void onTick(TimerToken token) override;
  void onQueueReady(SharedQueueDequeueToken token) override;

  // HTTP
  FilterHeadersStatus onRequestHeaders(uint32_t headers, bool end_of_stream) override;
  FilterDataStatus onRequestBody(uint32_t body_buffer_length, bool end_of_stream) override;
  FilterTrailersStatus onRequestTrailers(uint32_t trailers) override;
  FilterMetadataStatus onRequestMetadata(uint32_t elements) override;
  FilterHeadersStatus onResponseHeaders(uint32_t headers, bool end_of_stream) override;
  FilterDataStatus onResponseBody(uint32_t body_buffer_length, bool end_of_stream) override;
  FilterTrailersStatus onResponseTrailers(uint32_t trailers) override;
  FilterMetadataStatus onResponseMetadata(uint32_t elements) override;

  // Network
  FilterStatus onNetworkNewConnection() override;
  FilterStatus onDownstreamData(uint32_t data_length, bool end_of_stream) override;
  FilterStatus onUpstreamData(uint32_t data_length, bool end_of_stream) override;
  void onDownstreamConnectionClose(CloseType) override;
  void onUpstreamConnectionClose(CloseType) override;

  // Async call response.
  void onHttpCallResponse(HttpCallToken token, uint32_t headers, uint32_t body_size,
                          uint32_t trailers) override;
  // Grpc
  void onGrpcReceiveInitialMetadata(GrpcToken token, uint32_t elements) override;
  void onGrpcReceive(GrpcToken token, uint32_t response_size) override;
  void onGrpcReceiveTrailingMetadata(GrpcToken token, uint32_t trailers) override;
  void onGrpcClose(GrpcToken token, GrpcStatusCode status_code) override;

  void error(string_view message) override {
    std::cerr << message << "\n";
    abort();
  }
  WasmResult unimplemented() override {
    error("unimplemented proxy-wasm API");
    return WasmResult::Unimplemented;
  }
  bool isFailed();
  bool isFailOpen() { return plugin_->fail_open_; }

  //
  // General Callbacks.
  //
  WasmResult log(uint32_t /* level */, string_view /* message */) override {
    return unimplemented();
  }
  uint64_t getCurrentTimeNanoseconds() override {
    struct timespec tpe;
    clock_gettime(CLOCK_REALTIME, &tpe);
    uint64_t t = tpe.tv_sec;
    t *= 1000000000;
    t += tpe.tv_nsec;
    return t;
  }
  std::pair<uint32_t, string_view> getStatus() override {
    unimplemented();
    return std::make_pair(1, "unimplmemented");
  }
  WasmResult setTimerPeriod(std::chrono::milliseconds period, uint32_t *timer_token_ptr) override;

  // Buffer
  BufferInterface *getBuffer(WasmBufferType /* type */) override {
    unimplemented();
    return nullptr;
  }
  bool endOfStream(WasmStreamType /* type */) override {
    unimplemented();
    return true;
  }

  // HTTP
  WasmResult httpCall(string_view /* target */, const Pairs & /*request_headers */,
                      string_view /* request_body */, const Pairs & /* request_trailers */,
                      int /* timeout_millisconds */, uint32_t * /* token_ptr */) override {
    return unimplemented();
  }

  // gRPC
  WasmResult grpcCall(string_view /* grpc_service */, string_view /* service_name */,
                      string_view /* method_name */, const Pairs & /* initial_metadata */,
                      string_view /* request */, std::chrono::milliseconds /* timeout */,
                      GrpcToken * /* token_ptr */) override {
    return unimplemented();
  }
  WasmResult grpcStream(string_view /* grpc_service */, string_view /* service_name */,
                        string_view /* method_name */, const Pairs & /* initial_metadata */,
                        GrpcToken * /* token_ptr */) override {
    return unimplemented();
  }
  WasmResult grpcClose(uint32_t /* token */) override { // cancel on call, close on stream.
    return unimplemented();
  }
  WasmResult grpcCancel(uint32_t /* token */) override { // cancel on call, reset on stream.
    return unimplemented();
  }
  WasmResult grpcSend(uint32_t /* token */, string_view /* message */,
                      bool /* end_stream */) override { // stream only
    return unimplemented();
  }

  // Metrics
  WasmResult defineMetric(uint32_t /* type */, string_view /* name */,
                          uint32_t * /* metric_id_ptr */) override {
    return unimplemented();
  }
  WasmResult incrementMetric(uint32_t /* metric_id */, int64_t /* offset */) override {
    return unimplemented();
  }
  WasmResult recordMetric(uint32_t /* metric_id */, uint64_t /* value */) override {
    return unimplemented();
  }
  WasmResult getMetric(uint32_t /* metric_id */, uint64_t * /* value_ptr */) override {
    return unimplemented();
  }

  // Properties
  WasmResult getProperty(string_view /* path */, std::string * /* result */) override {
    return unimplemented();
  }
  WasmResult setProperty(string_view /* key */, string_view /* serialized_value */) override {
    return unimplemented();
  }

  // Continue
  WasmResult continueStream(WasmStreamType /* stream_type */) override { return unimplemented(); }
  WasmResult closeStream(WasmStreamType /* stream_type */) override { return unimplemented(); }
  WasmResult sendLocalResponse(uint32_t /* response_code */, string_view /* body_text */,
                               Pairs /* additional_headers */, GrpcStatusCode /* grpc_status */,
                               string_view /* details */) override {
    return unimplemented();
  }
  void failStream(WasmStreamType stream_type) override { closeStream(stream_type); }

  // Shared Data
  WasmResult getSharedData(string_view key,
                           std::pair<std::string, uint32_t /* cas */> *data) override;
  WasmResult setSharedData(string_view key, string_view value, uint32_t cas) override;

  // Shared Queue
  WasmResult registerSharedQueue(string_view queue_name,
                                 SharedQueueDequeueToken *token_ptr) override;
  WasmResult lookupSharedQueue(string_view vm_id, string_view queue_name,
                               SharedQueueEnqueueToken *token) override;
  WasmResult dequeueSharedQueue(uint32_t token, std::string *data) override;
  WasmResult enqueueSharedQueue(uint32_t token, string_view value) override;

  // Header/Trailer/Metadata Maps
  WasmResult addHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                               string_view /* value */) override {
    return unimplemented();
  }
  WasmResult getHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                               string_view * /*result */) override {
    return unimplemented();
  }
  WasmResult getHeaderMapPairs(WasmHeaderMapType /* type */, Pairs * /* result */) override {
    return unimplemented();
  }
  WasmResult setHeaderMapPairs(WasmHeaderMapType /* type */, const Pairs & /* pairs */) override {
    return unimplemented();
  }

  WasmResult removeHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */) override {
    return unimplemented();
  }
  WasmResult replaceHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                                   string_view /* value */) override {
    return unimplemented();
  }

  WasmResult getHeaderMapSize(WasmHeaderMapType /* type */, uint32_t * /* result */) override {
    return unimplemented();
  }

protected:
  friend class WasmBase;

  void initializeRootBase(WasmBase *wasm, std::shared_ptr<PluginBase> plugin);
  std::string makeRootLogPrefix(string_view vm_id) const;

  WasmBase *wasm_{nullptr};
  uint32_t id_{0};
  uint32_t parent_context_id_{0};        // 0 for roots and the general context.
  ContextBase *parent_context_{nullptr}; // set in all contexts.
  std::string root_id_;                  // set only in root context.
  std::string root_log_prefix_;          // set only in root context.
  std::shared_ptr<PluginBase> plugin_;
  bool in_vm_context_created_ = false;
  bool destroyed_ = false;
};

class DeferAfterCallActions {
public:
  DeferAfterCallActions(ContextBase *context) : wasm_(context->wasm()) {}
  ~DeferAfterCallActions();

private:
  WasmBase *const wasm_;
};

uint32_t resolveQueueForTest(string_view vm_id, string_view queue_name);

} // namespace proxy_wasm
