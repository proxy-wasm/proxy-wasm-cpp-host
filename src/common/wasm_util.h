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
#pragma once

#include <string_view>
#include <vector>
#include <unordered_map>

namespace proxy_wasm {
namespace common {

// Utilitiy functions which directly operate on Wasm bytecodes.
class WasmUtil {
public:
  /**
   * getCustomSection extract the view of the custom section for a given name.
   * @param begin is the beggining of bytecode.
   * @param end is the end of bytecode.
   * @param name is the name of the custom section.
   * @param ret is the reference to store the resulting view to the custom section.
   * @return indicates whether parsing succeeded or not.
   */
  static bool getCustomSection(const char *begin, const char *end, std::string_view name,
                               std::string_view &ret);

  /**
   * getFunctionNameIndex constructs the map from function indexes to function names stored in
   * the function name subsection in "name" custom section.
   * See https://webassembly.github.io/spec/core/appendix/custom.html#binary-funcnamesec for detail.
   * @param begin is the beggining of bytecode.
   * @param end is the end of bytecode.
   * @param ret the reference to store map from function indexes to function names.
   * @return indicates whether parsing succeeded or not.
   */
  static bool getFunctionNameIndex(const char *begin, const char *end,
                                   std::unordered_map<uint32_t, std::string> &ret);

  /**
   * getStrippedSource gets Wasm module without Custom Sections to save some memory in workers.
   * @param begin is the beggining of original bytecode.
   * @param end is the end of original bytecode.
   * @param ret the reference to the stripped bytecode.
   * @return indicates whether parsing succeeded or not.
   */
  static bool getStrippedSource(const char *begin, const char *end, std::vector<char> &ret);

  /**
   * parseVarint parses the bytecode following LEB128.
   * @param begin is the postion where parsing starts.
   * @param end is the end of bytecode.
   * @param ret is the reference to store the resulting value.
   * @return indicates whether parsing succeeded or not.
   */
  static bool parseVarint(const char *&begin, const char *end, uint32_t &ret);
};

} // namespace common
} // namespace proxy_wasm
