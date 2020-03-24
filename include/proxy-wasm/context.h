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
#include <chrono>
#include <functional>
#include <iostream>
#include <map>
#include <memory>
#include <vector>

#include "include/proxy-wasm/context_interface.h"

namespace proxy_wasm {

class WasmVm;

/**
 * PluginBase is container to hold plugin information which is shared with all Context(s) created
 * for a given plugin. Embedders may extend this class with additional host-specific plugin
 * information as required.
 * @param name is the name of the plugin.
 * @param root_id is an identifier for the in VM handlers for this plugin.
 * @param vm_id is a string used to differentiate VMs with the same code and VM configuration.
 * @param plugin_configuration is configuration for this plugin.
 */
struct PluginBase {
  PluginBase(string_view name, string_view root_id, string_view vm_id,
             string_view plugin_configuration)
      : name_(std::string(name)), root_id_(std::string(root_id)), vm_id_(std::string(vm_id)),
        plugin_configuration_(plugin_configuration), log_prefix_(makeLogPrefix()) {}

  const std::string name_;
  const std::string root_id_;
  const std::string vm_id_;
  std::string plugin_configuration_;
  const std::string &log_prefix() const { return log_prefix_; }

private:
  std::string makeLogPrefix() const;

  std::string log_prefix_;
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
class ContextBase : public ContextInterface {
public:
  ContextBase();                                                   // Testing.
  ContextBase(WasmBase *wasm);                                     // Vm Context.
  ContextBase(WasmBase *wasm, std::shared_ptr<PluginBase> plugin); // Root Context.
  ContextBase(WasmBase *wasm, uint32_t root_context_id,
              std::shared_ptr<PluginBase> plugin); // Stream context.
  virtual ~ContextBase();

  WasmBase *wasm() const { return wasm_; }
  uint32_t id() const { return id_; }
  // The VM Context used for calling "malloc" has an id_ == 0.
  bool isVmContext() { return id_ == 0; }
  // Root Contexts have the VM Context as a parent.
  bool isRootContext() { return root_context_id_ == 0; }
  ContextBase *root_context() { return root_context_; }
  string_view root_id() const { return plugin_->root_id_; }
  string_view log_prefix() const { return plugin_->log_prefix(); }
  WasmVm *wasmVm() const;

  /**
   * Calls into the VM.
   * These are implemented by the proxy-independent host code. They are virtual to support some
   * types of testing.
   */

  // Context
  void onCreate(uint32_t parent_context_id) override;
  bool onDone() override;
  void onDelete() override;

  // Root
  bool onStart(std::shared_ptr<PluginBase> plugin) override;
  bool onConfigure(std::shared_ptr<PluginBase> plugin) override;
  void onHttpCallResponse(HttpCallToken token) override;
  void onQueueReady(uint32_t SharedQueueDequeueToken) override;
  void onGrpcReceiveInitialMetadata(GrpcToken token) override;
  void onGrpcReceive(GrpcToken token) override;
  void onGrpcReceiveTrailingMetadata(GrpcToken token) override;
  void onGrpcClose(GrpcToken token, const GrpcStatus &status, const string_view message) override;

  // Stream (e.g. HTTP, Network)
  void onFinalized() override;

  // HTTP
  ProxyAction onRequestHeaders() override;
  ProxyAction onRequestBody() override;
  ProxyAction onRequestTrailers() override;
  ProxyAction onRequestMetadata() override;
  ProxyAction onResponseHeaders() override;
  ProxyAction onResponseBody() override;
  ProxyAction onResponseTrailers() override;
  ProxyAction onResponseMetadata() override;

  // Network
  ProxyAction onNetworkNewConnection() override;
  ProxyAction onDownstreamData() override;
  ProxyAction onUpstreamData() override;
  using CloseType = NetworkInterface::CloseType;
  void onDownstreamConnectionClose(CloseType close_type) override;
  void onUpstreamConnectionClose(CloseType close_type) override;

  /**
   * Will be called on sever Wasm errors. Callees may report and handle the error (e.g. via an
   * Exception) to prevent the proxy from crashing.
   */
  virtual void error(string_view message) {
    std::cerr << message << "\n";
    abort();
  }

  /**
   * Called by all functions which are not overridden with a proxy-specific implementation.
   */
  virtual void unimplemented() { error("unimplemented proxy-wasm API"); }

