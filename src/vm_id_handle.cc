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

#include "include/proxy-wasm/vm_id_handle.h"

#include <deque>
#include <functional>
#include <mutex>
#include <memory>
#include <unordered_map>
#include <vector>

namespace proxy_wasm {

std::unordered_map<std::string, std::weak_ptr<VmIdHandle>> *global_vm_id_handles = nullptr;
std::vector<std::function<void(std::string_view vm_id)>> *global_vm_id_handle_callbacks = nullptr;
std::mutex global_vm_id_handle_mutex;

std::shared_ptr<VmIdHandle> getVmIdHandle(std::string_view vm_id) {
  std::lock_guard<std::mutex> lock(global_vm_id_handle_mutex);
  if (!global_vm_id_handle_callbacks) {
    global_vm_id_handle_callbacks = new std::vector<std::function<void(std::string_view vm_id)>>;
    global_vm_id_handles = new std::unordered_map<std::string, std::weak_ptr<VmIdHandle>>;
  }

  auto key = std::string(vm_id);
  auto it = global_vm_id_handles->find(key);
  if (it != global_vm_id_handles->end()) {
    auto handle = it->second.lock();
    if (handle) {
      return handle;
    }
    global_vm_id_handles->erase(key);
  }

  auto handle = std::make_shared<VmIdHandle>(key);
  (*global_vm_id_handles)[key] = handle;
  return handle;
};

void registerVmIdHandleCallback(std::function<void(std::string_view vm_id)> f) {
  std::lock_guard<std::mutex> lock(global_vm_id_handle_mutex);
  if (!global_vm_id_handle_callbacks) {
    global_vm_id_handle_callbacks = new std::vector<std::function<void(std::string_view vm_id)>>;
    global_vm_id_handles = new std::unordered_map<std::string, std::weak_ptr<VmIdHandle>>;
  }
  global_vm_id_handle_callbacks->push_back(f);
}

VmIdHandle::~VmIdHandle() {
  std::lock_guard<std::mutex> lock(global_vm_id_handle_mutex);
  if (global_vm_id_handle_callbacks) {
    for (auto f : *global_vm_id_handle_callbacks) {
      f(vm_id_);
    }
    global_vm_id_handles->erase(vm_id_);
  }
}

} // namespace proxy_wasm
