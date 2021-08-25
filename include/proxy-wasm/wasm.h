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

#include <string.h>

#include <atomic>
#include <cassert>
#include <deque>
#include <map>
#include <memory>
#include <unordered_map>
#include <unordered_set>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/exports.h"
#include "include/proxy-wasm/wasm_vm.h"
#include "include/proxy-wasm/vm_id_handle.h"

namespace proxy_wasm {

#include "proxy_wasm_common.h"

class ContextBase;
class WasmHandleBase;
using WasmHandleBaseSharedPtr = std::shared_ptr<WasmHandleBase>;

using WasmVmFactory = std::function<std::unique_ptr<WasmVm>()>;
using CallOnThreadFunction = std::function<void(std::function<void()>)>;

struct SanitizationConfig {
  std::vector<std::string> argument_list;
  bool is_allowlist;
};
using AllowedCapabilitiesMap = std::unordered_map<std::string, SanitizationConfig>;

// Wasm execution instance. Manages the host side of the Wasm interface.
class WasmBase : public std::enable_shared_from_this<WasmBase> {
public:
  WasmBase(std::unique_ptr<WasmVm> wasm_vm, std::string_view vm_id,
           std::string_view vm_configuration, std::string_view vm_key,
           std::unordered_map<std::string, std::string> envs,
           AllowedCapabilitiesMap allowed_capabilities);
  WasmBase(const WasmHandleBaseSharedPtr &base_wasm, WasmVmFactory factory);
  virtual ~WasmBase();

  bool load(const std::string &code, bool allow_precompiled = false);
  bool initialize();
  void startVm(ContextBase *root_context);
  bool configure(ContextBase *root_context, std::shared_ptr<PluginBase> plugin);
  // Returns the root ContextBase or nullptr if onStart returns false.
  ContextBase *start(std::shared_ptr<PluginBase> plugin);

  std::string_view vm_id() const { return vm_id_; }
  std::string_view vm_key() const { return vm_key_; }
  WasmVm *wasm_vm() const { return wasm_vm_.get(); }
  ContextBase *vm_context() const { return vm_context_.get(); }
  ContextBase *getRootContext(const std::shared_ptr<PluginBase> &plugin, bool allow_closed);
  ContextBase *getContext(uint32_t id) {
    auto it = contexts_.find(id);
    if (it != contexts_.end())
      return it->second;
    return nullptr;
  }
  uint32_t allocContextId();
  bool isFailed() { return failed_ != FailState::Ok; }
  FailState fail_state() { return failed_; }

  const std::string &vm_configuration() const;

  const std::string &moduleBytecode() const { return module_bytecode_; }
  const std::string &modulePrecompiled() const { return module_precompiled_; }
  const std::unordered_map<uint32_t, std::string> functionNames() const { return function_names_; }

  void timerReady(uint32_t root_context_id);
  void queueReady(uint32_t root_context_id, uint32_t token);

  void startShutdown(std::string_view plugin_key);
  void startShutdown();
  WasmResult done(ContextBase *root_context);
  void finishShutdown();

  // Proxy specific extension points.
  //
  virtual void registerCallbacks(); // Register functions called out from Wasm.
  virtual void getFunctions();      // Get functions call into Wasm.
  virtual CallOnThreadFunction callOnThreadFunction() {
    unimplemented();
    return nullptr;
  }

  // Capability restriction (restricting/exposing the ABI).
  bool capabilityAllowed(std::string capability_name) {
    return allowed_capabilities_.empty() ||
           allowed_capabilities_.find(capability_name) != allowed_capabilities_.end();
  }

  virtual ContextBase *createVmContext() { return new ContextBase(this); }
  virtual ContextBase *createRootContext(const std::shared_ptr<PluginBase> &plugin) {
    return new ContextBase(this, plugin);
  }
  virtual ContextBase *createContext(const std::shared_ptr<PluginBase> &plugin) {
    return new ContextBase(this, plugin);
  }
  virtual void setTimerPeriod(uint32_t root_context_id, std::chrono::milliseconds period) {
    timer_period_[root_context_id] = period;
  }

