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

namespace proxy_wasm {

#include "proxy_wasm_common.h"
#include "proxy_wasm_enums.h"

class WasmBase;
class WasmVm;

// TODO: use the SDK version when it is updated.
enum class ProxyAction : uint32_t {
  Illegal = 0,
  Continue = 1,
  Pause = 2,
};

using Pairs = std::vector<std::pair<string_view, string_view>>;
using PairsWithStringValues = std::vector<std::pair<string_view, std::string>>;
using CallOnThreadFunction = std::function<void(std::function<void()>)>;

struct BufferInterface {
  virtual ~BufferInterface() {}
  virtual size_t size() const = 0;
  /**
   * Copy bytes from the buffer into the Wasm VM corresponding to 'wasm'.
   * @param start is the first buffer byte to copy.
   * @param length is the length of sequence of buffer bytes to copy.
   * @param ptr_ptr is the location in the VM address space to place the address of the newly
   * allocated memory block which contains the copied bytes.
   * @param size_ptr is the location in the VM address space to place the size of the newly
   * allocated memory block which contains the copied bytes (e.g. length).
   * @return true on success.
   */
  virtual bool copyTo(WasmBase *wasm, size_t start, size_t length, uint64_t ptr_ptr,
                      uint64_t size_ptr) const = 0;
};

// A container to hold plugin information which is shared with all Context(s) created for this
// plugin.
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

  //
  // Calls into the VM.
  //

  // Root Context

  /**
   * Call on a Root Context when a VM first starts up.
   * @param plugin is the plugin which caused the VM to be started.
   */
  virtual bool onStart(std::shared_ptr<PluginBase> plugin);

  /**
   * Call on a Root Context when a plugin is configured or reconfigured dyanmically.
   * @param plugin is the plugin which is being configured or reconfigured.
   */
  virtual bool onConfigure(std::shared_ptr<PluginBase> plugin);

  // Context

  /**
   * Call on a host Context to create a corresponding Context in the VM.  Note:
   * onNetworkNewConnection and onRequestHeaders() call onCreate().
   * @param parent_context_id is the parent Context id for the context being created.  For a Network
   * stream Context, this will be a Root Context id.
   */
  virtual void onCreate(uint32_t parent_context_id);

  // Network

  /**
   * Call on a stream Context to indicate that a new network connection has been been created.
   * Calls onStart().
   */
  virtual ProxyAction onNetworkNewConnection() {
    unimplemented();
    return ProxyAction::Continue;
  }
  /**
   * Call on a stream Context to indicate that data has arrived from downstream (e.g. on the
   * incoming port that was accepted and for which the proxy is acting as a server).
   * @param data_length the amount of data in the buffer.
   * @param end_of_stream is true if no more data will be arriving.
   * @return indicates the subsequent behavior of this stream, e.g. continue proxying or pause
   * proxying.
   */
  virtual ProxyAction onDownstreamData(int /* data_length */, bool /* end_of_stream */) {
    unimplemented();
    return ProxyAction::Continue;
  }
  /**
   * Call on a stream Context to indicate that data has arrived from upstream (e.g. on the outgoing
   * port that the proxy connected and for which the proxy is acting as a client).
   * @param data_length the amount of data in the buffer.
   * @param end_of_stream is true if no more data will be arriving.
   * @return indicates the subsequent behavior of this stream, e.g. continue proxying or pause
   * proxying.
   */
  virtual ProxyAction onUpstreamData(int /* data_length */, bool /* end_of_stream */) {
    unimplemented();
    return ProxyAction::Continue;
  }

  /*
   * The source of the close event.
   * Unknown is when the source is not known.
   * Local is when the close was initiated by the proxy.
   * Remote is when the close was recieved from the peer.
   */
  enum class CloseType : uint32_t {
    Unknown = 0,
    Local = 1,
    Remote = 2,
  };

