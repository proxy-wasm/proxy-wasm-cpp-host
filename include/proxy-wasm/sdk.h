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

#include <string>
#include <cstdint>

namespace proxy_wasm {

namespace internal {

// isolate those includes to prevent ::proxy_wasm namespace pollution with std
// namespace definitions.
namespace proxy_wasm {

#include "proxy_wasm_common.h"
#include "proxy_wasm_enums.h"

} // namespace proxy_wasm

} // namespace internal

// proxy_wasm_common.h
using WasmResult = internal::proxy_wasm::WasmResult;
using WasmHeaderMapType = internal::proxy_wasm::WasmHeaderMapType;
using WasmBufferType = internal::proxy_wasm::WasmBufferType;
using WasmBufferFlags = internal::proxy_wasm::WasmBufferFlags;
using WasmStreamType = internal::proxy_wasm::WasmStreamType;

// proxy_wasm_enums.h
using LogLevel = internal::proxy_wasm::LogLevel;
using FilterStatus = internal::proxy_wasm::FilterStatus;
using FilterHeadersStatus = internal::proxy_wasm::FilterHeadersStatus;
using FilterMetadataStatus = internal::proxy_wasm::FilterMetadataStatus;
using FilterTrailersStatus = internal::proxy_wasm::FilterTrailersStatus;
using FilterDataStatus = internal::proxy_wasm::FilterDataStatus;
using GrpcStatus = internal::proxy_wasm::GrpcStatus;
using MetricType = internal::proxy_wasm::MetricType;
using CloseType = internal::proxy_wasm::CloseType;

} // namespace proxy_wasm
