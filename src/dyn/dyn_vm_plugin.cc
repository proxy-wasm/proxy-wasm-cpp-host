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

#include "include/proxy-wasm/wasm_vm.h"

#include "include/proxy-wasm/dyn_vm_plugin.h"
#include <cstdarg>
#include <dlfcn.h>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <thread>
#include <unistd.h>

namespace proxy_wasm {

std::string get_tid() {
  auto tid = std::this_thread::get_id();
  std::stringstream stream;
  stream << tid;
  return stream.str();
}

std::string call_format(std::string_view function_name, int count, ...) {
  std::stringstream out;
  out << "dynamic call<" << get_tid() << ">: " << function_name << "(";
  std::va_list args;
  va_start(args, count);
  for (int i = 0; i < count; ++i) {
    uint64_t num = va_arg(args, uint64_t);
    if (i > 0) {
      out << ", ";
    }
    out << num;
  }
  out << ")";
  va_end(args);
  return out.str();
}

DynVmPluginSource::~DynVmPluginSource() {
  if (dl_handle != nullptr) {
    dlclose(dl_handle);
  }
  if (memfd >= 0) {
    close(memfd);
  }
}

void DynVmPlugin::getFunction(std::string_view function_name, proxy_wasm::WasmCallVoid<0> *f) {
  if (source->dl_handle == nullptr) {
    *f = nullptr;
    return;
  }
  void *target = dlsym(source->dl_handle, std::string(function_name).c_str());
  if (target == nullptr) {
    *f = nullptr;
    return;
  }
  auto target_func = reinterpret_cast<void (*)()>(target);
  *f = [this, target_func, function_name](proxy_wasm::ContextBase *context) {
    proxy_wasm::SaveRestoreContext saved_context(context);
    wasm_vm_->integration()->trace(call_format(function_name, 0));
    target_func();
  };
}

void DynVmPlugin::getFunction(std::string_view function_name, proxy_wasm::WasmCallVoid<1> *f) {
  if (source->dl_handle == nullptr) {
    *f = nullptr;
    return;
  }
  void *target = dlsym(source->dl_handle, std::string(function_name).c_str());
  if (target == nullptr) {
    *f = nullptr;
    return;
  }
  auto target_func = reinterpret_cast<void (*)(uint64_t)>(target);
  *f = [this, target_func, function_name](proxy_wasm::ContextBase *context, proxy_wasm::Word w1) {
    proxy_wasm::SaveRestoreContext saved_context(context);
    wasm_vm_->integration()->trace(call_format(function_name, 1, w1));
    target_func(w1.u64_);
  };
}

void DynVmPlugin::getFunction(std::string_view function_name, proxy_wasm::WasmCallVoid<2> *f) {
  if (source->dl_handle == nullptr) {
    *f = nullptr;
    return;
  }
  void *target = dlsym(source->dl_handle, std::string(function_name).c_str());
  if (target == nullptr) {
    *f = nullptr;
    return;
  }
  auto target_func = reinterpret_cast<void (*)(uint64_t, uint64_t)>(target);
  *f = [this, target_func, function_name](proxy_wasm::ContextBase *context, proxy_wasm::Word w1,
                                          proxy_wasm::Word w2) {
    proxy_wasm::SaveRestoreContext saved_context(context);
    wasm_vm_->integration()->trace(call_format(function_name, 2, w1, w2));
    target_func(w1.u64_, w2.u64_);
  };
}

void DynVmPlugin::getFunction(std::string_view function_name, proxy_wasm::WasmCallVoid<3> *f) {
  if (source->dl_handle == nullptr) {
    *f = nullptr;
    return;
  }
  void *target = dlsym(source->dl_handle, std::string(function_name).c_str());
  if (target == nullptr) {
    *f = nullptr;
    return;
  }
  auto target_func = reinterpret_cast<void (*)(uint64_t, uint64_t, uint64_t)>(target);
  *f = [this, target_func, function_name](proxy_wasm::ContextBase *context, proxy_wasm::Word w1,
                                          proxy_wasm::Word w2, proxy_wasm::Word w3) {
    proxy_wasm::SaveRestoreContext saved_context(context);
    wasm_vm_->integration()->trace(call_format(function_name, 3, w1, w2, w3));
    target_func(w1.u64_, w2.u64_, w3.u64_);
  };
}

void DynVmPlugin::getFunction(std::string_view function_name, proxy_wasm::WasmCallVoid<5> *f) {
  if (source->dl_handle == nullptr) {
    *f = nullptr;
    return;
  }
  void *target = dlsym(source->dl_handle, std::string(function_name).c_str());
  if (target == nullptr) {
    *f = nullptr;
    return;
  }
  auto target_func =
      reinterpret_cast<void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)>(target);
  *f = [this, target_func, function_name](proxy_wasm::ContextBase *context, proxy_wasm::Word w1,
                                          proxy_wasm::Word w2, proxy_wasm::Word w3,
                                          proxy_wasm::Word w4, proxy_wasm::Word w5) {
    proxy_wasm::SaveRestoreContext saved_context(context);
    wasm_vm_->integration()->trace(call_format(function_name, 5, w1, w2, w3, w4, w5));
    target_func(w1.u64_, w2.u64_, w3.u64_, w4.u64_, w5.u64_);
  };
}

