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

// #ifdef PROXY_WASM_USE_ABSL
#ifndef __cpp_lib_optional
#include "absl/types/optional.h"
#include "absl/strings/string_view.h"
#else
#include <optional>
#include <string_view>
#endif

namespace proxy_wasm {
// #ifdef PROXY_WASM_USE_ABSL
#ifndef __cpp_lib_optional
using string_view = absl::string_view;
template <typename T> using optional = absl::optional<T>;
#else
using string_view = std::string_view;
template <typename T> using optional = std::optional<T>;
#endif
} // namespace proxy_wasm
