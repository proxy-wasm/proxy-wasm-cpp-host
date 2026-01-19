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

#include "src/common/types.h"
#include "crates/c-api/include/wasm.h"

namespace proxy_wasm::wasmtime {

using WasmEnginePtr = common::CSmartPtr<wasmtime_wasm_engine_t, wasmtime_wasm_engine_delete>;
using WasmFuncPtr = common::CSmartPtr<wasmtime_wasm_func_t, wasmtime_wasm_func_delete>;
using WasmStorePtr = common::CSmartPtr<wasmtime_wasm_store_t, wasmtime_wasm_store_delete>;
using WasmModulePtr = common::CSmartPtr<wasmtime_wasm_module_t, wasmtime_wasm_module_delete>;
using WasmSharedModulePtr =
    common::CSmartPtr<wasmtime_wasm_shared_module_t, wasmtime_wasm_shared_module_delete>;
using WasmMemoryPtr = common::CSmartPtr<wasmtime_wasm_memory_t, wasmtime_wasm_memory_delete>;
using WasmTablePtr = common::CSmartPtr<wasmtime_wasm_table_t, wasmtime_wasm_table_delete>;
using WasmInstancePtr = common::CSmartPtr<wasmtime_wasm_instance_t, wasmtime_wasm_instance_delete>;
using WasmFunctypePtr = common::CSmartPtr<wasmtime_wasm_functype_t, wasmtime_wasm_functype_delete>;
using WasmTrapPtr = common::CSmartPtr<wasmtime_wasm_trap_t, wasmtime_wasm_trap_delete>;
using WasmExternPtr = common::CSmartPtr<wasmtime_wasm_extern_t, wasmtime_wasm_extern_delete>;

using WasmByteVec = common::CSmartType<wasmtime_wasm_byte_vec_t, wasmtime_wasm_byte_vec_new_empty,
                                       wasmtime_wasm_byte_vec_delete>;
using WasmImporttypeVec =
    common::CSmartType<wasmtime_wasm_importtype_vec_t, wasmtime_wasm_importtype_vec_new_empty,
                       wasmtime_wasm_importtype_vec_delete>;
using WasmExportTypeVec =
    common::CSmartType<wasmtime_wasm_exporttype_vec_t, wasmtime_wasm_exporttype_vec_new_empty,
                       wasmtime_wasm_exporttype_vec_delete>;
using WasmExternVec =
    common::CSmartType<wasmtime_wasm_extern_vec_t, wasmtime_wasm_extern_vec_new_empty,
                       wasmtime_wasm_extern_vec_delete>;
using WasmValtypeVec =
    common::CSmartType<wasmtime_wasm_valtype_vec_t, wasmtime_wasm_valtype_vec_new_empty,
                       wasmtime_wasm_valtype_vec_delete>;

} // namespace proxy_wasm::wasmtime
