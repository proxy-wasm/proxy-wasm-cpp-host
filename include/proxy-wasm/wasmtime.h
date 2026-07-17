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

#include <cstdint>

#include "include/proxy-wasm/wasm_vm.h"
#include "include/proxy-wasm/limits.h"

namespace proxy_wasm {

enum class WasmtimeCompiler {
  // Optimizing compiler for Wasmtime. Performs optimizations during loading,
  // which results in faster execution at the expense of load time.
  kCranelift,
  // Fast baseline compiler for Wasmtime. Does not perform optimizations, but
  // loads plugins faster.
  kWinch,
};

struct WasmtimeOptions {
  uint64_t max_wasm_memory_size_bytes = PROXY_WASM_HOST_MAX_WASM_MEMORY_SIZE_BYTES;
  WasmtimeCompiler compiler = WasmtimeCompiler::kCranelift;
};

std::unique_ptr<WasmVm> createWasmtimeVm(WasmtimeOptions options = {});

} // namespace proxy_wasm
