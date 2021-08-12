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

#include "include/proxy-wasm/signature_util.h"

#include <fstream>
#include <iostream>
#include <sstream>

#include "test/utility.h"

#include "gtest/gtest.h"

namespace proxy_wasm {

std::string BytesToHex(std::vector<uint8_t> bytes) {
  static const char *const hex = "0123456789ABCDEF";
  std::string result;
  result.reserve(bytes.size() * 2);
  for (auto byte : bytes) {
    result.push_back(hex[byte >> 4]);
    result.push_back(hex[byte & 0xf]);
  }
  return result;
}

static std::string publickey(std::string filename) {
  auto path = "test/test_data/" + filename;
  std::ifstream file(path, std::ios::binary);
  EXPECT_FALSE(file.fail()) << "failed to open: " << path;
  std::stringstream file_string_stream;
  file_string_stream << file.rdbuf();
  std::string input = file_string_stream.str();
  std::vector<uint8_t> bytes(input.begin() + 4, input.end());
  return BytesToHex(bytes);
}

TEST(TestSignatureUtil, NoPublicKey) {
#ifndef PROXY_WASM_VERIFY_WITH_ED25519_PUBKEY
  const auto bytecode = readTestWasmFile("abi_export.signed.with.key1.wasm");
  std::string message;
  EXPECT_TRUE(SignatureUtil::verifySignature(bytecode, "", message));
  EXPECT_EQ(message, "");
#endif
}

TEST(TestSignatureUtil, GoodSignature) {
  std::string pubkey = publickey("signature_key1.pub");
  const auto bytecode = readTestWasmFile("abi_export.signed.with.key1.wasm");
  std::string message;
  EXPECT_TRUE(SignatureUtil::verifySignature(bytecode, pubkey, message));
  EXPECT_EQ(message, "Wasm signature OK (Ed25519)");
}

TEST(TestSignatureUtil, BadSignature) {
  std::string pubkey = publickey("signature_key1.pub");
  const auto bytecode = readTestWasmFile("abi_export.signed.with.key2.wasm");
  std::string message;
  EXPECT_FALSE(SignatureUtil::verifySignature(bytecode, pubkey, message));
  EXPECT_EQ(message, "Signature mismatch");
}

TEST(TestSignatureUtil, BuildTimeKeyPrecedence) {
  // Uses hard-coded key if defined.
  std::string pubkey = publickey("signature_key2.pub");
  const auto bytecode = readTestWasmFile("abi_export.signed.with.key1.wasm");
  std::string message;
#ifdef PROXY_WASM_VERIFY_WITH_ED25519_PUBKEY
  EXPECT_TRUE(SignatureUtil::verifySignature(bytecode, pubkey, message));
  EXPECT_EQ(message, "Wasm signature OK (Ed25519)");
#else
  EXPECT_FALSE(SignatureUtil::verifySignature(bytecode, pubkey, message));
  EXPECT_EQ(message, "Signature mismatch");
#endif
}

TEST(TestSignatureUtil, NoSignature) {
  std::string pubkey = publickey("signature_key1.pub");
  const auto bytecode = readTestWasmFile("abi_export.wasm");
  std::string message;
  EXPECT_FALSE(SignatureUtil::verifySignature(bytecode, pubkey, message));
  EXPECT_EQ(message, "Custom Section \"signature_wasmsign\" not found");
}

} // namespace proxy_wasm
