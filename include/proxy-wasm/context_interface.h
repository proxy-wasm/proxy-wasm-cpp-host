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

using Pairs = std::vector<std::pair<string_view, string_view>>;
using PairsWithStringValues = std::vector<std::pair<string_view, std::string>>;
using HttpCallToken = uint32_t;
using GrpcToken = uint32_t;
using SharedQueueDequeueToken = uint32_t;
using SharedQueueEnqueueToken = uint32_t;

// TODO: move to SDK.
enum WasmStreamType {
  Request,
  Response,
  Downstream,
  Upstream,
};

// TODO: update SDK.
enum class ProxyAction : uint32_t {
  Illegal = 0,
  Continue = 1,
  Pause = 2,
};

struct PluginBase;
class WasmBase;

/**
 * BufferInterface provides a interface between proxy-specific buffers and the proxy-independent ABI
 * implementation. Embedders should subclass BufferInterface to enable the proxy-independent code to
 * implement ABI calls which use buffers (e.g. the HTTP body).
 */
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
   * allocated memory block which contains the copied bytes (i.e. length).
   * @return a WasmResult with any error or WasmResult::Ok.
   * NB: in order to support (future) 64-bit VMs and the NullVM we need 64-bits worth of resolution
   * for addresses.
   */
  virtual WasmResult copyTo(WasmBase *wasm, size_t start, size_t length, uint64_t ptr_ptr,
                            uint64_t size_ptr) const = 0;
};

/**
 * RootGrpcInterface is the interface for gRPC events arriving at RootContext(s).
 */
struct RootGrpcInterface {
  /**
   * Called on Root Context to with the initial metadata of a grpcStream.
   * @token is the token returned by grpcStream.
   * The metadata can be retrieved via the HeaderInterface functions with
   * WasmHeaderMapType::GrpcReceiveInitialMetadata as the type.
   */
  virtual void onGrpcReceiveInitialMetadata(GrpcToken token) = 0;

  /**
   * Called on Root Context when gRPC data has arrived.
   * @token is the token returned by grpcCall or grpcStream.
   * For Call this implies OK close.  For Stream may be called repeatedly.
   * The data can be retrieved via the getBuffer function with
   * WasmBufferType::GrpcReceiveBuffer as the type.
   */
  virtual void onGrpcReceive(GrpcToken token) = 0;

  /**
   * Called on Root Context to with the trailing metadata of a grpcStream.
   * @token is the token returned by grpcStream.
   * The trailers can be retrieved via the HeaderInterface functions with
   * WasmHeaderMapType::GrpcReceiveTrailingMetadata as the type.
   */
  virtual void onGrpcReceiveTrailingMetadata(GrpcToken token) = 0;

  /**
   * Called on Root Context when a gRPC call has closed prematurely or a gRPC stream has closed.
   * @token is the token returned by grpcStream.
   * @status is status of the stream.
   * @message is any status message.
   * For Call only used when not Ok. For stream indicates the peer has closed.
   */
  virtual void onGrpcClose(GrpcToken token, const GrpcStatus &status,
                           const string_view message) = 0;
};

/**
 * RootInterface is the interface specific to RootContexts.
 * A RootContext is associated with one more more plugins and is the parent of all stream Context(s)
 * created for that plugin. It can be used to store data shared between stream Context(s) in the
 * same VM.
 */
struct RootInterface : public RootGrpcInterface {
  /**
   * Call on a host Context to create a corresponding Context in the VM.  Note:
   * onNetworkNewConnection and onRequestHeaders() call onCreate().
   * @param parent_context_id is the parent Context id for the context being created.  For a
   * stream Context this will be a Root Context id (or sub-Context thereof).
   */
  virtual void onCreate(uint32_t parent_context_id) = 0;

  /**
   * Call on a Root Context when a VM first starts up.
   * @param plugin is the plugin which caused the VM to be started.
   * Called by the host code.
   */
  virtual bool onStart(std::shared_ptr<PluginBase> plugin) = 0;

  /**
   * Call on a Root Context when a plugin is configured or reconfigured dynamically.
   * @param plugin is the plugin which is being configured or reconfigured.
   */
  virtual bool onConfigure(std::shared_ptr<PluginBase> plugin) = 0;

