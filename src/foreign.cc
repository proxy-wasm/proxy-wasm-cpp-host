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

#include "include/proxy-wasm/wasm.h"

#ifndef WITHOUT_ZLIB
#include "zlib.h"
#endif

namespace proxy_wasm {
namespace {

#ifndef WITHOUT_ZLIB
RegisterForeignFunction compressFunction(
    "compress",
    [](WasmBase &, string_view arguments,
       std::function<void *(size_t size)> alloc_result) -> WasmResult {
      unsigned long dest_len = compressBound(arguments.size());
      std::unique_ptr<unsigned char[]> b(new unsigned char[dest_len]);
      if (compress(b.get(), &dest_len, reinterpret_cast<const unsigned char *>(arguments.data()),
                   arguments.size()) != Z_OK) {
        return WasmResult::SerializationFailure;
      }
      auto result = alloc_result(dest_len);
      memcpy(result, b.get(), dest_len);
      return WasmResult::Ok;
    });

RegisterForeignFunction
    uncompressFunction("uncompress",
                       [](WasmBase &, absl::string_view arguments,
                          std::function<void *(size_t size)> alloc_result) -> WasmResult {
                         unsigned long dest_len = arguments.size() * 2 + 2; // output estimate.
                         while (1) {
                           std::unique_ptr<unsigned char[]> b(new unsigned char[dest_len]);
                           auto r =
                               uncompress(b.get(), &dest_len,
                                          reinterpret_cast<const unsigned char *>(arguments.data()),
                                          arguments.size());
                           if (r == Z_OK) {
                             auto result = alloc_result(dest_len);
                             memcpy(result, b.get(), dest_len);
                             return WasmResult::Ok;
                           }
                           if (r != Z_MEM_ERROR) {
                             return WasmResult::SerializationFailure;
                           }
                           dest_len = dest_len * 2;
                         }
                       });
#endif

} // namespace
} // namespace proxy_wasm
