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

#include "src/common/wasm_util.h"

#include <fstream>
#include <iostream>
#include <sstream>

#include "test/utility.h"

#include "gtest/gtest.h"

namespace proxy_wasm {
namespace common {

TEST(TestWasmCommonUtil, getCustomSection) {
  std::vector<char> custom_section = {
      0x00, 0x61, 0x73, 0x6d,       // Wasm magic
      0x01, 0x00, 0x00, 0x00,       // Wasm version
      0x00,                         // custom section id
      0x0a,                         // section length
      0x04, 0x68, 0x65, 0x79, 0x21, // section name: "hey!"
      0x68, 0x65, 0x6c, 0x6c, 0x6f, // content: "hello"
  };
  std::string_view section = {};

  // OK.
  EXPECT_TRUE(WasmUtil::getCustomSection(
      custom_section.data(), custom_section.data() + custom_section.size(), "hey!", section));
  EXPECT_EQ(std::string(section), "hello");
  section = {};

  // Non exist.
  EXPECT_TRUE(WasmUtil::getCustomSection(
      custom_section.data(), custom_section.data() + custom_section.size(), "non-exist", section));
  EXPECT_EQ(section, "");

  // Fail due to the corrupted bytecode.
  // TODO(@mathetake): here we haven't covered all the parsing failure branches. Add more cases.
  EXPECT_FALSE(WasmUtil::getCustomSection(
      custom_section.data(), custom_section.data() + custom_section.size() - 3, "hey", section));
  EXPECT_FALSE(WasmUtil::getCustomSection(
      custom_section.data() + 1, custom_section.data() + custom_section.size(), "hey", section));
}

TEST(TestWasmCommonUtil, getFunctionNameIndex) {
  const auto source = readTestWasmFile("abi_export.wasm");
  std::unordered_map<uint32_t, std::string> actual;
  // OK.
  EXPECT_TRUE(WasmUtil::getFunctionNameIndex(source.data(), source.data() + source.size(), actual));
  EXPECT_FALSE(actual.empty());
  EXPECT_EQ(actual.find(0)->second, "proxy_abi_version_0_2_0");

  // Fail due to the corrupted bytecode.
  // TODO(@mathetake): here we haven't covered all the parsing failure branches. Add more cases.
  actual = {};
  std::string_view name_section = {};
  EXPECT_TRUE(WasmUtil::getCustomSection(source.data(), source.data() + source.size(), "name",
                                         name_section));
  // Passing module with malformed custom section.
  EXPECT_FALSE(WasmUtil::getFunctionNameIndex(source.data(), name_section.data() + 1, actual));
  EXPECT_TRUE(actual.empty());
}

TEST(TestWasmCommonUtil, getStrippedSource) {
  // Unmodified case.
  auto source = readTestWasmFile("abi_export.wasm");
  std::vector<char> actual;
  EXPECT_TRUE(WasmUtil::getStrippedSource(source.data(), source.data() + source.size(), actual));
  // No `precompiled_` is found in the custom sections.
  EXPECT_TRUE(actual.empty());

  // Append "precompiled_test" custom section
  std::vector<char> custom_section = {// custom section id
                                      0x00,
                                      // section length
                                      0x13,
                                      // name length
                                      0x10,
                                      // name = precompiled_test
                                      0x70, 0x72, 0x65, 0x63, 0x6f, 0x6d, 0x70, 0x69, 0x6c, 0x65,
                                      0x64, 0x5f, 0x74, 0x65, 0x73, 0x74,
                                      // content
                                      0x01, 0x01};

  source.append(custom_section.data(), custom_section.size());
  std::string_view section = {};
  EXPECT_TRUE(WasmUtil::getCustomSection(source.data(), source.data() + source.size(),
                                         "precompiled_test", section));
  EXPECT_FALSE(section.empty());

  // Chcek if the custom section is stripped.
  actual = {};
  EXPECT_TRUE(WasmUtil::getStrippedSource(source.data(), source.data() + source.size(), actual));
  // No `precompiled_` is found in the custom sections.
  EXPECT_FALSE(actual.empty());
  EXPECT_EQ(actual.size(), source.size() - custom_section.size());
}

TEST(WasmUtil, parseVarint) {
  std::vector<char> source;
  const char *begin = source.data();
  uint32_t ret = 0;
  EXPECT_FALSE(WasmUtil::parseVarint(begin, source.data(), ret));

  source = {0x04};
  begin = source.data();
  EXPECT_TRUE(WasmUtil::parseVarint(begin, begin + source.size(), ret));
  EXPECT_EQ(0x04, ret);
  ret = 0;

  source = {static_cast<char>(0x80), 0x7f};
  begin = source.data();
  EXPECT_TRUE(WasmUtil::parseVarint(begin, begin + source.size(), ret));
  EXPECT_EQ(16256, ret);
  ret = 0;

  source = {static_cast<char>(0x89), static_cast<char>(0x80), static_cast<char>(0x80),
            static_cast<char>(0x80), 0x01};
  begin = source.data();
  EXPECT_TRUE(WasmUtil::parseVarint(begin, begin + source.size(), ret));
  EXPECT_EQ(268435465, ret);
}

} // namespace common
} // namespace proxy_wasm
