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

// Provide compatibiliby for projects which have not yet moved to C++17.
// TODO: remove this when all dependent projects have upgraded.

#if __cplusplus >= 201703L
#include <optional>
#include <string_view>
#else
#include "absl/types/optional.h"
#include "absl/strings/string_view.h"
#endif

namespace proxy_wasm {
#ifndef __cpp_lib_optional
template <typename T> using optional = absl::optional<T>;
// Only available in C++17
// inline constexpr absl::nullopt_t nullopt = absl::nullopt;
#define PROXY_WASM_NULLOPT absl::nullopt
#else
template <typename T> using optional = std::optional<T>;
// Only available in C++17
// inline constexpr std::nullopt_t nullopt = std::nullopt;
#define PROXY_WASM_NULLOPT std::nullopt
#endif

#ifndef __cpp_lib_string_view
using string_view = absl::string_view;
#else
using string_view = std::string_view;
#endif
} // namespace proxy_wasm
