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

#include "include/proxy-wasm/wasm_vm.h"

namespace proxy_wasm {

class DynVmPluginSource {
public:
  virtual ~DynVmPluginSource();
  void *dl_handle = nullptr;
  int memfd = -1;
};

// A wrapper for the dynamically linked DynVm plugin which implements the Wasm ABI.
class DynVmPlugin {
public:
  DynVmPlugin() = default;
  virtual ~DynVmPlugin() = default;

  // NB: These are defined rather than declared PURE because gmock uses __LINE__ internally for
  // uniqueness, making it impossible to use FOR_ALL_WASM_VM_EXPORTS with MOCK_METHOD.
#define _DEFINE_GET_FUNCTION(_T) virtual void getFunction(std::string_view, _T *f);
  FOR_ALL_WASM_VM_EXPORTS(_DEFINE_GET_FUNCTION)
#undef _DEFINE_GET_FUNCTION

  WasmVm *wasm_vm_ = nullptr;
  std::shared_ptr<DynVmPluginSource> source;
};

} // namespace proxy_wasm