  // Support functions.
  //
  void *allocMemory(uint64_t size, uint64_t *address);
  // Allocate a null-terminated string in the VM and return the pointer to use as a call arguments.
  uint64_t copyString(std::string_view s);
  // Copy the data in 's' into the VM along with the pointer-size pair. Returns true on success.
  bool copyToPointerSize(std::string_view s, uint64_t ptr_ptr, uint64_t size_ptr);
  template <typename T> bool setDatatype(uint64_t ptr, const T &t);

  void fail(FailState fail_state, std::string_view message) {
    error(message);
    failed_ = fail_state;
  }
  virtual void error(std::string_view message) { std::cerr << message << "\n"; }
  virtual void unimplemented() { error("unimplemented proxy-wasm API"); }

  AbiVersion abiVersion() const { return abi_version_; }

  const std::unordered_map<std::string, std::string> &envs() { return envs_; }

  // Called to raise the flag which indicates that the context should stop iteration regardless of
  // returned filter status from Proxy-Wasm extensions. For example, we ignore
  // FilterHeadersStatus::Continue after a local reponse is sent by the host.
  void stopNextIteration(bool stop) { stop_iteration_ = stop; };
  bool isNextIterationStopped() { return stop_iteration_; };

  void addAfterVmCallAction(std::function<void()> f) { after_vm_call_actions_.push_back(f); }
  void doAfterVmCallActions() {
    // NB: this may be deleted by a delayed function unless prevented.
    if (!after_vm_call_actions_.empty()) {
      auto self = shared_from_this();
      while (!self->after_vm_call_actions_.empty()) {
        auto f = std::move(self->after_vm_call_actions_.front());
        self->after_vm_call_actions_.pop_front();
        f();
      }
    }
  }

  static const uint32_t kMetricTypeMask = 0x3;    // Enough to cover the 3 types.
  static const uint32_t kMetricIdIncrement = 0x4; // Enough to cover the 3 types.
  bool isCounterMetricId(uint32_t metric_id) {
    return (metric_id & kMetricTypeMask) == static_cast<uint32_t>(MetricType::Counter);
  }
  bool isGaugeMetricId(uint32_t metric_id) {
    return (metric_id & kMetricTypeMask) == static_cast<uint32_t>(MetricType::Gauge);
  }
  bool isHistogramMetricId(uint32_t metric_id) {
    return (metric_id & kMetricTypeMask) == static_cast<uint32_t>(MetricType::Histogram);
  }
  uint32_t nextCounterMetricId() { return next_counter_metric_id_ += kMetricIdIncrement; }
  uint32_t nextGaugeMetricId() { return next_gauge_metric_id_ += kMetricIdIncrement; }
  uint32_t nextHistogramMetricId() { return next_histogram_metric_id_ += kMetricIdIncrement; }

  enum class CalloutType : uint32_t {
    HttpCall = 0,
    GrpcCall = 1,
    GrpcStream = 2,
  };
  static const uint32_t kCalloutTypeMask = 0x3;  // Enough to cover the 3 types.
  static const uint32_t kCalloutIncrement = 0x4; // Enough to cover the 3 types.
  bool isHttpCallId(uint32_t callout_id) {
    return (callout_id & kCalloutTypeMask) == static_cast<uint32_t>(CalloutType::HttpCall);
  }
  bool isGrpcCallId(uint32_t callout_id) {
    return (callout_id & kCalloutTypeMask) == static_cast<uint32_t>(CalloutType::GrpcCall);
  }
  bool isGrpcStreamId(uint32_t callout_id) {
    return (callout_id & kCalloutTypeMask) == static_cast<uint32_t>(CalloutType::GrpcStream);
  }
  uint32_t nextHttpCallId() {
    // TODO(PiotrSikora): re-add rollover protection (requires at least 1 billion callouts).
    return next_http_call_id_ += kCalloutIncrement;
  }
  uint32_t nextGrpcCallId() {
    // TODO(PiotrSikora): re-add rollover protection (requires at least 1 billion callouts).
    return next_grpc_call_id_ += kCalloutIncrement;
  }
  uint32_t nextGrpcStreamId() {
    // TODO(PiotrSikora): re-add rollover protection (requires at least 1 billion callouts).
    return next_grpc_stream_id_ += kCalloutIncrement;
  }

protected:
  friend class ContextBase;
  class ShutdownHandle;

