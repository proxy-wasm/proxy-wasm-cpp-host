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

#include <memory>

#include "include/proxy-wasm/wasm_vm.h"

namespace proxy_wasm {

// Enable or disable the Liftoff compiler for V8 WebAssembly.
// This function uses atomic operations internally but must be called before
// creating any V8 VMs to take effect. Calls after the first VM creation are
// silently ignored.
//
// @param enable when false (default), only TurboFan is used for eager compilation,
//   which is beneficial for use cases where VMs are cloned to share compiled code.
//   When true, Liftoff is enabled for faster startup time at the cost of
//   potentially slower execution.
void setV8LiftoffEnabled(bool enable);

std::unique_ptr<WasmVm> createV8Vm();

} // namespace proxy_wasm
