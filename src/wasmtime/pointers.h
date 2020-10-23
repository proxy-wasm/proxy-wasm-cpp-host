
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

#include "src/common/c_smart_ptr.h"
#include "wasmtime/include/wasm.h"
#include "wasmtime/include/wasmtime.h"

namespace proxy_wasm {
namespace wasmtime {

using WasmEnginePtr = common::CSmartPtr<wasm_engine_t, wasm_engine_delete>;
using WasmFuncPtr = common::CSmartPtr<wasm_func_t, wasm_func_delete>;
using WasmStorePtr = common::CSmartPtr<wasm_store_t, wasm_store_delete>;
using WasmModulePtr = common::CSmartPtr<wasm_module_t, wasm_module_delete>;
using WasmSharedModulePtr = common::CSmartPtr<wasm_shared_module_t, wasm_shared_module_delete>;
using WasmMemoryPtr = common::CSmartPtr<wasm_memory_t, wasm_memory_delete>;
using WasmTablePtr = common::CSmartPtr<wasm_table_t, wasm_table_delete>;
using WasmInstancePtr = common::CSmartPtr<wasm_instance_t, wasm_instance_delete>;
using WasmFunctypePtr = common::CSmartPtr<wasm_functype_t, wasm_functype_delete>;
using WasmTrapPtr = common::CSmartPtr<wasm_trap_t, wasm_trap_delete>;
} // namespace wasmtime

} // namespace proxy_wasm