  void establishEnvironment(); // Language specific environments.

  std::string vm_id_;  // User-provided vm_id.
  std::string vm_key_; // vm_id + hash of code.
  std::unique_ptr<WasmVm> wasm_vm_;
  std::optional<Cloneable> started_from_;

  uint32_t next_context_id_ = 1;            // 0 is reserved for the VM context.
  std::shared_ptr<ContextBase> vm_context_; // Context unrelated to any specific root or stream
                                            // (e.g. for global constructors).
  std::unordered_map<std::string, std::unique_ptr<ContextBase>> root_contexts_; // Root contexts.
  std::unordered_map<std::string, std::unique_ptr<ContextBase>> pending_done_;  // Root contexts.
  std::unordered_set<std::unique_ptr<ContextBase>> pending_delete_;             // Root contexts.
  std::unordered_map<uint32_t, ContextBase *> contexts_;                 // Contains all contexts.
  std::unordered_map<uint32_t, std::chrono::milliseconds> timer_period_; // per root_id.
  std::unique_ptr<ShutdownHandle> shutdown_handle_;
  std::unordered_map<std::string, std::string>
      envs_; // environment variables passed through wasi.environ_get

  WasmCallVoid<0> _initialize_; /* WASI reactor (Emscripten v1.39.17+, Rust nightly) */
  WasmCallVoid<0> _start_;      /* WASI command (Emscripten v1.39.0+, TinyGo) */

  WasmCallWord<2> main_;
  WasmCallWord<1> malloc_;

  // Calls into the VM.
  WasmCallWord<2> validate_configuration_;
  WasmCallWord<2> on_vm_start_;
  WasmCallWord<2> on_configure_;
  WasmCallVoid<1> on_tick_;

  WasmCallVoid<2> on_context_create_;

  WasmCallWord<1> on_new_connection_;
  WasmCallWord<3> on_downstream_data_;
  WasmCallWord<3> on_upstream_data_;
  WasmCallVoid<2> on_downstream_connection_close_;
  WasmCallVoid<2> on_upstream_connection_close_;

  WasmCallWord<2> on_request_headers_abi_01_;
  WasmCallWord<3> on_request_headers_abi_02_;
  WasmCallWord<3> on_request_body_;
  WasmCallWord<2> on_request_trailers_;
  WasmCallWord<2> on_request_metadata_;

  WasmCallWord<2> on_response_headers_abi_01_;
  WasmCallWord<3> on_response_headers_abi_02_;
  WasmCallWord<3> on_response_body_;
  WasmCallWord<2> on_response_trailers_;
  WasmCallWord<2> on_response_metadata_;

  WasmCallVoid<5> on_http_call_response_;

  WasmCallVoid<3> on_grpc_receive_;
  WasmCallVoid<3> on_grpc_close_;
  WasmCallVoid<3> on_grpc_create_initial_metadata_;
  WasmCallVoid<3> on_grpc_receive_initial_metadata_;
  WasmCallVoid<3> on_grpc_receive_trailing_metadata_;

  WasmCallVoid<2> on_queue_ready_;
  WasmCallVoid<3> on_foreign_function_;

  WasmCallWord<1> on_done_;
  WasmCallVoid<1> on_log_;
  WasmCallVoid<1> on_delete_;

#define FOR_ALL_MODULE_FUNCTIONS(_f)                                                               \
  _f(validate_configuration) _f(on_vm_start) _f(on_configure) _f(on_tick) _f(on_context_create)    \
      _f(on_new_connection) _f(on_downstream_data) _f(on_upstream_data)                            \
          _f(on_downstream_connection_close) _f(on_upstream_connection_close) _f(on_request_body)  \
              _f(on_request_trailers) _f(on_request_metadata) _f(on_response_body)                 \
                  _f(on_response_trailers) _f(on_response_metadata) _f(on_http_call_response)      \
                      _f(on_grpc_receive) _f(on_grpc_close) _f(on_grpc_receive_initial_metadata)   \
                          _f(on_grpc_receive_trailing_metadata) _f(on_queue_ready) _f(on_done)     \
                              _f(on_log) _f(on_delete)