  /**
   * Call on a stream context to indicate that the downstream connection has closed.
   * @close_type is the source of the close.
   */
  virtual void onDownstreamConnectionClose(CloseType /* close_type */) { unimplemented(); }

  /**
   * Call on a stream context to indicate that the upstream connection has closed.
   * @close_type is the source of the close.
   */
  virtual void onUpstreamConnectionClose(CloseType /* close_type */) { unimplemented(); }

  // HTTP

  /**
   * Call on a stream context to indicate that the request headers have arrived.  Calls onCreate().
   */
  virtual ProxyAction onRequestHeaders() {
    unimplemented();
    return ProxyAction::Continue;
  }

  /**
   * Call on a stream context to indicate that body data has arrived.
   * @param body_buffer_length the amount of data in the body buffer.
   * @param end_of_stream is true if no more body data will be arriving.
   */
  virtual ProxyAction onRequestBody(int /* body_buffer_length */, bool /* end_of_stream */) {
    unimplemented();
    return ProxyAction::Continue;
  }

  /**
   * Call on a stream context to indicate that the request trailers have arrived.
   */
  virtual ProxyAction onRequestTrailers() {
    unimplemented();
    return ProxyAction::Continue;
  }

  /**
   * Call on a stream context to indicate that the request metadata has arrived.
   */
  virtual ProxyAction onRequestMetadata() {
    unimplemented();
    return ProxyAction::Continue;
  }

  /**
   * Call on a stream context to indicate that the request trailers have arrived.
   */
  virtual ProxyAction onResponseHeaders() {
    unimplemented();
    return ProxyAction::Continue;
  }

  /**
   * Call on a stream context to indicate that body data has arrived.
   * @param body_buffer_length the amount of data in the body buffer.
   * @param end_of_stream is true if no more body data will be arriving.
   */
  virtual ProxyAction onResponseBody(int /* body_buffer_length */, bool /* end_of_stream */) {
    unimplemented();
    return ProxyAction::Continue;
  }

  /**
   * Call on a stream context to indicate that the request trailers have arrived.
   */
  virtual ProxyAction onResponseTrailers() {
    unimplemented();
    return ProxyAction::Continue;
  }

  /**
   * Call on a stream context to indicate that the request metadata has arrived.
   */
  virtual ProxyAction onResponseMetadata() {
    unimplemented();
    return ProxyAction::Continue;
  }

  // Root Context async events

  /**
   * Called on a Root Context when a response arrives for an outstanding httpCall().
   * @param token is the token returned by the corresponding httpCall().
   * @param headers are the number of headers in the response.
   * @param body_size is the size in bytes of the response body.
   * @param trailers is the number of trailres in the response.
   */
  virtual void onHttpCallResponse(uint32_t /* token */, uint32_t /* headers */,
                                  uint32_t /* body_size */, uint32_t /* trailers */) {}

  /**
   * Called on a Root Context to indicate that an Inter-VM shared queue message has arrived.
   * @token is the token returned by registerSharedQueue().
   */
  virtual void onQueueReady(uint32_t /* token */) { unimplemented(); }

  // Context

  /**
   * Call when a stream has completed (both sides have closed) or on a Root Context when the VM is
   * shutting down.
   * @return true for stream contexts or for Root Context(s) if the VM can shutdown, false for Root
   * Context(s) if the VM should wait until the Root Context calls the proxy_done() ABI call.  Note:
   * the VM may (optionally) shutdown after some configured timeout even if the Root Context does
   * not call proxy_done().
   */
  virtual bool onDone();

  /**
   * Call when a stream should log the final status of the stream. Occurs after onDone().
   */
  virtual void onLog();

  /**
   * Call when no further stream calls will occur.  This will cause the corresponding Context in the
   * VM to be deleted.
   */
  virtual void onDelete();

  /**
   * Will be called on sever Wasm errors. Callees may report and handle the error (e.g. via an
   * Exception) to prevent the proxy from crashing.
   */
  virtual void error(string_view message) {
    std::cerr << message << "\n";
    abort();
  }

