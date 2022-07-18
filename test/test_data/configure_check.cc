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

#include <string>
#include <string_view>
#include <unordered_map>

#include "proxy_wasm_intrinsics.h"

class TestRootContext1 : public RootContext {
public:
  explicit TestRootContext1(uint32_t id, std::string_view root_id) : RootContext(id, root_id) {}
  bool onConfigure(size_t s) override {
    LOG_TRACE("onConfigure: root_id_1");
    return true;
  }
};

class TestContext : public Context {
public:
  explicit TestContext(uint32_t id, RootContext *root) : Context(id, root) {}
};

class TestRootContext2 : public RootContext {
public:
  explicit TestRootContext2(uint32_t id, std::string_view root_id) : RootContext(id, root_id) {}
  bool onConfigure(size_t s) override {
    LOG_TRACE("onConfigure: root_id_2");
    return true;
  }
};

static RegisterContextFactory register_TestContext1(CONTEXT_FACTORY(TestContext),
                                                    ROOT_FACTORY(TestRootContext1), "root_id_1");

static RegisterContextFactory register_TestContext2(CONTEXT_FACTORY(TestContext),
                                                    ROOT_FACTORY(TestRootContext2), "root_id_2");