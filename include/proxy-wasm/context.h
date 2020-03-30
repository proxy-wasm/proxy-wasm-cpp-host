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
  void onQueueReady(SharedQueueDequeueToken token) override;
  void onGrpcReceiveInitialMetadata(GrpcToken token) override;
  void onGrpcReceive(GrpcToken token) override;
  void onGrpcReceiveTrailingMetadata(GrpcToken token) override;
  void onGrpcClose(GrpcToken token, const GrpcStatus &status, const string_view message) override;

  // Stream (e.g. HTTP, Network)
  void onFinalized() override;
  const BufferInterface *getBuffer(WasmBufferType /* type */) override {
    unimplemented();
    return nullptr;
  }
  bool end_of_stream(WasmStreamType /* type */) override {
    unimplemented();
    return true;
  }
  WasmResult continueStream(WasmStreamType /* type */) override { return unimplemented(); }

  // HTTP
  ProxyAction onRequestHeaders() override;
  ProxyAction onRequestBody() override;
  ProxyAction onRequestTrailers() override;
  ProxyAction onRequestMetadata() override;
  ProxyAction onResponseHeaders() override;
  ProxyAction onResponseBody() override;
  ProxyAction onResponseTrailers() override;
  ProxyAction onResponseMetadata() override;
  WasmResult sendLocalResponse(uint32_t /* response_code */, string_view /* body */,
                               Pairs /* additional_headers */, uint32_t /* grpc_status */,
                               string_view /* details */) override {
    return unimplemented();
  }

  // Network
  ProxyAction onNetworkNewConnection() override;
  ProxyAction onDownstreamData() override;
  ProxyAction onUpstreamData() override;
  using CloseType = NetworkInterface::CloseType;
  void onDownstreamConnectionClose(CloseType close_type) override;
  void onUpstreamConnectionClose(CloseType close_type) override;

  // General
  void error(string_view message) override {
    std::cerr << message << "\n";
    abort();
  }
  WasmResult unimplemented() override {
    error("unimplemented proxy-wasm API");
    return WasmResult::Unimplemented;
  }
  WasmResult log(uint32_t level, string_view message) override {
    if (level >= static_cast<uint32_t>(LogLevel::error)) {
      std::cerr << log_prefix() << message << "\n";
    } else {
      std::cout << log_prefix() << message << "\n";
    }
    return WasmResult::Ok;
  }
  virtual WasmResult setTimerPeriod(std::chrono::milliseconds /* period */,
                                    uint32_t * /* timer_token_ptr */) override {
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
    return std::make_pair(1, "unimplemented");
  }
  WasmResult getProperty(string_view /* path */, std::string * /* result */) override {
    return unimplemented();
  }
  WasmResult setProperty(string_view /* key */, string_view /* value */) override {
    return unimplemented();
  }

  // HTTP
  WasmResult httpCall(string_view /* target */, const Pairs & /*request_headers */,
                      string_view /* request_body */, const Pairs & /* request_trailers */,
                      int /* timeout_milliseconds */, HttpCallToken * /* token_ptr */) override {
    return unimplemented();
  }

  // gRPC
  WasmResult grpcCall(string_view, string_view /* service_name */, string_view /* method_name */,
                      string_view /* request */, const Pairs & /* initial_metadata */,
                      std::chrono::milliseconds & /* timeout */,
                      GrpcToken * /* token_ptr */) override {
    return unimplemented();
  }
  WasmResult grpcStream(string_view /* grpc_service */, string_view /* service_name */,
                        string_view /* method_name */, GrpcToken * /* token_ptr */) override {
    return unimplemented();
  }
  WasmResult grpcClose(GrpcToken /* token */) override { return unimplemented(); }
  WasmResult grpcCancel(GrpcToken /* token */) override { return unimplemented(); }
  WasmResult grpcSend(GrpcToken /* token */, string_view /* message */,
                      bool /* end_stream */) override { // stream only
    return unimplemented();
  }

  // Metrics
  WasmResult defineMetric(MetricType /* type */, string_view /* name */,
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

  // Shared Data
  WasmResult
  getSharedData(string_view /* key */,
                std::pair<std::string /* value */, uint32_t /* cas */> * /* data */) override {
    return unimplemented();
  }
  WasmResult setSharedData(string_view /* key */, string_view /* value */,
                           uint32_t /* cas */) override {
    return unimplemented();
  }

  // Shared Queue
  WasmResult registerSharedQueue(string_view /* queue_name */,
                                 SharedQueueDequeueToken *token_ptr) override {
    return unimplemented();
  }
  WasmResult lookupSharedQueue(string_view /* vm_id */, string_view /* queue_name */,
                               uint32_t * /* token_ptr */) override {
    return unimplemented();
  }
  WasmResult dequeueSharedQueue(SharedQueueDequeueToken /* token */,
                                std::string * /* data_ptr */) override {
    return unimplemented();
  }
  WasmResult enqueueSharedQueue(SharedQueueEnqueueToken /* token */,
                                string_view /* data */) override {
    return unimplemented();
  }

  // Header/Trailer/Metadata Maps
  WasmResult addHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                               string_view /* value */) override {
    return unimplemented();
  }
  WasmResult getHeaderMapValue(WasmHeaderMapType /* type */, string_view /* key */,
                               string_view *result) override {
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