  /**
   * Calls from the VM>
   * This collection represents all the calls into the VM in the ABI
   * (https://github.com/proxy-wasm/spec).  They are not broken into separate interfaces because
   * doing so would result in duplication since calls into the VM must be overriden by the
   * implementations in the ContextBase.
   *
   * Note: most of these return a WasmResult, assume:
   * @return a WasmResult with the status of the call.
   */

  /**
   * Log a message.  Note: log_prefix() is *not* auto-prepended end may be useful to provide some
   * context.
   */
  virtual WasmResult log(uint64_t /* level */, string_view /* message */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Enables a periodic timer with the given period or sets the period of an existing timer. Note:
   * the timer is associated with the Root Context of whatever Context this call was made on and
   * there is only one timer available per Root Context.
   * @param period is the period of the periodic timer in milliseconds.
   */
  virtual WasmResult setTimerPeriod(std::chrono::milliseconds /* period */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Provides the current time in nanoseconds.
   */
  virtual uint64_t getCurrentTimeNanoseconds() {
    struct timespec tpe;
    clock_gettime(CLOCK_REALTIME, &tpe);
    uint64_t t = tpe.tv_sec;
    t *= 1000000000;
    t += tpe.tv_nsec;
    return t;
  }

  /**
   * Provides the status of the last call into the VM or out of the VM, similar to errno.
   * @return the status code and a descriptive string.
   */
  virtual std::pair<uint32_t, string_view> getStatus() {
    unimplemented();
    return std::make_pair(1, "unimplemented");
  }

  // Buffer

  /**
   * Provides a BufferInterface to be used to return buffered data to the VM.
   * @param type is the type of buffer to provide.
   */
  virtual const BufferInterface *getBuffer(WasmBufferType /* type */) {
    unimplemented();
    return nullptr;
  }

  /**
   * Provides the end-of-stream status of the current stream (if any) or false.
   */
  virtual bool end_of_stream() {
    unimplemented();
    return true;
  }

  // HTTP
  WasmResult httpCall(string_view /* target */, const Pairs & /*request_headers */,
                      string_view /* request_body */, const Pairs & /* request_trailers */,
                      int /* timeout_milliseconds */, HttpCallToken * /* token_ptr */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // gRPC
  WasmResult grpcCall(string_view, string_view /* service_name */, string_view /* method_name */,
                      string_view /* request */, const Pairs & /* initial_metadata */,
                      std::chrono::milliseconds & /* timeout */,
                      GrpcToken * /* token_ptr */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  WasmResult grpcStream(string_view /* grpc_service */, string_view /* service_name */,
                        string_view /* method_name */, GrpcToken * /* token_ptr */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  WasmResult grpcClose(GrpcToken /* token */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  WasmResult grpcCancel(GrpcToken /* token */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  WasmResult grpcSend(GrpcToken /* token */, string_view /* message */,
                      bool /* end_stream */) override { // stream only
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // Metrics
  WasmResult defineMetric(MetricType /* type */, string_view /* name */,
                          uint32_t * /* metric_id_ptr */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  WasmResult incrementMetric(uint32_t /* metric_id */, int64_t /* offset */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  WasmResult recordMetric(uint32_t /* metric_id */, uint64_t /* value */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }
  WasmResult getMetric(uint32_t /* metric_id */, uint64_t * /* value_ptr */) override {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // Properties

  /**
   * Get the value of a property.  Some properties are proxy-independent (e.g. ["plugin_root_id"])
   * while others can be proxy-specific.
   * @param path is a sequence of strings describing a path to a property.
   * @param result is a location to write the value of the property.
   */
  virtual WasmResult getProperty(string_view /* path */, std::string * /* result */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Set the value of a property.
   * @param path is a sequence of strings describing a path to a property.
   * @param value the value to set.  For non-string, non-integral types, the value may be
   * serialized..
   */
  virtual WasmResult setProperty(string_view /* key */, string_view /* value */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // Continue

  /**
   * Continue processing a request e.g. after returning ProxyAction::Pause.
   */
  virtual void continueRequest() { unimplemented(); }

  /**
   * Continue processing a response e.g. after returning ProxyAction::Pause.
   */
  virtual void continueResponse() { unimplemented(); }

  /**
   * Respond directly to an HTTP request.
   * @param response_code is the response code to send.
   * @param body is the body of the response.
   * @param additional_headers are additional headers to send in the response.
   * @param grpc_status is an optional gRPC status if the connection is a gRPC connection.
   * @param details are details of any (gRPC) error.
   */
  virtual void sendLocalResponse(uint64_t /* response_code */, string_view /* body */,
                                 Pairs /* additional_headers */, uint64_t /* grpc_status */,
                                 string_view /* details */) {
    unimplemented();
  }

  // Shared Data

  /**
   * Get proxy-wide key-value data shared between VMs.
   * @param key is a proxy-wide key mapping to the shared data value.
   * @param cas is a number which will be incremented when a data value has been changed.
   * @param data is a location to store the returned stored 'value' and the corresponding 'cas'
   * compare-and-swap value which can be used with setSharedData for safe concurrent updates.
   */
  virtual WasmResult
  getSharedData(string_view /* key */,
                std::pair<std::string /* value */, uint32_t /* cas */> * /* data */);

  /**
   * Set a key-value data shared between VMs.
   * @param key is a proxy-wide key mapping to the shared data value.
   * @param cas is a compare-and-swap value. If it is zero it is ignored, otherwise it must match
   * the cas associated with the value.
   * @param data is a location to store the returned value.
   */
  virtual WasmResult setSharedData(string_view /* key */, string_view /* value */,
                                   uint32_t /* cas */);

  // Shared Queue

  /**
   * Register a proxy-wide queue.
   * @param queue_name is a name for the queue. The queue_name is combined with the vm_id (if any)
   * to make a unique identifier for the queue.
   * @param token_ptr a location to store a token corresponding to the queue.
   */
  virtual WasmResult registerSharedQueue(string_view /* queue_name */,
                                         SharedQueueDequeueToken *token_ptr);

  /**
   * Get the token for a queue.
   * @param vm_id is the vm_id of the Plugin of the Root Context which registered the queue.
   * @param queue_name is a name for the queue. The queue_name is combined with the vm_id (if any)
   * to make a unique identifier for the queue.
   * @param token_ptr a location to store a token corresponding to the queue.
   */
  using SharedQueueEnqueueToken = uint32_t;
  virtual WasmResult resolveSharedQueue(string_view /* vm_id */, string_view /* queue_name */,
                                        uint32_t * /* token_ptr */);

  /**
   * Dequeue a message from a shared queue.
   * @param token is a token returned by registerSharedQueue();
   * @param data_ptr is a location to store the data dequeued.
   */
  virtual WasmResult dequeueSharedQueue(SharedQueueDequeueToken /* token */,
                                        std::string * /* data_ptr */);

  /**
   * Enqueue a message on a shared queue.
   * @param token is a token returned by resolveSharedQueue();
   * @param data is the data to be queued.
   */
  virtual WasmResult enqueueSharedQueue(SharedQueueEnqueueToken /* token */,
                                        string_view /* data */);

  // Header/Trailer/Metadata Maps

  /**
   * Add a key-value pair to a header map.
   * @param type of the header map.
   * @param key is the key (header).
   * @param value is the value (header value).
   */
  virtual WasmResult addHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                                       string_view /* value */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Get a value from to a header map.
   * @param type of the header map.
   * @param key is the key (header).
   * @param result is a pointer to the returned header value.
   */
  virtual WasmResult getHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                                       string_view *result) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Get all the key-value pairs in a header map.
   * @param type of the header map.
   * @param result is a pointer to the pairs.
   */
  virtual WasmResult getHeaderMapPairs(WasmHeaderMapType /* type */, Pairs * /* result */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Set a header map so that it contains the given pairs (does not merge with existing data).
   * @param type of the header map.
   * @param the pairs to set the header map to.
   */
  virtual WasmResult setHeaderMapPairs(WasmHeaderMapType /* type */, const Pairs & /* pairs */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Remove a key-value pair from a header map.
   * @param type of the header map.
   * @param key of the header map.
   */
  virtual WasmResult removeHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Replace (or set) a value in a header map.
   * @param type of the header map.
   * @param key of the header map.
   * @param value to set in the header map.
   */
  virtual WasmResult replaceHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                                           string_view /* value */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Returns the number of entries in a header map.
   * @param type of the header map.
   * @param result is a pointer to the result.
   */
  virtual WasmResult getHeaderMapSize(WasmHeaderMapType /* type */, uint32_t * /* result */) {
    unimplemented();
    return WasmResult::Unimplemented;
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
};

uint32_t resolveQueueForTest(string_view vm_id, string_view queue_name);

} // namespace proxy_wasm