  /**
   * Called on a Root Context when a response arrives for an outstanding httpCall().
   * @param token is the token returned by the corresponding httpCall().
   */
  virtual void onHttpCallResponse(HttpCallToken token) = 0;

  /**
   * Called on a Root Context when an Inter-VM shared queue message has arrived.
   * @token is the token returned by registerSharedQueue().
   */
  virtual void onQueueReady(SharedQueueDequeueToken token) = 0;

  /**
   * Call when a stream has completed (both sides have closed) or on a Root Context when the VM is
   * shutting down.
   * @return true for stream contexts or for Root Context(s) if the VM can shutdown, false for Root
   * Context(s) if the VM should wait until the Root Context calls the proxy_done() ABI call.  Note:
   * the VM may (optionally) shutdown after some configured timeout even if the Root Context does
   * not call proxy_done().
   */
  virtual bool onDone() = 0;

  /**
   * Call when no further stream calls will occur.  This will cause the corresponding Context in the
   * VM to be deleted.
   * Called by the host code.
   */
  virtual void onDelete() = 0;
};

/**
 * HttpInterface is the interface between the VM host and the VM for HTTP streams. Note: headers and
 * trailers are obtained by the code in the VM via the XXXHeaderMapXXX set of functions. Body data
 * is obtained by the code in the VM via calls implemented by the proxy-independent host code using
 * the getBuffer() call.
 */
struct HttpInterface {
public:
  /**
   * Call on a stream context to indicate that the request headers have arrived.  Calls
   * onCreate() to create a Context in the VM first.
   */
  virtual ProxyAction onRequestHeaders() = 0;

  // Call on a stream context to indicate that body data has arrived.
  virtual ProxyAction onRequestBody() = 0;

  // Call on a stream context to indicate that the request trailers have arrived.
  virtual ProxyAction onRequestTrailers() = 0;

  // Call on a stream context to indicate that the request metadata has arrived.
  virtual ProxyAction onRequestMetadata() = 0;

  // Call on a stream context to indicate that the request trailers have arrived.
  virtual ProxyAction onResponseHeaders() = 0;

  // Call on a stream context to indicate that body data has arrived.
  virtual ProxyAction onResponseBody() = 0;

  // Call on a stream context to indicate that the request trailers have arrived.
  virtual ProxyAction onResponseTrailers() = 0;

  // Call on a stream context to indicate that the request metadata has arrived.
  virtual ProxyAction onResponseMetadata() = 0;

  /**
   * Respond directly to an HTTP request.
   * @param response_code is the response code to send.
   * @param body is the body of the response.
   * @param additional_headers are additional headers to send in the response.
   * @param grpc_status is an optional gRPC status if the connection is a gRPC connection.
   * @param details are details of any (gRPC) error.
   */
  virtual WasmResult sendLocalResponse(uint32_t response_code, string_view body,
                                       Pairs additional_headers, uint32_t grpc_status,
                                       string_view details) = 0;

  // Call when the stream closes. See RootInterface.
  virtual bool onDone() = 0;

  // Call when the stream status has finalized, e.g. for logging. See RootInterface.
  virtual void onFinalized() = 0;

  // Call just before the Context is deleted. See RootInterface.
  virtual void onDelete() = 0;
};

/**
 * NetworkInterface is the interface between the VM host and the VM for network streams.
 */
struct NetworkInterface {
public:
  /**
   * Network
   * Note: Body data is obtained by the code in the VM via calls implemented by the
   * proxy-independent host code using the getBuffer() call.
   */

  /**
   * Call on a stream Context to indicate that a new network connection has been been created.
   * Calls onStart().
   */
  virtual ProxyAction onNetworkNewConnection() = 0;

  /**
   * Call on a stream Context to indicate that data has arrived from downstream (e.g. on the
   * incoming port that was accepted and for which the proxy is acting as a server).
   * @return indicates the subsequent behavior of this stream, e.g. continue proxying or pause
   * proxying.
   */
  virtual ProxyAction onDownstreamData() = 0;

  /**
   * Call on a stream Context to indicate that data has arrived from upstream (e.g. on the
   * outgoing port that the proxy connected and for which the proxy is acting as a client).
   * @param data_length the amount of data in the buffer.
   * @param end_of_stream is true if no more data will be arriving.
   * @return indicates the subsequent behavior of this stream, e.g. continue proxying or pause
   * proxying.
   */
  virtual ProxyAction onUpstreamData() = 0;

