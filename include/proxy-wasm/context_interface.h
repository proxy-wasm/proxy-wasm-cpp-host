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

#include "include/proxy-wasm/proxy_action.h"

namespace proxy_wasm {

#include "proxy_wasm_common.h"
#include "proxy_wasm_enums.h"

using Pairs = std::vector<std::pair<string_view, string_view>>;
using PairsWithStringValues = std::vector<std::pair<string_view, std::string>>;
using HttpCallToken = uint32_t;
using GrpcToken = uint32_t;

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
   * @metadata is the metadata received.
   */
  virtual void onGrpcReceiveInitialMetadata(GrpcToken token) = 0;

  /**
   * Called on Root Context when gRPC data has arrived.
   * @token is the token returned by grpcCall or grpcStream.
   * For Call this implies OK close.  For Stream may be called repeatedly.
   */
  virtual void onGrpcReceive(GrpcToken token) = 0;

  /**
   * Called on Root Context to with the initial metadata of a grpcStream.
   * @token is the token returned by grpcStream.
   * @metadata is the metadata received.
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
  virtual void onCreate(uint32_t parent_context_id);

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
  using SharedQueueDequeueToken = uint32_t;
  virtual void onQueueReady(uint32_t SharedQueueDequeueToken) = 0;

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
  virtual void onDelete();
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
   * onCreate().
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
   * For Call, cancel on call. For Strea, reset the stream: no further callbacks will arrive.
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

struct ContextInterface : RootInterface,
                          HttpInterface,
                          NetworkInterface,
                          HttpCallInterface,
                          GrpcCallInterface,
                          GrpcStreamInterface,
                          MetricsInterface {};

} // namespace proxy_wasm
