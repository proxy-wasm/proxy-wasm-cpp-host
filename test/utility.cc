// Copyright 2021 Google LLC
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

#include "test/utility.h"

namespace proxy_wasm {

std::vector<std::string> getRuntimes() {
  std::vector<std::string> runtimes = {
#if defined(WASM_V8)
    "v8",
#endif
#if defined(WASM_WAVM)
    "wavm",
#endif
#if defined(WASM_WASMTIME)
    "wasmtime",
#endif
    ""
  };
  runtimes.pop_back();
  return runtimes;
}
} // namespace proxy_wasm