  /*
   * The source of the close event.
   * Unknown is when the source is not known.
   * Local is when the close was initiated by the proxy.
   * Remote is when the close was received from the peer.
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
  virtual void onDownstreamConnectionClose(CloseType close_type) = 0;

  /**
   * Call on a stream context to indicate that the upstream connection has closed.
   * @close_type is the source of the close.
   */
  virtual void onUpstreamConnectionClose(CloseType close_type) = 0;

  // Call when the stream closes. See RootInterface.
  virtual bool onDone() = 0;

  // Call when the stream status has finalized, e.g. for logging. See RootInterface.
  virtual void onFinalized() = 0;

  // Call just before the Context is deleted. See RootInterface.
  virtual void onDelete() = 0;
};

/**
 * General Stream interface (e.g. HTTP, Network).
 **/
struct StreamInterface {

  // Continue processing a request e.g. after returning ProxyAction::Pause.
  virtual WasmResult continueStream(WasmStreamType type) = 0;

  /**
   * Provides a BufferInterface to be used to return buffered data to the VM.
   * @param type is the type of buffer to provide.
   */
  virtual const BufferInterface *getBuffer(WasmBufferType type) = 0;

  /**
   * Provides the end-of-stream status of the given flow (if any) or false.  End of stream occurs
   * when a connection is closed (or half-closed) either locally or remotely.
   * @param stream_type is the flow
   */
  virtual bool end_of_stream(WasmStreamType type) = 0;
};

// Header/Trailer/Metadata Maps
struct HeaderInterface {
  /**
   * Add a key-value pair to a header map.
   * @param type of the header map.
   * @param key is the key (header).
   * @param value is the value (header value).
   */
  virtual WasmResult addHeaderMapValue(WasmHeaderMapType type, string_view key,
                                       string_view value) = 0;

  /**
   * Get a value from to a header map.
   * @param type of the header map.
   * @param key is the key (header).
   * @param result is a pointer to the returned header value.
   */
  virtual WasmResult getHeaderMapValue(WasmHeaderMapType type, string_view key,
                                       string_view *result) = 0;

  /**
   * Get all the key-value pairs in a header map.
   * @param type of the header map.
   * @param result is a pointer to the pairs.
   */
  virtual WasmResult getHeaderMapPairs(WasmHeaderMapType type, Pairs *result) = 0;

  /**
   * Set a header map so that it contains the given pairs (does not merge with existing data).
   * @param type of the header map.
   * @param the pairs to set the header map to.
   */
  virtual WasmResult setHeaderMapPairs(WasmHeaderMapType type, const Pairs &pairs) = 0;

  /**
   * Remove a key-value pair from a header map.
   * @param type of the header map.
   * @param key of the header map.
   */
  virtual WasmResult removeHeaderMapValue(WasmHeaderMapType type, string_view key) = 0;

  /**
   * Replace (or set) a value in a header map.
   * @param type of the header map.
   * @param key of the header map.
   * @param value to set in the header map.
   */
  virtual WasmResult replaceHeaderMapValue(WasmHeaderMapType type, string_view key,
                                           string_view value) = 0;

  /**
   * Returns the number of entries in a header map.
   * @param type of the header map.
   * @param result is a pointer to the result.
   */
  virtual WasmResult getHeaderMapSize(WasmHeaderMapType type, uint32_t *result) = 0;
};

struct HttpCallInterface {
  /**
   * Make an outgoing HTTP request.
   * @param target specifies the proxy-specific target of the call (e.g. a cluster, peer, or
   * host).
   * @param request_headers are the request headers.
   * @param request_body is the request body.
   * @param request_trailers are the request trailers.
   * @param timeout_milliseconds is a timeout after which the request will be considered to have
   * failed.
   * @param token_ptr contains a pointer to a location to store the token which will be used with
   * the corresponding onHttpCallResponse.
   * Note: the response arrives on the ancestor RootContext as this call may outlive any stream.
   * Plugin writers should use the VM SDK setEffectiveContext() to switch to any waiting streams.
   */
  virtual WasmResult httpCall(string_view target, const Pairs &request_headers,
                              string_view request_body, const Pairs &request_trailers,
                              int timeout_milliseconds, HttpCallToken *token_ptr) = 0;
};

