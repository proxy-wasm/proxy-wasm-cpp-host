// Copyright 2023 Google LLC
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

#include "src/hash.h"

#include <string>
#include <vector>

#include <openssl/evp.h>

namespace proxy_wasm {

namespace {

std::string BytesToHex(const std::vector<uint8_t> &bytes) {
  static const char *const hex = "0123456789ABCDEF";
  std::string result;
  result.reserve(bytes.size() * 2);
  for (auto byte : bytes) {
    result.push_back(hex[byte >> 4]);
    result.push_back(hex[byte & 0xf]);
  }
  return result;
}

} // namespace

std::vector<uint8_t> Sha256(const std::vector<std::string_view> &parts) {
  uint8_t sha256[32]; // SHA-256 produces 32 bytes
  unsigned int hash_len = 0;

  EVP_MD_CTX *hash_ctx = EVP_MD_CTX_new();
  if (hash_ctx == nullptr) {
    return std::vector<uint8_t>();
  }

  bool hash_ok = (EVP_DigestInit_ex(hash_ctx, EVP_sha256(), nullptr) != 0);
  if (hash_ok) {
    for (auto part : parts) {
      if (EVP_DigestUpdate(hash_ctx, part.data(), part.size()) == 0) {
        hash_ok = false;
        break;
      }
    }
  }
  if (hash_ok) {
    hash_ok = (EVP_DigestFinal_ex(hash_ctx, sha256, &hash_len) != 0);
  }

  EVP_MD_CTX_free(hash_ctx);

  if (!hash_ok || hash_len != 32) {
    return std::vector<uint8_t>();
  }

  return std::vector<uint8_t>(std::begin(sha256), std::end(sha256));
}

std::string Sha256String(const std::vector<std::string_view> &parts) {
  return BytesToHex(Sha256(parts));
}

} // namespace proxy_wasm