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

#include "include/proxy-wasm/dyn_vm.h"

#include <cstring>
#include <dlfcn.h>
#include <limits>
#include <memory>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <unordered_map>
#include <utility>
#include <vector>

namespace proxy_wasm {

std::unique_ptr<WasmVm> DynVm::clone() {
  auto cloned_vm = std::make_unique<DynVm>();
  if (integration()) {
    cloned_vm->integration().reset(integration()->clone());
  }
  cloned_vm->plugin_ = std::make_unique<DynVmPlugin>();
  cloned_vm->plugin_->source = plugin_->source;
  cloned_vm->plugin_->wasm_vm_ = cloned_vm.get();

  return cloned_vm;
}

// "Load" the plugin by obtaining a pointer to it from the factory.
bool DynVm::load(std::string_view plugin_name, std::string_view /*precompiled*/,
                 const std::unordered_map<uint32_t, std::string> & /*function_names*/) {
  plugin_ = std::make_unique<DynVmPlugin>();
  plugin_->source = std::make_shared<DynVmPluginSource>();
  // We make the syscall directly w/o the glibc wrapper, as glibc 1.27 is required, but Ubuntu 16
  // which Istio uses runs glibc 1.23. plugin_->source->memfd = memfd_create("dyn_plugin", 0);
  plugin_->source->memfd =
      static_cast<int>(syscall(SYS_memfd_create, static_cast<const char *>("dyn_plugin"), 0));
  if (plugin_->source->memfd < 0) {
    integration()->error("failed to open memfd for dl: " + std::string(strerror(errno)));
    return false;
  }
  char path[100];
  snprintf(path, sizeof(path), "/proc/%u/fd/%d", getpid(), plugin_->source->memfd);

  size_t written = 0;
  ssize_t wrote;
  const char *data = plugin_name.data();
  while (written < plugin_name.size()) {
    wrote = write(plugin_->source->memfd, data + written, plugin_name.length() - written);
    if (wrote < 0) {
      integration()->error("failed to write to memfd: " + std::string(strerror(errno)));
      return false;
    }
    if (wrote == 0) {
      integration()->error("failed to write to memfd, EOF on write");
      return false;
    }
    written += wrote;
  }
  fsync(plugin_->source->memfd);

  plugin_->source->dl_handle = dlopen(path, RTLD_NOW);
  if (plugin_->source->dl_handle == nullptr) {
    integration()->error("failed to open dl handle: " + std::string(dlerror()));
    return false;
  }

  plugin_->wasm_vm_ = this;
  return true;
}

bool DynVm::link(std::string_view /* name */) { return true; }

uint64_t DynVm::getMemorySize() { return std::numeric_limits<uint64_t>::max(); }

// NulVm pointers are just native pointers.
std::optional<std::string_view> DynVm::getMemory(uint64_t pointer, uint64_t size) {
  if (pointer == 0 && size != 0) {
    return std::nullopt;
  }
  return std::string_view(reinterpret_cast<char *>(pointer), static_cast<size_t>(size));
}

bool DynVm::setMemory(uint64_t pointer, uint64_t size, const void *data) {
  if (pointer == 0 || data == nullptr) {
    if (size != 0) {
      return false;
    }
    return true;
  }
  auto *p = reinterpret_cast<char *>(pointer);
  memcpy(p, data, size);
  return true;
}

bool DynVm::setWord(uint64_t pointer, Word data) {
  if (pointer == 0) {
    return false;
  }
  auto *p = reinterpret_cast<char *>(pointer);
  memcpy(p, &data.u64_, sizeof(data.u64_));
  return true;
}

bool DynVm::getWord(uint64_t pointer, Word *data) {
  if (pointer == 0) {
    return false;
  }
  auto *p = reinterpret_cast<char *>(pointer);
  memcpy(&data->u64_, p, sizeof(data->u64_));
  return true;
}

size_t DynVm::getWordSize() { return sizeof(uint64_t); }

std::string_view DynVm::getPrecompiledSectionName() {
  // Return nothing: there is no WASM file.
  return {};
}

} // namespace proxy_wasm
