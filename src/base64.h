// Public Domain: https://en.wikibooks.org/wiki/Algorithm_Implementation/Miscellaneous/Base64
#pragma once

#include <cstdint>
#include <string>
#include <vector>

std::basic_string<char> base64Encode(std::vector<uint8_t> input);
bool base64Decode(const std::basic_string<char> &input, std::vector<uint8_t> *output);
