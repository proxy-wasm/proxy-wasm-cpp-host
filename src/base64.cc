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

// Original source Public Domain:
// https://en.wikibooks.org/wiki/Algorithm_Implementation/Miscellaneous/Base64
#include "base64.h"

const static char encodeLookup[] =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
const static char padCharacter = '=';

std::string base64Encode(const uint8_t *start, const uint8_t *end) {
  std::string encodedString;
  size_t size = end - start;
  encodedString.reserve(((size / 3) + (size % 3 > 0)) * 4);
  uint32_t temp;
  auto cursor = start;
  for (size_t idx = 0; idx < size / 3; idx++) {
    temp = (*cursor++) << 16; // Convert to big endian
    temp += (*cursor++) << 8;
    temp += (*cursor++);
    encodedString.append(1, encodeLookup[(temp & 0x00FC0000) >> 18]);
    encodedString.append(1, encodeLookup[(temp & 0x0003F000) >> 12]);
    encodedString.append(1, encodeLookup[(temp & 0x00000FC0) >> 6]);
    encodedString.append(1, encodeLookup[(temp & 0x0000003F)]);
  }
  switch (size % 3) {
  case 1:
    temp = (*cursor++) << 16; // Convert to big endian
    encodedString.append(1, encodeLookup[(temp & 0x00FC0000) >> 18]);
    encodedString.append(1, encodeLookup[(temp & 0x0003F000) >> 12]);
    encodedString.append(2, padCharacter);
    break;
  case 2:
    temp = (*cursor++) << 16; // Convert to big endian
    temp += (*cursor++) << 8;
    encodedString.append(1, encodeLookup[(temp & 0x00FC0000) >> 18]);
    encodedString.append(1, encodeLookup[(temp & 0x0003F000) >> 12]);
    encodedString.append(1, encodeLookup[(temp & 0x00000FC0) >> 6]);
    encodedString.append(1, padCharacter);
    break;
  }
  return encodedString;
}

bool base64Decode(const std::basic_string<char> &input, std::vector<uint8_t> *output) {
  if (input.length() % 4)
    return false;
  size_t padding = 0;
  if (input.length()) {
    if (input[input.length() - 1] == padCharacter)
      padding++;
    if (input[input.length() - 2] == padCharacter)
      padding++;
  }
  // Setup a vector to hold the result
  std::vector<unsigned char> decodedBytes;
  decodedBytes.reserve(((input.length() / 4) * 3) - padding);
  uint32_t temp = 0; // Holds decoded quanta
  std::basic_string<char>::const_iterator cursor = input.begin();
  while (cursor < input.end()) {
    for (size_t quantumPosition = 0; quantumPosition < 4; quantumPosition++) {
      temp <<= 6;
      if (*cursor >= 0x41 && *cursor <= 0x5A) // This area will need tweaking if
        temp |= *cursor - 0x41;               // you are using an alternate alphabet
      else if (*cursor >= 0x61 && *cursor <= 0x7A)
        temp |= *cursor - 0x47;
      else if (*cursor >= 0x30 && *cursor <= 0x39)
        temp |= *cursor + 0x04;
      else if (*cursor == 0x2B)
        temp |= 0x3E; // change to 0x2D for URL alphabet
      else if (*cursor == 0x2F)
        temp |= 0x3F;                     // change to 0x5F for URL alphabet
      else if (*cursor == padCharacter) { // pad
        switch (input.end() - cursor) {
        case 1: // One pad character
          decodedBytes.push_back((temp >> 16) & 0x000000FF);
          decodedBytes.push_back((temp >> 8) & 0x000000FF);
          goto Ldone;
        case 2: // Two pad characters
          decodedBytes.push_back((temp >> 10) & 0x000000FF);
          goto Ldone;
        default:
          return false;
        }
      } else
        return false;
      cursor++;
    }
    decodedBytes.push_back((temp >> 16) & 0x000000FF);
    decodedBytes.push_back((temp >> 8) & 0x000000FF);
    decodedBytes.push_back((temp)&0x000000FF);
  }
Ldone:
  *output = std::move(decodedBytes);
  return true;
}
