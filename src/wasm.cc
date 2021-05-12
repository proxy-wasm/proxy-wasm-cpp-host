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

#include <cassert>
#include <stdio.h>

#include <algorithm>
#include <cctype>
#include <limits>
#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>

#include "include/proxy-wasm/bytecode_util.h"
#include "include/proxy-wasm/vm_id_handle.h"

#include "src/third_party/base64.h"
#include "src/third_party/picosha2.h"

namespace proxy_wasm {

thread_local ContextBase *current_context_;
thread_local uint32_t effective_context_id_ = 0;

namespace {

// Map from Wasm Key to the local Wasm instance.
thread_local std::unordered_map<std::string, std::weak_ptr<WasmHandleBase>> local_wasms;
thread_local std::unordered_map<std::string, std::weak_ptr<PluginHandleBase>> local_plugins;
// Map from Wasm Key to the base Wasm instance, using a pointer to avoid the initialization fiasco.
std::mutex base_wasms_mutex;
std::unordered_map<std::string, std::weak_ptr<WasmHandleBase>> *base_wasms = nullptr;
std::unordered_map<std::string, WasmForeignFunction> *foreign_functions = nullptr;

const std::string INLINE_STRING = "<inline>";

std::string Sha256(std::string_view data) {
  std::vector<unsigned char> hash(picosha2::k_digest_size);
  picosha2::hash256(data.begin(), data.end(), hash.begin(), hash.end());
  return std::string(reinterpret_cast<const char *>(&hash[0]), hash.size());
}

std::string Xor(std::string_view a, std::string_view b) {
  assert(a.size() == b.size());
  std::string result;
  result.reserve(a.size());
  for (size_t i = 0; i < a.size(); i++) {
    result.push_back(a[i] ^ b[i]);
  }
  return result;
}

} // namespace

std::string makeVmKey(std::string_view vm_id, std::string_view vm_configuration,
                      std::string_view code) {
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

  // Register the capability with the VM if it has been allowed, otherwise register a stub.
#define _REGISTER(module_name, name_prefix, export_prefix, _fn)                                    \
  if (capabilityAllowed(name_prefix #_fn)) {                                                       \
    wasm_vm_->registerCallback(                                                                    \
        module_name, name_prefix #_fn, &exports::export_prefix##_fn,                               \
        &ConvertFunctionWordToUint32<decltype(exports::export_prefix##_fn),                        \
                                     exports::export_prefix##_fn>::convertFunctionWordToUint32);   \
  } else {                                                                                         \
    typedef decltype(exports::export_prefix##_fn) export_type;                                     \
    constexpr export_type *stub = &exports::_fn##Stub<export_type>::stub;                          \
    wasm_vm_->registerCallback(                                                                    \
        module_name, name_prefix #_fn, stub,                                                       \
        &ConvertFunctionWordToUint32<export_type, stub>::convertFunctionWordToUint32);             \
  }

#define _REGISTER_WASI_UNSTABLE(_fn) _REGISTER("wasi_unstable", , wasi_unstable_, _fn)
#define _REGISTER_WASI_SNAPSHOT(_fn) _REGISTER("wasi_snapshot_preview1", , wasi_unstable_, _fn)
  FOR_ALL_WASI_FUNCTIONS(_REGISTER_WASI_UNSTABLE);
  FOR_ALL_WASI_FUNCTIONS(_REGISTER_WASI_SNAPSHOT);
#undef _REGISTER_WASI_UNSTABLE
#undef _REGISTER_WASI_SNAPSHOT

#define _REGISTER_PROXY(_fn) _REGISTER("env", "proxy_", , _fn)
  FOR_ALL_HOST_FUNCTIONS(_REGISTER_PROXY);

  if (abiVersion() == AbiVersion::ProxyWasm_0_1_0) {
    _REGISTER_PROXY(get_configuration);
    _REGISTER_PROXY(continue_request);
    _REGISTER_PROXY(continue_response);
    _REGISTER_PROXY(clear_route_cache);
  } else if (abiVersion() == AbiVersion::ProxyWasm_0_2_0) {
    _REGISTER_PROXY(continue_stream);
    _REGISTER_PROXY(close_stream);
  } else if (abiVersion() == AbiVersion::ProxyWasm_0_2_1) {
    _REGISTER_PROXY(continue_stream);
    _REGISTER_PROXY(close_stream);
    _REGISTER_PROXY(get_log_level);
  }
#undef _REGISTER_PROXY

#undef _REGISTER
}

void WasmBase::getFunctions() {
#define _GET(_fn) wasm_vm_->getFunction(#_fn, &_fn##_);
#define _GET_ALIAS(_fn, _alias) wasm_vm_->getFunction(#_alias, &_fn##_);
  _GET(_initialize);
  if (_initialize_) {
    _GET(main);
  } else {
    _GET(_start);
  }

  _GET(malloc);
  if (!malloc_) {
    _GET_ALIAS(malloc, proxy_on_memory_allocate);
  }
  if (!malloc_) {
    fail(FailState::MissingFunction, "Wasm module is missing malloc function.");
  }
#undef _GET_ALIAS
#undef _GET

  // Try to point the capability to one of the module exports, if the capability has been allowed.
#define _GET_PROXY(_fn)                                                                            \
  if (capabilityAllowed("proxy_" #_fn)) {                                                          \
    wasm_vm_->getFunction("proxy_" #_fn, &_fn##_);                                                 \
  } else {                                                                                         \
    _fn##_ = nullptr;                                                                              \
  }
#define _GET_PROXY_ABI(_fn, _abi)                                                                  \
  if (capabilityAllowed("proxy_" #_fn)) {                                                          \
    wasm_vm_->getFunction("proxy_" #_fn, &_fn##_abi##_);                                           \
  } else {                                                                                         \
    _fn##_abi##_ = nullptr;                                                                        \
  }

  FOR_ALL_MODULE_FUNCTIONS(_GET_PROXY);

  if (abiVersion() == AbiVersion::ProxyWasm_0_1_0) {
    _GET_PROXY_ABI(on_request_headers, _abi_01);
    _GET_PROXY_ABI(on_response_headers, _abi_01);
  } else if (abiVersion() == AbiVersion::ProxyWasm_0_2_0 ||
             abiVersion() == AbiVersion::ProxyWasm_0_2_1) {
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
      envs_(base_wasm_handle->wasm()->envs()),
      allowed_capabilities_(base_wasm_handle->wasm()->allowed_capabilities_),
      base_wasm_handle_(base_wasm_handle) {
  if (started_from_ != Cloneable::NotCloneable) {
    wasm_vm_ = base_wasm_handle->wasm()->wasm_vm()->clone();
  } else {
    wasm_vm_ = factory();
  }
  if (!wasm_vm_) {
    failed_ = FailState::UnableToCreateVM;
  } else {
    wasm_vm_->setFailCallback([this](FailState fail_state) { failed_ = fail_state; });
  }
}

WasmBase::WasmBase(std::unique_ptr<WasmVm> wasm_vm, std::string_view vm_id,
                   std::string_view vm_configuration, std::string_view vm_key,
                   std::unordered_map<std::string, std::string> envs,
                   AllowedCapabilitiesMap allowed_capabilities)
    : vm_id_(std::string(vm_id)), vm_key_(std::string(vm_key)), wasm_vm_(std::move(wasm_vm)),
      envs_(envs), allowed_capabilities_(std::move(allowed_capabilities)),
      vm_configuration_(std::string(vm_configuration)), vm_id_handle_(getVmIdHandle(vm_id)) {
  if (!wasm_vm_) {
    failed_ = FailState::UnableToCreateVM;
  } else {
    wasm_vm_->setFailCallback([this](FailState fail_state) { failed_ = fail_state; });
  }
}

WasmBase::~WasmBase() {
  root_contexts_.clear();
  pending_done_.clear();
  pending_delete_.clear();
}

bool WasmBase::load(const std::string &code, bool allow_precompiled) {
  assert(!started_from_.has_value());

  if (!wasm_vm_) {
    return false;
  }

  if (wasm_vm_->runtime() == "null") {
    auto ok = wasm_vm_->load(code, {}, {});
    if (!ok) {
      fail(FailState::UnableToInitializeCode, "Failed to load NullVM plugin");
      return false;
    }
    abi_version_ = AbiVersion::ProxyWasm_0_2_1;
    return true;
  }

  // Get ABI version from the module.
  if (!BytecodeUtil::getAbiVersion(code, abi_version_)) {
    fail(FailState::UnableToInitializeCode, "Failed to parse corrupted Wasm module");
    return false;
  }
  if (abi_version_ == AbiVersion::Unknown) {
    fail(FailState::UnableToInitializeCode, "Missing or unknown Proxy-Wasm ABI version");
    return false;
  }

  // Get function names from the module.
  if (!BytecodeUtil::getFunctionNameIndex(code, function_names_)) {
    fail(FailState::UnableToInitializeCode, "Failed to parse corrupted Wasm module");
    return false;
  }

  std::string_view precompiled = {};

  if (allow_precompiled) {
    // Check if precompiled module exists.
    const auto section_name = wasm_vm_->getPrecompiledSectionName();
    if (!section_name.empty()) {
      if (!BytecodeUtil::getCustomSection(code, section_name, precompiled)) {
        fail(FailState::UnableToInitializeCode, "Failed to parse corrupted Wasm module");
        return false;
      }
    }
  }

  // Get original bytecode (possibly stripped).
  std::string stripped;
  if (!BytecodeUtil::getStrippedSource(code, stripped)) {
    fail(FailState::UnableToInitializeCode, "Failed to parse corrupted Wasm module");
    return false;
  }

  auto ok = wasm_vm_->load(stripped, precompiled, function_names_);
  if (!ok) {
    fail(FailState::UnableToInitializeCode, "Failed to load Wasm bytecode");
    return false;
  }

  // Store for future use in non-cloneable runtimes.
  if (wasm_vm_->cloneable() == Cloneable::NotCloneable) {
    module_bytecode_ = stripped;
    module_precompiled_ = precompiled;
  }

  return true;
}

bool WasmBase::initialize() {
  if (!wasm_vm_) {
    return false;
  }

  if (started_from_ == Cloneable::NotCloneable) {
    auto ok = wasm_vm_->load(base_wasm_handle_->wasm()->moduleBytecode(),
                             base_wasm_handle_->wasm()->modulePrecompiled(),
                             base_wasm_handle_->wasm()->functionNames());
    if (!ok) {
      fail(FailState::UnableToInitializeCode, "Failed to load Wasm module from base Wasm");
      return false;
    }
  }

  if (started_from_.has_value()) {
    abi_version_ = base_wasm_handle_->wasm()->abiVersion();
  }

  if (started_from_ != Cloneable::InstantiatedModule) {
    registerCallbacks();
    if (!wasm_vm_->link(vm_id_)) {
      return false;
    }
  }

  vm_context_.reset(createVmContext());
  getFunctions();

  if (started_from_ != Cloneable::InstantiatedModule) {
    // Base VM was already started, so don't try to start cloned VMs again.
    startVm(vm_context_.get());
  }

  return !isFailed();
}

ContextBase *WasmBase::getRootContext(const std::shared_ptr<PluginBase> &plugin,
                                      bool allow_closed) {
  auto it = root_contexts_.find(plugin->key());
  if (it != root_contexts_.end()) {
    return it->second.get();
  }
  if (allow_closed) {
    it = pending_done_.find(plugin->key());
    if (it != pending_done_.end()) {
      return it->second.get();
    }
  }
  return nullptr;
}

void WasmBase::startVm(ContextBase *root_context) {
  if (_initialize_) {
    // WASI reactor.
    _initialize_(root_context);
    if (main_) {
      // Call main() if it exists in WASI reactor, to allow module to
      // do early initialization (e.g. configure SDK).
      //
      // Re-using main() keeps this consistent when switching between
      // WASI command (that calls main()) and reactor (that doesn't).
      main_(root_context, Word(0), Word(0));
    }
  } else if (_start_) {
    // WASI command.
    _start_(root_context);
  }
}

bool WasmBase::configure(ContextBase *root_context, std::shared_ptr<PluginBase> plugin) {
  return root_context->onConfigure(plugin);
}

ContextBase *WasmBase::start(std::shared_ptr<PluginBase> plugin) {
  auto it = root_contexts_.find(plugin->key());
  if (it != root_contexts_.end()) {
    it->second->onStart(plugin);
    return it->second.get();
  }
  auto context = std::unique_ptr<ContextBase>(createRootContext(plugin));
  auto context_ptr = context.get();
  root_contexts_[plugin->key()] = std::move(context);
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

void WasmBase::startShutdown(std::string_view plugin_key) {
  auto it = root_contexts_.find(std::string(plugin_key));
  if (it != root_contexts_.end()) {
    if (it->second->onDone()) {
      it->second->onDelete();
    } else {
      pending_done_[it->first] = std::move(it->second);
    }
    root_contexts_.erase(it);
  }
}

void WasmBase::startShutdown() {
  auto it = root_contexts_.begin();
  while (it != root_contexts_.end()) {
    if (it->second->onDone()) {
      it->second->onDelete();
    } else {
      pending_done_[it->first] = std::move(it->second);
    }
    it = root_contexts_.erase(it);
  }
}

WasmResult WasmBase::done(ContextBase *root_context) {
  auto it = pending_done_.find(root_context->plugin_->key());
  if (it == pending_done_.end()) {
    return WasmResult::NotFound;
  }
  pending_delete_.insert(std::move(it->second));
  pending_done_.erase(it);
  // Defer the delete so that onDelete is not called from within the done() handler.
  shutdown_handle_ = std::make_unique<ShutdownHandle>(shared_from_this());
  addAfterVmCallAction(
      [shutdown_handle = shutdown_handle_.release()]() { delete shutdown_handle; });
  return WasmResult::Ok;
}

void WasmBase::finishShutdown() {
  auto it = pending_delete_.begin();
  while (it != pending_delete_.end()) {
    (*it)->onDelete();
    it = pending_delete_.erase(it);
  }
}

WasmForeignFunction WasmBase::getForeignFunction(std::string_view function_name) {
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

  if (!wasm_handle->wasm()->load(code, allow_precompiled)) {
    wasm_handle->wasm()->fail(FailState::UnableToInitializeCode, "Failed to load Wasm code");
    return nullptr;
  }
  if (!wasm_handle->wasm()->initialize()) {
    wasm_handle->wasm()->fail(FailState::UnableToInitializeCode, "Failed to initialize Wasm code");
    return nullptr;
  }
  auto configuration_canary_handle = clone_factory(wasm_handle);
  if (!configuration_canary_handle) {
    wasm_handle->wasm()->fail(FailState::UnableToCloneVM, "Failed to clone Base Wasm");
    return nullptr;
  }
  if (!configuration_canary_handle->wasm()->initialize()) {
    wasm_handle->wasm()->fail(FailState::UnableToInitializeCode, "Failed to initialize Wasm code");
    return nullptr;
  }
  auto root_context = configuration_canary_handle->wasm()->start(plugin);
  if (!root_context) {
    configuration_canary_handle->wasm()->fail(FailState::StartFailed, "Failed to start base Wasm");
    return nullptr;
  }
  if (!configuration_canary_handle->wasm()->configure(root_context, plugin)) {
    configuration_canary_handle->wasm()->fail(FailState::ConfigureFailed,
                                              "Failed to configure base Wasm plugin");
    return nullptr;
  }
  configuration_canary_handle->kill();
  return wasm_handle;
};

std::shared_ptr<WasmHandleBase> getThreadLocalWasm(std::string_view vm_key) {
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

static std::shared_ptr<WasmHandleBase>
getOrCreateThreadLocalWasm(std::shared_ptr<WasmHandleBase> base_handle,
                           WasmHandleCloneFactory clone_factory) {
  std::string vm_key(base_handle->wasm()->vm_key());
  // Get existing thread-local WasmVM.
  auto it = local_wasms.find(vm_key);
  if (it != local_wasms.end()) {
    auto wasm_handle = it->second.lock();
    if (wasm_handle) {
      return wasm_handle;
    }
    // Remove stale entry.
    local_wasms.erase(vm_key);
  }
  // Create and initialize new thread-local WasmVM.
  auto wasm_handle = clone_factory(base_handle);
  if (!wasm_handle) {
    base_handle->wasm()->fail(FailState::UnableToCloneVM, "Failed to clone Base Wasm");
    return nullptr;
  }

  if (!wasm_handle->wasm()->initialize()) {
    base_handle->wasm()->fail(FailState::UnableToInitializeCode, "Failed to initialize Wasm code");
    return nullptr;
  }
  local_wasms[vm_key] = wasm_handle;
  return wasm_handle;
}

std::shared_ptr<PluginHandleBase> getOrCreateThreadLocalPlugin(
    std::shared_ptr<WasmHandleBase> base_handle, std::shared_ptr<PluginBase> plugin,
    WasmHandleCloneFactory clone_factory, PluginHandleFactory plugin_factory) {
  std::string key(std::string(base_handle->wasm()->vm_key()) + "||" + plugin->key());
  // Get existing thread-local Plugin handle.
  auto it = local_plugins.find(key);
  if (it != local_plugins.end()) {
    auto plugin_handle = it->second.lock();
    if (plugin_handle) {
      return plugin_handle;
    }
    // Remove stale entry.
    local_plugins.erase(key);
  }
  // Get thread-local WasmVM.
  auto wasm_handle = getOrCreateThreadLocalWasm(base_handle, clone_factory);
  if (!wasm_handle) {
    return nullptr;
  }
  // Create and initialize new thread-local Plugin.
  auto plugin_context = wasm_handle->wasm()->start(plugin);
  if (!plugin_context) {
    base_handle->wasm()->fail(FailState::StartFailed, "Failed to start thread-local Wasm");
    return nullptr;
  }
  if (!wasm_handle->wasm()->configure(plugin_context, plugin)) {
    base_handle->wasm()->fail(FailState::ConfigureFailed,
                              "Failed to configure thread-local Wasm plugin");
    return nullptr;
  }
  auto plugin_handle = plugin_factory(wasm_handle, plugin);
  local_plugins[key] = plugin_handle;
  return plugin_handle;
}

void clearWasmCachesForTesting() {
  local_plugins.clear();
  local_wasms.clear();
  std::lock_guard<std::mutex> guard(base_wasms_mutex);
  if (base_wasms) {
    delete base_wasms;
    base_wasms = nullptr;
  }
}

} // namespace proxy_wasm
