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

#include "include/proxy-wasm/context.h"

#include "gtest/gtest.h"

namespace proxy_wasm {
namespace {

class Context : public ContextBase {
public:
  Context(std::function<void(std::string_view s)> error_function)
      : error_function_(error_function) {}
  void error(std::string_view message) { error_function_(message); }

private:
  std::function<void(std::string_view s)> error_function_;
};

TEST(Context, IncludeParses) {}

} // namespace
} // namespace proxy_wasm