struct GrpcCallInterface {
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
                              std::chrono::milliseconds & /* timeout */,
                              GrpcToken * /* token_ptr */) = 0;

  /**
   * Close a gRPC stream.  In flight data may still result in calls into the VM.
   * @param token is a token returned from grpcStream.
   * For call the same as grpcCancel. For Stream, close the stream: outstanding peer messages may
   * still arrive.
   */
  virtual WasmResult grpcClose(GrpcToken /* token */) = 0;

  /**
   * Cancel a gRPC stream or call.  No more calls will occur.
   * @param token is a token returned from grpcSream or grpcCall.
   * For Call, cancel on call. For Stream, reset the stream: no further callbacks will arrive.
   */
  virtual WasmResult grpcCancel(GrpcToken /* token */) = 0;
};

struct GrpcStreamInterface {
  /**
   * Open a gRPC stream.
   * @param grpc_service is proxy-specific metadata describing the service (e.g. security certs).
   * @param service_name the name of the gRPC service.
   * @param method_name the gRPC method name.
   * @param token_ptr contains a pointer to a location to store the token which will be used with
   * the corresponding onGrpc and grpc calls.
   */
  virtual WasmResult grpcStream(string_view grpc_service, string_view service_name,
                                string_view method_name, GrpcToken *token_ptr) = 0;

  /**
   * Close a gRPC stream.  In flight data may still result in calls into the VM.
   * @param token is a token returned from grpcSream.
   * @param message is a (serialized) message to be sent.
   * @param end_stream indicates that the stream is now end_of_stream (e.g. WriteLast() or
   * WritesDone).
   */
  virtual WasmResult grpcSend(GrpcToken token, string_view message, bool end_stream) = 0;

  // See GrpcCallInterface.
  virtual WasmResult grpcClose(GrpcToken token) = 0;

  // See GrpcCallInterface.
  virtual WasmResult grpcCancel(GrpcToken token) = 0;
};

/**
 * Metrics/Stats interface. See the proxy-wasm spec for details of the host ABI contract.
 */
struct MetricsInterface {
  /**
   * Define a metric (Stat).
   * @param type is the type of metric (e.g. Counter).
   * @param name is a string uniquely identifying the metric.
   * @param metric_id_ptr is a location to store a token used for subsequent operations on the
   * metric.
   */
  virtual WasmResult defineMetric(MetricType /* type */, string_view /* name */,
                                  uint32_t * /* metric_id_ptr */) = 0;

  /**
   * Increment a metric.
   * @param metric_id is a token returned by defineMetric() identifying the metric to operate on.
   * @param offset is the offset to apply to the Counter.
   */
  virtual WasmResult incrementMetric(uint32_t /* metric_id */, int64_t /* offset */) = 0;

  /**
   * Record a metric.
   * @param metric_id is a token returned by defineMetric() identifying the metric to operate on.
   * @param value is the value to store for a Gauge or increment for a histogram or Counter.
   */
  virtual WasmResult recordMetric(uint32_t /* metric_id */, uint64_t /* value */) = 0;

  /**
   * Get the current value of a metric.
   * @param metric_id is a token returned by defineMetric() identifying the metric to operate on.
   * @param value_ptr is a location to store the value of the metric.
   */
  virtual WasmResult getMetric(uint32_t /* metric_id */, uint64_t * /* value_ptr */) = 0;
};

struct GeneralInterface {
  /**
   * Will be called on severe Wasm errors. Callees may report and handle the error (e.g. via an
   * Exception) to prevent the proxy from crashing.
   */
  virtual void error(string_view message) = 0;

  /**
   * Called by all functions which are not overridden with a proxy-specific implementation.
   * @return WasmResult::Unimplemented.
   */
  virtual WasmResult unimplemented() = 0;

  // Log a message.
  virtual WasmResult log(uint32_t level, string_view message) = 0;

  /**
   * Enables a periodic timer with the given period or sets the period of an existing timer. Note:
   * the timer is associated with the Root Context of whatever Context this call was made on.
   * @param period is the period of the periodic timer in milliseconds.  If the period is 0 the
   * timer is reset/deleted and will not call onTick.
   * @param timer_token_ptr is a pointer to the timer_token.  If the target of timer_token_ptr is
   * zero, a new timer will be allocated its token will be set.  If the target is non-zero, then
   * that timer will have the new period (or be reset/deleted if period is zero).
   */
  virtual WasmResult setTimerPeriod(std::chrono::milliseconds period,
                                    uint32_t *timer_token_ptr) = 0;

