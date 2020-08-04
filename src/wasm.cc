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

#include "include/proxy-wasm/wasm.h"
#include "src/third_party/base64.h"
#include "src/third_party/picosha2.h"

#include <cassert>
#include <stdio.h>

#include <algorithm>
#include <cctype>
#include <limits>
#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>

namespace proxy_wasm {

thread_local ContextBase *current_context_;
thread_local uint32_t effective_context_id_ = 0;

namespace {

// Map from Wasm Key to the local Wasm instance.
thread_local std::unordered_map<std::string, std::weak_ptr<WasmHandleBase>> local_wasms;
// Map from Wasm Key to the base Wasm instance, using a pointer to avoid the initialization fiasco.
std::mutex base_wasms_mutex;
std::unordered_map<std::string, std::weak_ptr<WasmHandleBase>> *base_wasms = nullptr;
std::unordered_map<std::string, WasmForeignFunction> *foreign_functions = nullptr;

const std::string INLINE_STRING = "<inline>";

const uint8_t *decodeVarint(const uint8_t *pos, const uint8_t *end, uint32_t *out) {
  uint32_t ret = 0;
  int shift = 0;
  while (pos < end && (*pos & 0x80)) {
    ret |= (*pos & 0x7f) << shift;
    shift += 7;
    pos++;
  }
  if (pos < end) {
    ret |= *pos << shift;
    pos++;
  }
  *out = ret;
  return pos;
}

std::string Sha256(string_view data) {
  std::vector<unsigned char> hash(picosha2::k_digest_size);
  picosha2::hash256(data.begin(), data.end(), hash.begin(), hash.end());
  return std::string(reinterpret_cast<const char *>(&hash[0]), hash.size());
}

std::string Xor(string_view a, string_view b) {
  assert(a.size() == b.size());
  std::string result;
  result.reserve(a.size());
  for (size_t i = 0; i < a.size(); i++) {
    result.push_back(a[i] ^ b[i]);
  }
  return result;
}

} // namespace

std::string makeVmKey(string_view vm_id, string_view vm_configuration, string_view code) {
  std::string vm_key = Sha256(vm_id);
  vm_key = Xor(vm_key, Sha256(vm_configuration));
  vm_key = Xor(vm_key, Sha256(code));
  auto start = reinterpret_cast<uint8_t *>(&*vm_key.begin());
  auto end = start + vm_key.size();
  return base64Encode(start, end);
}

class WasmBase::ShutdownHandle {
public:
  ~ShutdownHandle() { wasm_->finishShutdown(); }
  ShutdownHandle(std::shared_ptr<WasmBase> wasm) : wasm_(wasm) {}

private:
  std::shared_ptr<WasmBase> wasm_;
};

RegisterForeignFunction::RegisterForeignFunction(std::string name, WasmForeignFunction f) {
  if (!foreign_functions) {
    foreign_functions = new std::remove_reference<decltype(*foreign_functions)>::type;
  }
  (*foreign_functions)[name] = f;
}

void WasmBase::registerCallbacks() {
#define _REGISTER(_fn)                                                                             \
  wasm_vm_->registerCallback(                                                                      \
      "env", #_fn, &exports::_fn,                                                                  \
      &ConvertFunctionWordToUint32<decltype(exports::_fn),                                         \
                                   exports::_fn>::convertFunctionWordToUint32)
  _REGISTER(pthread_equal);
#undef _REGISTER

#define _REGISTER_WASI(_fn)                                                                        \
  wasm_vm_->registerCallback(                                                                      \
      "wasi_unstable", #_fn, &exports::wasi_unstable_##_fn,                                        \
      &ConvertFunctionWordToUint32<decltype(exports::wasi_unstable_##_fn),                         \
                                   exports::wasi_unstable_##_fn>::convertFunctionWordToUint32);    \
  wasm_vm_->registerCallback(                                                                      \
      "wasi_snapshot_preview1", #_fn, &exports::wasi_unstable_##_fn,                               \
      &ConvertFunctionWordToUint32<decltype(exports::wasi_unstable_##_fn),                         \
                                   exports::wasi_unstable_##_fn>::convertFunctionWordToUint32)
  _REGISTER_WASI(fd_write);
  _REGISTER_WASI(fd_read);
  _REGISTER_WASI(fd_seek);
  _REGISTER_WASI(fd_close);
  _REGISTER_WASI(fd_fdstat_get);
  _REGISTER_WASI(environ_get);
  _REGISTER_WASI(environ_sizes_get);
  _REGISTER_WASI(args_get);
  _REGISTER_WASI(args_sizes_get);
  _REGISTER_WASI(proc_exit);
#undef _REGISTER_WASI

  // Calls with the "proxy_" prefix.
#define _REGISTER_PROXY(_fn)                                                                       \
  wasm_vm_->registerCallback(                                                                      \
      "env", "proxy_" #_fn, &exports::_fn,                                                         \
      &ConvertFunctionWordToUint32<decltype(exports::_fn),                                         \
                                   exports::_fn>::convertFunctionWordToUint32);
  _REGISTER_PROXY(log);

  _REGISTER_PROXY(get_status);

  _REGISTER_PROXY(set_property);
  _REGISTER_PROXY(get_property);

  _REGISTER_PROXY(send_local_response);

  _REGISTER_PROXY(get_shared_data);
  _REGISTER_PROXY(set_shared_data);

  _REGISTER_PROXY(register_shared_queue);
  _REGISTER_PROXY(resolve_shared_queue);
  _REGISTER_PROXY(dequeue_shared_queue);
  _REGISTER_PROXY(enqueue_shared_queue);

  _REGISTER_PROXY(get_header_map_value);
  _REGISTER_PROXY(add_header_map_value);
  _REGISTER_PROXY(replace_header_map_value);
  _REGISTER_PROXY(remove_header_map_value);
  _REGISTER_PROXY(get_header_map_pairs);
  _REGISTER_PROXY(set_header_map_pairs);
  _REGISTER_PROXY(get_header_map_size);

  _REGISTER_PROXY(get_buffer_status);
  _REGISTER_PROXY(get_buffer_bytes);
  _REGISTER_PROXY(set_buffer_bytes);

  _REGISTER_PROXY(http_call);

  _REGISTER_PROXY(grpc_call);
  _REGISTER_PROXY(grpc_stream);
  _REGISTER_PROXY(grpc_close);
  _REGISTER_PROXY(grpc_cancel);
  _REGISTER_PROXY(grpc_send);

  _REGISTER_PROXY(set_tick_period_milliseconds);
  _REGISTER_PROXY(get_current_time_nanoseconds);

  _REGISTER_PROXY(define_metric);
  _REGISTER_PROXY(increment_metric);
  _REGISTER_PROXY(record_metric);
  _REGISTER_PROXY(get_metric);

  _REGISTER_PROXY(set_effective_context);
  _REGISTER_PROXY(done);
  _REGISTER_PROXY(call_foreign_function);

  if (abiVersion() == AbiVersion::ProxyWasm_0_1_0) {
    _REGISTER_PROXY(get_configuration);
    _REGISTER_PROXY(continue_request);
    _REGISTER_PROXY(continue_response);
    _REGISTER_PROXY(clear_route_cache);
  } else if (abiVersion() == AbiVersion::ProxyWasm_0_2_0) {
    _REGISTER_PROXY(continue_stream);
    _REGISTER_PROXY(close_stream);
  }
#undef _REGISTER_PROXY
}

void WasmBase::getFunctions() {
#define _GET(_fn) wasm_vm_->getFunction(#_fn, &_fn##_);
  _GET(_start);
  _GET(__wasm_call_ctors);

  _GET(malloc);
  if (!malloc_) {
    fail("Wasm module is missing malloc function.");
  }
#undef _GET

#define _GET_PROXY(_fn) wasm_vm_->getFunction("proxy_" #_fn, &_fn##_);
#define _GET_PROXY_ABI(_fn, _abi) wasm_vm_->getFunction("proxy_" #_fn, &_fn##_abi##_);
  _GET_PROXY(validate_configuration);
  _GET_PROXY(on_vm_start);
  _GET_PROXY(on_configure);
  _GET_PROXY(on_tick);

  _GET_PROXY(on_context_create);

  _GET_PROXY(on_new_connection);
  _GET_PROXY(on_downstream_data);
  _GET_PROXY(on_upstream_data);
  _GET_PROXY(on_downstream_connection_close);
  _GET_PROXY(on_upstream_connection_close);

  _GET_PROXY(on_request_body);
  _GET_PROXY(on_request_trailers);
  _GET_PROXY(on_request_metadata);
  _GET_PROXY(on_response_body);
  _GET_PROXY(on_response_trailers);
  _GET_PROXY(on_response_metadata);
  _GET_PROXY(on_http_call_response);
  _GET_PROXY(on_grpc_receive);
  _GET_PROXY(on_grpc_close);
  _GET_PROXY(on_grpc_receive_initial_metadata);
  _GET_PROXY(on_grpc_receive_trailing_metadata);
  _GET_PROXY(on_queue_ready);
  _GET_PROXY(on_done);
  _GET_PROXY(on_log);
  _GET_PROXY(on_delete);

  if (abiVersion() == AbiVersion::ProxyWasm_0_1_0) {
    _GET_PROXY_ABI(on_request_headers, _abi_01);
    _GET_PROXY_ABI(on_response_headers, _abi_01);
  } else if (abiVersion() == AbiVersion::ProxyWasm_0_2_0) {
    _GET_PROXY_ABI(on_request_headers, _abi_02);
    _GET_PROXY_ABI(on_response_headers, _abi_02);
    _GET_PROXY(on_foreign_function);
  }
#undef _GET_PROXY_ABI
#undef _GET_PROXY
}

WasmBase::WasmBase(const std::shared_ptr<WasmHandleBase> &base_wasm_handle, WasmVmFactory factory)
    : std::enable_shared_from_this<WasmBase>(*base_wasm_handle->wasm()),
      vm_id_(base_wasm_handle->wasm()->vm_id_), vm_key_(base_wasm_handle->wasm()->vm_key_),
      started_from_(base_wasm_handle->wasm()->wasm_vm()->cloneable()),
      base_wasm_handle_(base_wasm_handle) {
  if (started_from_ != Cloneable::NotCloneable) {
    wasm_vm_ = base_wasm_handle->wasm()->wasm_vm()->clone();
  } else {
    wasm_vm_ = factory();
  }
  if (!wasm_vm_) {
    failed_ = true;
  } else {
    wasm_vm_->setFailCallback([this] { failed_ = true; });
  }
}

WasmBase::WasmBase(std::unique_ptr<WasmVm> wasm_vm, string_view vm_id, string_view vm_configuration,
                   string_view vm_key)
    : vm_id_(std::string(vm_id)), vm_key_(std::string(vm_key)), wasm_vm_(std::move(wasm_vm)),
      vm_configuration_(std::string(vm_configuration)) {
  if (!wasm_vm_) {
    failed_ = true;
  } else {
    wasm_vm_->setFailCallback([this] { failed_ = true; });
  }
}

WasmBase::~WasmBase() {}

bool WasmBase::initialize(const std::string &code, bool allow_precompiled) {
  if (!wasm_vm_) {
    return false;
  }

  if (started_from_ == Cloneable::NotCloneable) {
    auto ok = wasm_vm_->load(code, allow_precompiled);
    if (!ok) {
      return false;
    }
    auto metadata = wasm_vm_->getCustomSection("emscripten_metadata");
    if (!metadata.empty()) {
      // See https://github.com/emscripten-core/emscripten/blob/incoming/tools/shared.py#L3059
      is_emscripten_ = true;
      auto start = reinterpret_cast<const uint8_t *>(metadata.data());
      auto end = reinterpret_cast<const uint8_t *>(metadata.data() + metadata.size());
      start = decodeVarint(start, end, &emscripten_metadata_major_version_);
      start = decodeVarint(start, end, &emscripten_metadata_minor_version_);
      start = decodeVarint(start, end, &emscripten_abi_major_version_);
      start = decodeVarint(start, end, &emscripten_abi_minor_version_);
      uint32_t temp;
      if (emscripten_metadata_major_version_ > 0 || emscripten_metadata_minor_version_ > 1) {
        // metadata 0.2 - added: wasm_backend.
        start = decodeVarint(start, end, &temp);
      }
      start = decodeVarint(start, end, &temp);
      start = decodeVarint(start, end, &temp);
      if (emscripten_metadata_major_version_ > 0 || emscripten_metadata_minor_version_ > 0) {
        // metadata 0.1 - added: global_base, dynamic_base, dynamictop_ptr and tempdouble_ptr.
        start = decodeVarint(start, end, &temp);
        start = decodeVarint(start, end, &temp);
        start = decodeVarint(start, end, &temp);
        decodeVarint(start, end, &temp);
        if (emscripten_metadata_major_version_ > 0 || emscripten_metadata_minor_version_ > 2) {
          // metadata 0.3 - added: standalone_wasm.
          start = decodeVarint(start, end, &emscripten_standalone_wasm_);
        }
      }
    }

    code_ = code;
    allow_precompiled_ = allow_precompiled;
  }

  abi_version_ = wasm_vm_->getAbiVersion();
  if (abi_version_ == AbiVersion::Unknown) {
    return false;
  }

  if (started_from_ != Cloneable::InstantiatedModule) {
    registerCallbacks();
    wasm_vm_->link(vm_id_);
  }

  vm_context_.reset(createVmContext());
  getFunctions();

  if (started_from_ != Cloneable::InstantiatedModule) {
    // Base VM was already started, so don't try to start cloned VMs again.
    startVm(vm_context_.get());
  }

  return !isFailed();
}

ContextBase *WasmBase::getOrCreateRootContext(const std::shared_ptr<PluginBase> &plugin) {
  auto root_context = getRootContext(plugin->root_id_);
  if (!root_context) {
    auto context = std::unique_ptr<ContextBase>(createRootContext(plugin));
    root_context = context.get();
    root_contexts_[plugin->root_id_] = std::move(context);
  }
  return root_context;
}

void WasmBase::startVm(ContextBase *root_context) {
  /* Call "_start" function, and fallback to "__wasm_call_ctors" if the former is not available. */
  if (_start_) {
    _start_(root_context);
  } else if (__wasm_call_ctors_) {
    __wasm_call_ctors_(root_context);
  }
}

bool WasmBase::configure(ContextBase *root_context, std::shared_ptr<PluginBase> plugin) {
  return root_context->onConfigure(plugin);
}

ContextBase *WasmBase::start(std::shared_ptr<PluginBase> plugin) {
  auto root_id = plugin->root_id_;
  auto it = root_contexts_.find(root_id);
  if (it != root_contexts_.end()) {
    it->second->onStart(plugin);
    return it->second.get();
  }
  auto context = std::unique_ptr<ContextBase>(createRootContext(plugin));
  auto context_ptr = context.get();
  root_contexts_[root_id] = std::move(context);
  if (!context_ptr->onStart(plugin)) {
    return nullptr;
  }
  return context_ptr;
};

uint32_t WasmBase::allocContextId() {
  while (true) {
    auto id = next_context_id_++;
    // Prevent reuse.
    if (contexts_.find(id) == contexts_.end()) {
      return id;
    }
  }
}

void WasmBase::startShutdown() {
  bool all_done = true;
  for (auto &p : root_contexts_) {
    if (!p.second->onDone()) {
      all_done = false;
      pending_done_.insert(p.second.get());
    }
  }
  if (!all_done) {
    shutdown_handle_ = std::make_unique<ShutdownHandle>(shared_from_this());
  } else {
    finishShutdown();
  }
}

WasmResult WasmBase::done(ContextBase *root_context) {
  auto it = pending_done_.find(root_context);
  if (it == pending_done_.end()) {
    return WasmResult::NotFound;
  }
  pending_done_.erase(it);
  if (pending_done_.empty() && shutdown_handle_) {
    // Defer the delete so that onDelete is not called from within the done() handler.
    addAfterVmCallAction(
        [shutdown_handle = shutdown_handle_.release()]() { delete shutdown_handle; });
  }
  return WasmResult::Ok;
}

void WasmBase::finishShutdown() {
  for (auto &p : root_contexts_) {
    p.second->onDelete();
  }
}

WasmForeignFunction WasmBase::getForeignFunction(string_view function_name) {
  auto it = foreign_functions->find(std::string(function_name));
  if (it != foreign_functions->end()) {
    return it->second;
  }
  return nullptr;
}

std::shared_ptr<WasmHandleBase> createWasm(std::string vm_key, std::string code,
                                           std::shared_ptr<PluginBase> plugin,
                                           WasmHandleFactory factory,
                                           WasmHandleCloneFactory clone_factory,
                                           bool allow_precompiled) {
  std::shared_ptr<WasmHandleBase> wasm_handle;
  {
    std::lock_guard<std::mutex> guard(base_wasms_mutex);
    if (!base_wasms) {
      base_wasms = new std::remove_reference<decltype(*base_wasms)>::type;
    }
    auto it = base_wasms->find(vm_key);
    if (it != base_wasms->end()) {
      wasm_handle = it->second.lock();
      if (!wasm_handle) {
        base_wasms->erase(it);
      }
    }
    if (wasm_handle) {
      return wasm_handle;
    }
    wasm_handle = factory(vm_key);
    if (!wasm_handle) {
      return nullptr;
    }
    (*base_wasms)[vm_key] = wasm_handle;
  }

  if (!wasm_handle->wasm()->initialize(code, allow_precompiled)) {
    wasm_handle->wasm()->fail("Failed to initialize Wasm code");
    return nullptr;
  }
  auto configuration_canary_handle = clone_factory(wasm_handle);
  if (!configuration_canary_handle) {
    wasm_handle->wasm()->fail("Failed to clone Base Wasm");
    return nullptr;
  }
  if (!configuration_canary_handle->wasm()->initialize(code, allow_precompiled)) {
    wasm_handle->wasm()->fail("Failed to initialize Wasm code");
    return nullptr;
  }
  auto root_context = configuration_canary_handle->wasm()->start(plugin);
  if (!root_context) {
    configuration_canary_handle->wasm()->fail("Failed to start base Wasm");
    return nullptr;
  }
  if (!configuration_canary_handle->wasm()->configure(root_context, plugin)) {
    configuration_canary_handle->wasm()->fail("Failed to configure base Wasm plugin");
    return nullptr;
  }
  configuration_canary_handle->kill();
  return wasm_handle;
};

static std::shared_ptr<WasmHandleBase>
createThreadLocalWasm(std::shared_ptr<WasmHandleBase> &base_wasm,
                      std::shared_ptr<PluginBase> plugin, WasmHandleCloneFactory factory) {
  auto wasm_handle = factory(base_wasm);
  if (!wasm_handle) {
    return nullptr;
  }
  if (!wasm_handle->wasm()->initialize(wasm_handle->wasm()->code(),
                                       wasm_handle->wasm()->allow_precompiled())) {
    wasm_handle->wasm()->fail("Failed to initialize Wasm code");
    return nullptr;
  }
  ContextBase *root_context = wasm_handle->wasm()->start(plugin);
  if (!root_context) {
    base_wasm->wasm()->fail("Failed to start thread-local Wasm");
    return nullptr;
  }
  if (!wasm_handle->wasm()->configure(root_context, plugin)) {
    base_wasm->wasm()->fail("Failed to configure thread-local Wasm plugin");
    return nullptr;
  }
  local_wasms[std::string(wasm_handle->wasm()->vm_key())] = wasm_handle;
  return wasm_handle;
}

std::shared_ptr<WasmHandleBase> getThreadLocalWasm(string_view vm_key) {
  auto it = local_wasms.find(std::string(vm_key));
  if (it == local_wasms.end()) {
    return nullptr;
  }
  auto wasm = it->second.lock();
  if (!wasm) {
    local_wasms.erase(std::string(vm_key));
  }
  return wasm;
}

std::shared_ptr<WasmHandleBase>
getOrCreateThreadLocalWasm(std::shared_ptr<WasmHandleBase> base_wasm,
                           std::shared_ptr<PluginBase> plugin, WasmHandleCloneFactory factory) {
  auto wasm_handle = getThreadLocalWasm(base_wasm->wasm()->vm_key());
  if (wasm_handle) {
    auto root_context = wasm_handle->wasm()->getOrCreateRootContext(plugin);
    if (!wasm_handle->wasm()->configure(root_context, plugin)) {
      base_wasm->wasm()->fail("Failed to configure thread-local Wasm code");
      return nullptr;
    }
    return wasm_handle;
  }
  return createThreadLocalWasm(base_wasm, plugin, factory);
}

void clearWasmCachesForTesting() {
  local_wasms.clear();
  std::lock_guard<std::mutex> guard(base_wasms_mutex);
  if (base_wasms) {
    delete base_wasms;
    base_wasms = nullptr;
  }
}

} // namespace proxy_wasm