void DynVmPlugin::getFunction(std::string_view function_name, proxy_wasm::WasmCallWord<1> *f) {
  if (source->dl_handle == nullptr || function_name == "malloc") {
    *f = nullptr;
    return;
  }
  void *target = dlsym(source->dl_handle, std::string(function_name).c_str());
  if (target == nullptr) {
    *f = nullptr;
    return;
  }
  auto target_func = reinterpret_cast<uint64_t (*)(uint64_t)>(target);
  *f = [this, target_func, function_name](proxy_wasm::ContextBase *context, proxy_wasm::Word w1) {
    proxy_wasm::SaveRestoreContext saved_context(context);
    wasm_vm_->integration()->trace(call_format(function_name, 1, w1));
    return proxy_wasm::Word(target_func(w1.u64_));
  };
}

void DynVmPlugin::getFunction(std::string_view function_name, proxy_wasm::WasmCallWord<2> *f) {
  if (source->dl_handle == nullptr) {
    *f = nullptr;
    return;
  }
  void *target = dlsym(source->dl_handle, std::string(function_name).c_str());
  if (target == nullptr) {
    *f = nullptr;
    return;
  }
  auto target_func = reinterpret_cast<uint64_t (*)(uint64_t, uint64_t)>(target);
  *f = [this, target_func, function_name](proxy_wasm::ContextBase *context, proxy_wasm::Word w1,
                                          proxy_wasm::Word w2) {
    proxy_wasm::SaveRestoreContext saved_context(context);
    wasm_vm_->integration()->trace(call_format(function_name, 2, w1, w2));
    return proxy_wasm::Word(target_func(w1.u64_, w2.u64_));
  };
}

void DynVmPlugin::getFunction(std::string_view function_name, proxy_wasm::WasmCallWord<3> *f) {
  if (source->dl_handle == nullptr) {
    *f = nullptr;
    return;
  }
  void *target = dlsym(source->dl_handle, std::string(function_name).c_str());
  if (target == nullptr) {
    *f = nullptr;
    return;
  }
  auto target_func = reinterpret_cast<uint64_t (*)(uint64_t, uint64_t, uint64_t)>(target);
  *f = [this, target_func, function_name](proxy_wasm::ContextBase *context, proxy_wasm::Word w1,
                                          proxy_wasm::Word w2, proxy_wasm::Word w3) {
    proxy_wasm::SaveRestoreContext saved_context(context);
    wasm_vm_->integration()->trace(call_format(function_name, 3, w1, w2, w3));
    return proxy_wasm::Word(target_func(w1.u64_, w2.u64_, w3.u64_));
  };
}

} // namespace proxy_wasm