  /**
   * Called by all functions which are not overriden with a proxy-specific implementation.
   */
  virtual void unimplemented() { error("unimplemented proxy-wasm API"); }

  //
  // Calls from the VM>
  // Note: most of these return a WasmResult, assume:
  // @return a WasmResult with the status of the call.
  //
  //

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
   * Provides the status of the call into the VM or out of the VM.
   * @return the status code and a descriptive string.
   */
  virtual std::pair<uint32_t, string_view> getStatus() {
    unimplemented();
    return std::make_pair(1, "unimplmemented");
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

  /**
   * Make an outgoing HTTP request.
   * @param target specifies the proxy-specific target of the call (e.g. a cluster, peer, or host).
   * @param request_headers are the request headers.
   * @param request_body is the request body.
   * @param request_trailers are the request trailers.
   * @param timeout_milliseconds is a timeout after which the request will be conidered to have
   * failed.
   * @param token_ptr contains a pointer to a location to store the token which will be used with
   * the corresponding onHttpCallResponse.
   */
  virtual WasmResult httpCall(string_view /* target */, const Pairs & /*request_headers */,
                              string_view /* request_body */, const Pairs & /* request_trailers */,
                              int /* timeout_millisconds */, uint32_t * /* token_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // gRPC

  /**
   * Make a gRPC call.
   * @param grpc_service is proxy-specific metadata describing the service (e.g. security certs).
   * @param service_name the name of the gRPC service.
   * @param method_name the gRPC method name.
   * @param request the serialized request.
   * @param initial_metadata the initial metadata.
   * @param timeout a timeout in milliseconds.
   * @param token_ptr contains a pointer to a location to store the token which will be used with
   * the corresponding onGrpc and grpc calls.
   */
  virtual WasmResult grpcCall(string_view /* grpc_service */, string_view /* service_name */,
                              string_view /* method_name */, string_view /* request */,
                              const Pairs & /* initial_metadata */,
                              const optional<std::chrono::milliseconds> & /* timeout */,
                              uint32_t * /* token_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Open a gRPC stream.
   * @param grpc_service is proxy-specific metadata describing the service (e.g. security certs).
   * @param service_name the name of the gRPC service.
   * @param method_name the gRPC method name.
   * @param token_ptr contains a pointer to a location to store the token which will be used with
   * the corresponding onGrpc and grpc calls.
   */
  virtual WasmResult grpcStream(string_view /* grpc_service */, string_view /* service_name */,
                                string_view /* method_name */, uint32_t * /* token_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Close a gRPC stream.  In flight data may stil result in calls into the VM.
   * @param token is a token returned from grpcSream.
   */
  virtual WasmResult grpcClose(uint32_t /* token */) { // cancel on call, close on stream.
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Cancel a gRPC stream or call.  No more calls will occur.
   * @param token is a token returned from grpcSream or grpcCall.
   */
  virtual WasmResult grpcCancel(uint32_t /* token */) { // cancel on call, reset on stream.
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Close a gRPC stream.  In flight data may stil result in calls into the VM.
   * @param token is a token returned from grpcSream.
   * @param message is a (serialized) message to be sent.
   * @param end_stream indicates that the stream is now end_of_stream (e.g. WriteLast() or
   * WritesDone).
   */
  virtual WasmResult grpcSend(uint32_t /* token */, string_view /* message */,
                              bool /* end_stream */) { // stream only
    unimplemented();
    return WasmResult::Unimplemented;
  }

  // Metrics

  /**
   * Define a metric (Stat).
   * @param type is the type of metric (e.g. Counter).
   * @param name is a string uniquely identifying the metric.
   * @param metric_id_ptr is a location to store a token used for subsequent operations on the
   * metric.
   */
  virtual WasmResult defineMetric(MetricType /* type */, string_view /* name */,
                                  uint32_t * /* metric_id_ptr */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Increment a metric.
   * @param metric_id is a token returned by defineMetric() identifying the metric to operate on.
   * @param offset is the offset to apply to the Counter.
   */
  virtual WasmResult incrementMetric(uint32_t /* metric_id */, int64_t /* offset */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Record a metric.
   * @param metric_id is a token returned by defineMetric() identifying the metric to operate on.
   * @param value is the value to store for a Gauge or increment for a histogram or Counter.
   */
  virtual WasmResult recordMetric(uint32_t /* metric_id */, uint64_t /* value */) {
    unimplemented();
    return WasmResult::Unimplemented;
  }

  /**
   * Get the current value of a metric.
   * @param metric_id is a token returned by defineMetric() identifying the metric to operate on.
   * @param value_ptr is a location to store the value of the metric.
   */
  virtual WasmResult getMetric(uint32_t /* metric_id */, uint64_t * /* value_ptr */) {
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
   * @param data is a location to store the returned value.
   */
  virtual WasmResult getSharedData(string_view /* key */,
                                   std::pair<std::string, uint32_t /* cas */> * /* data */);

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
  virtual WasmResult registerSharedQueue(string_view /* queue_name */, uint32_t *token_ptr);

  /**
   * Get the token for a queue.
   * @param vm_id is the vm_id of the Plugin of the Root Context which registered the queue.
   * @param queue_name is a name for the queue. The queue_name is combined with the vm_id (if any)
   * to make a unique identifier for the queue.
   * @param token_ptr a location to store a token corresponding to the queue.
   */
  virtual WasmResult resolveSharedQueue(string_view /* vm_id */, string_view /* queue_name */,
                                        uint32_t * /* token_ptr */);

  /**
   * Dequeue a message from a shared queue.
   * @param token is a token returned by registerSharedQueue();
   * @param data_ptr is a location to store the data dequeued.
   */
  virtual WasmResult dequeueSharedQueue(uint32_t /* token */, std::string * /* data_ptr */);

  /**
   * Enqueue a message on a shared queue.
   * @param token is a token returned by resolveSharedQueue();
   * @param data is the data to be queued.
   */
  virtual WasmResult enqueueSharedQueue(uint32_t /* token */, string_view /* value */);

  // Header/Trailer/Metadata Maps

  /**
   * Add a key-value pair to a header map.
   * @param type of the header map.
   * @param key is the key (header).
   * @param value is the value (header value).
   */
  virtual void addHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                                 string_view /* value */) {
    unimplemented();
  }

  /**
   * Get a value from to a header map.
   * @param type of the header map.
   * @param key is the key (header).
   */
  virtual string_view getHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */) {
    unimplemented();
    return "";
  }

  /**
   * Get all the key-value pairs in a header map.
   * @param type of the header map.
   * @return the pairs.
   */
  virtual Pairs getHeaderMapPairs(WasmHeaderMapType /* type */) {
    unimplemented();
    return {};
  }

  /**
   * Set a header map so that it contains the given pairs (does not merge with existing data).
   * @param type of the header map.
   * @param the pairs to set the header map to.
   */
  virtual void setHeaderMapPairs(WasmHeaderMapType /* type */, const Pairs & /* pairs */) {
    unimplemented();
  }

  /**
   * Remove a key-value pair from a header map.
   * @param type of the header map.
   * @param key of the header map.
   */
  virtual void removeHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */) {
    unimplemented();
  }

  /**
   * Replace (or set) a value in a header map.
   * @param type of the header map.
   * @param key of the header map.
   * @param value to set in the header map.
   */
  virtual void replaceHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                                     string_view /* value */) {
    unimplemented();
  }

  /**
   * Returns the number of entries in a header map.
   * @param type of the header map.
   */
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
};

uint32_t resolveQueueForTest(string_view vm_id, string_view queue_name);

} // namespace proxy_wasm