  // Capabilities which are allowed to be linked to the module. If this is empty, restriction
  // is not enforced.
  AllowedCapabilitiesMap allowed_capabilities_;

  WasmHandleBaseSharedPtr base_wasm_handle_;

  // Used by the base_wasm to enable non-clonable thread local Wasm(s) to be constructed.
  std::string module_bytecode_;
  std::string module_precompiled_;
  std::unordered_map<uint32_t, std::string> function_names_;

  // ABI version.
  AbiVersion abi_version_ = AbiVersion::Unknown;

  std::string vm_configuration_;
  bool stop_iteration_ = false;
  FailState failed_ = FailState::Ok; // Wasm VM fatal error.

  // Plugin Stats/Metrics
  uint32_t next_counter_metric_id_ = static_cast<uint32_t>(MetricType::Counter);
  uint32_t next_gauge_metric_id_ = static_cast<uint32_t>(MetricType::Gauge);
  uint32_t next_histogram_metric_id_ = static_cast<uint32_t>(MetricType::Histogram);

  // HTTP/gRPC callouts.
  uint32_t next_http_call_id_ = static_cast<uint32_t>(CalloutType::HttpCall);
  uint32_t next_grpc_call_id_ = static_cast<uint32_t>(CalloutType::GrpcCall);
  uint32_t next_grpc_stream_id_ = static_cast<uint32_t>(CalloutType::GrpcStream);

  // Actions to be done after the call into the VM returns.
  std::deque<std::function<void()>> after_vm_call_actions_;

  std::shared_ptr<VmIdHandle> vm_id_handle_;
};

/**
 * VmCreationRateLimiter is used by base Wasms in order to rate limit the recovery recreation of
 * Wasm VMs. Set via the constructor of WasmHandleBase managing a Wasm base.
 */
using VmCreationRateLimiter = std::function<bool()>;

/**
 * WasmHandleBase enables shutdown operations to run post deletion (e.g. post listener drain).
 * TODO(mathetake): seems like when WasnHandle is deleted, the underlying WasmBase is also deleted,
 * which means that all the root contexts and VM is deleted immediately after this handle is
 * deleted. Maybe we don't need to define WasmHandleBase at all, though needs further investigation.
 */
class WasmHandleBase : public std::enable_shared_from_this<WasmHandleBase> {
public:
  /**
   * @param wasm_base is the WasmBase managed by this WasmHandle. Must not be nullptr.
   * @param rate_limiter is only used when this is for a base wasm instance.
   */
  explicit WasmHandleBase(std::shared_ptr<WasmBase> wasm_base,
                          VmCreationRateLimiter rate_limiter = nullptr)
      : wasm_base_(wasm_base), rate_limiter_(rate_limiter) {
    assert(wasm_base_);
  }

  ~WasmHandleBase() {
    // For configuration canary, wasm_base_ becomes nullptr via kill().
    if (wasm_base_) {
      wasm_base_->startShutdown();
    }
  }

  /**
   * @return true if recreating a thread local wasm from the base wasm managed by this handle is
   * allowed.
   */
  bool recreateAllowed() { return rate_limiter_ ? rate_limiter_() : false; }

  /**
   * Used to kill WasmBase managed by this WasmHandle, which means we just delete WasmBase without
   * doing shutdown operations. Only used by canary handle when we create a base wasm.
   */
  void kill() { wasm_base_ = nullptr; }

