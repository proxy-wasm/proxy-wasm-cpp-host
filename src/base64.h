// Public Domain: https://en.wikibooks.org/wiki/Algorithm_Implementation/Miscellaneous/Base64
#pragma once

#include <cstdint>
#include <string>
#include <vector>

std::string base64Encode(const uint8_t *start, const uint8_t *end);
bool base64Decode(const std::string &input, std::vector<uint8_t> *output);