  // Provides the current time in nanoseconds since the Unix epoch.
  virtual uint64_t getCurrentTimeNanoseconds() = 0;

  /**
   * Provides the status of the last call into the VM or out of the VM, similar to errno.
   * @return the status code and a descriptive string.
   */
  virtual std::pair<uint32_t, string_view> getStatus() = 0;

  /**
   * Get the value of a property.  Some properties are proxy-independent (e.g. ["plugin_root_id"])
   * while others can be proxy-specific.
   * @param path is a sequence of strings describing a path to a property.
   * @param result is a location to write the value of the property.
   */
  virtual WasmResult getProperty(string_view path, std::string *result) = 0;

  /**
   * Set the value of a property.
   * @param path is a sequence of strings describing a path to a property.
   * @param value the value to set.  For non-string, non-integral types, the value may be
   * serialized..
   */
  virtual WasmResult setProperty(string_view key, string_view value) = 0;
};

/**
 * SharedDataInterface is for shaing data between VMs. In general the VMs may be on different
 * threads.  Keys can have any format, but good practice would use reverse DNS and namespacing
 * prefixes to avoid conflicts.
 */
struct SharedDataInterface {
  /**
   * Get proxy-wide key-value data shared between VMs.
   * @param key is a proxy-wide key mapping to the shared data value.
   * @param cas is a number which will be incremented when a data value has been changed.
   * @param data is a location to store the returned stored 'value' and the corresponding 'cas'
   * compare-and-swap value which can be used with setSharedData for safe concurrent updates.
   */
  virtual WasmResult
  getSharedData(string_view key, std::pair<std::string /* value */, uint32_t /* cas */> *data) = 0;

  /**
   * Set a key-value data shared between VMs.
   * @param key is a proxy-wide key mapping to the shared data value.
   * @param cas is a compare-and-swap value. If it is zero it is ignored, otherwise it must match
   * the cas associated with the value.
   * @param data is a location to store the returned value.
   */
  virtual WasmResult setSharedData(string_view key, string_view value, uint32_t cas) = 0;
}; // namespace proxy_wasm

struct SharedQueueInterface {
  /**
   * Register a proxy-wide queue.
   * @param queue_name is a name for the queue. The queue_name is combined with the vm_id (if any)
   * to make a unique identifier for the queue.
   * @param token_ptr a location to store a token corresponding to the queue.
   */
  virtual WasmResult registerSharedQueue(string_view queue_name,
                                         SharedQueueDequeueToken *token_ptr) = 0;

  /**
   * Get the token for a queue.
   * @param vm_id is the vm_id of the Plugin of the Root Context which registered the queue.
   * @param queue_name is a name for the queue. The queue_name is combined with the vm_id (if any)
   * to make a unique identifier for the queue.
   * @param token_ptr a location to store a token corresponding to the queue.
   */
  virtual WasmResult lookupSharedQueue(string_view vm_id, string_view queue_name,
                                       SharedQueueEnqueueToken *token_ptr) = 0;

  /**
   * Dequeue a message from a shared queue.
   * @param token is a token returned by registerSharedQueue();
   * @param data_ptr is a location to store the data dequeued.
   */
  virtual WasmResult dequeueSharedQueue(SharedQueueDequeueToken token, std::string *data_ptr) = 0;

  /**
   * Enqueue a message on a shared queue.
   * @param token is a token returned by resolveSharedQueue();
   * @param data is the data to be queued.
   */
  virtual WasmResult enqueueSharedQueue(SharedQueueEnqueueToken token, string_view data) = 0;
};

struct ContextInterface : RootInterface,
                          HttpInterface,
                          NetworkInterface,
                          StreamInterface,
                          HeaderInterface,
                          HttpCallInterface,
                          GrpcCallInterface,
                          GrpcStreamInterface,
                          MetricsInterface,
                          SharedDataInterface,
                          SharedQueueInterface,
                          GeneralInterface {};

} // namespace proxy_wasm