  // TODO(@mathetake)　consider using WasmBase& instead of shared_ptr for return type.
  std::shared_ptr<WasmBase> &wasm() { return wasm_base_; }

protected:
  // Must not be nullptr.
  // TODO(@mathetake): consider using unique_ptr instead.
  std::shared_ptr<WasmBase> wasm_base_;
  // Only set for base wasms. Nullable.
  VmCreationRateLimiter rate_limiter_;
};

std::string makeVmKey(std::string_view vm_id, std::string_view configuration,
                      std::string_view code);

/**
 * WasmHandleFactory is used to create a base wasm instance. TODO(@mathetake): Have separate classes
 * of WasmHandle for "base wasm" and "thread local wasm" to make it clearer. Then rename this
 * factory.
 */
using WasmHandleFactory = std::function<WasmHandleBaseSharedPtr(std::string_view vm_key)>;

/**
 * WasmHandleCloneFactory is used to create (for non-clonable runtime) or clone from a given base
 * wasm. TODO(@mahetake): Have separate classes of WasmHandle for "base wasm" and "thread local
 * wasm" to make it clearer. Then rename this factory.
 */
using WasmHandleCloneFactory = std::function<WasmHandleBaseSharedPtr(WasmHandleBaseSharedPtr wasm)>;

/**
 * createBaseWasm create a "base wasm" from given arguments. a "base wasm" is used to
 * create "thread local wasm" by clone or recreation. "base" and "thread local" are both
 * instances of WasmBase/WasmHandleBase classes, so how it is created differentiates them.
 * TODO(@mathetake): Have separate classes of WasmHandle for "base wasm" and "thread local wasm" to
 * make it clearer.
 * @return nullptr on failure (i.e. initialization of the VM fails).
 */
WasmHandleBaseSharedPtr createBaseWasm(std::string vm_key, std::string code,
                                       std::shared_ptr<PluginBase> plugin,
                                       WasmHandleFactory factory,
                                       WasmHandleCloneFactory clone_factory,
                                       bool allow_precompiled);

/**
 * getThreadLocalWasm gets the "thread local" wasm for given vm_key.
 */
WasmHandleBaseSharedPtr getThreadLocalWasm(std::string_view vm_key);

/**
 * PluginHandleBase corresponds to a single instance of Plugin, managing not only Wasm VM used by
 * this plugin, but also its lifecycle. - when this is delted, this class invokes in-VM shutdown
 * operation for this Plugin.
 */
class PluginHandleBase : public std::enable_shared_from_this<PluginHandleBase> {
public:
  /**
   * @param wasm_handle is the Wasm VM handle used by this plugin. Must not be nullptr.
   * @param plugin is the configuration used to initialize this plugin and VM. Must not be nullptr.
   */
  explicit PluginHandleBase(WasmHandleBaseSharedPtr wasm_handle, std::shared_ptr<PluginBase> plugin)
      : plugin_(plugin), wasm_handle_(wasm_handle) {
    assert(plugin_ != nullptr);
    assert(wasm_handle_ != nullptr);
  }
  ~PluginHandleBase() { wasm_handle_->wasm()->startShutdown(plugin_->key()); }

  /**
   * @return true if the VM used by this plugin is not in a failed state.
   */
  bool isFailed() { return wasm_handle_->wasm()->isFailed(); }

  // TODO(@mathetake)　consider using PluginBase& instead of shared_ptr for return type.
  std::shared_ptr<PluginBase> &plugin() { return plugin_; }
  // TODO(@mathetake)　consider using WasmHandleBase& instead of shared_ptr for return type.
  WasmHandleBaseSharedPtr &wasmHandle() { return wasm_handle_; }

protected:
  // Must not be nullptr.
  std::shared_ptr<PluginBase> plugin_;
  // Must not be nullptr.
  WasmHandleBaseSharedPtr wasm_handle_;
};

using PluginHandleBaseSharedPtr = std::shared_ptr<PluginHandleBase>;
using PluginHandleFactory = std::function<std::shared_ptr<PluginHandleBase>(
    WasmHandleBaseSharedPtr base_wasm, std::shared_ptr<PluginBase> plugin)>;

/**
 * PluginHandleManagerBase is responsible for create/recreate a plugin handle instance for given
 * same plugin  configuration and base wasm. tryRestartPlugin can be used to restart
 * PlugnHandle in case of VM failures.
 */
class PluginHandleManagerBase {
public:
  /**
   * @param base_wasm_handle is used for initializing this plugin and thread local Wasm. This can be
   * nullptr.
   * @param plugin is the configuration used to initialize this plugin and Wasm VM.
   * @param wasm_handle_clone_factory is used to clone a WasmHandle from the base_wasm_handle.
   * @param plugin_factory is used to create a PluginHandleBase instance with the created
   * thread-local WasmHandle.
   */
  PluginHandleManagerBase(const WasmHandleBaseSharedPtr base_wasm_handle,
                          const std::shared_ptr<PluginBase> plugin,
                          WasmHandleCloneFactory wasm_handle_clone_factory,
                          PluginHandleFactory plugin_factory)
      : base_wasm_handle_(base_wasm_handle), plugin_factory_(plugin_factory), plugin_(plugin),
        wasm_handle_clone_factory_(wasm_handle_clone_factory) {
    assert(plugin != nullptr);
    assert(wasm_handle_clone_factory != nullptr);
    assert(plugin_factory != nullptr);
    initializePlugin();
  }

  /**
   * tryRestartPlugin is used to restart plugin and re-create plugin_handle_.
   * @return true if the restart succeeded, false otherwise.
   */
  bool tryRestartPlugin();

  /**
   * @return the current PluginHandleBase managed by this manager if it is healthy, otherwise
   * nullptr so restarts can be tried at callsites.
   */
  PluginHandleBaseSharedPtr getHealthyPluginHandle() {
    if (handle_ && !handle_->isFailed()) {
      return handle_;
    }
    return nullptr;
  };

private:
  // Set in the constructor.
  const WasmHandleBaseSharedPtr base_wasm_handle_;
  PluginHandleFactory plugin_factory_;
  const std::shared_ptr<PluginBase> plugin_;
  WasmHandleCloneFactory wasm_handle_clone_factory_;

  // Set via initializePlugin or tryRestartPlugin.
  PluginHandleBaseSharedPtr handle_{nullptr};

  // Get an existing ThreadLocal VM matching 'vm_id' or create one using 'base_wavm' by cloning or
  // using it it as a template.
  PluginHandleBaseSharedPtr getOrCreateThreadLocalPlugin();
  WasmHandleBaseSharedPtr getOrCreateThreadLocalWasmHandle();
  bool tryStartPlugin(bool should_rate_limit);
  void initializePlugin();
};

// Clear Base Wasm cache and the thread-local Wasm sandbox cache for the calling thread.
void clearWasmCachesForTesting();

inline const std::string &WasmBase::vm_configuration() const {
  if (base_wasm_handle_)
    return base_wasm_handle_->wasm()->vm_configuration_;
  return vm_configuration_;
}

inline void *WasmBase::allocMemory(uint64_t size, uint64_t *address) {
  if (!malloc_) {
    return nullptr;
  }
  Word a = malloc_(vm_context(), size);
  if (!a.u64_) {
    return nullptr;
  }
  auto memory = wasm_vm_->getMemory(a.u64_, size);
  if (!memory) {
    return nullptr;
  }
  *address = a.u64_;
  return const_cast<void *>(reinterpret_cast<const void *>(memory.value().data()));
}

inline uint64_t WasmBase::copyString(std::string_view s) {
  if (s.empty()) {
    return 0; // nullptr
  }
  uint64_t pointer;
  uint8_t *m = static_cast<uint8_t *>(allocMemory((s.size() + 1), &pointer));
  memcpy(m, s.data(), s.size());
  m[s.size()] = 0;
  return pointer;
}

inline bool WasmBase::copyToPointerSize(std::string_view s, uint64_t ptr_ptr, uint64_t size_ptr) {
  uint64_t pointer = 0;
  uint64_t size = s.size();
  void *p = nullptr;
  if (size > 0) {
    p = allocMemory(size, &pointer);
    if (!p) {
      return false;
    }
    memcpy(p, s.data(), size);
  }
  if (!wasm_vm_->setWord(ptr_ptr, Word(pointer))) {
    return false;
  }
  if (!wasm_vm_->setWord(size_ptr, Word(size))) {
    return false;
  }
  return true;
}

template <typename T> inline bool WasmBase::setDatatype(uint64_t ptr, const T &t) {
  return wasm_vm_->setMemory(ptr, sizeof(T), &t);
}

} // namespace proxy_wasm
