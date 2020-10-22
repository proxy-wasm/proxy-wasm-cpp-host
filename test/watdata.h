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

#include <string>

namespace wat_data {

std::string AbiVersion = R"(
(module
  (memory 0 0)
  (func (export "proxy_abi_version_0_2_0") (result i32) (memory.size))
))";

std::string Memory = R"(
(module
  (memory (export "memory") 2 3)

  (func (export "size") (result i32) (memory.size))
  (func (export "load") (param i32) (result i32)
    (i32.load8_s (local.get 0))
  )
  (func (export "store") (param i32 i32)
    (i32.store8 (local.get 0) (local.get 1))
  )

  (data (i32.const 0x1000) "\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00")
))";

std::string Callback = R"(
(module
  (type (;0;) (func))
  (type (;1;) (func (param i32) (result i32)))
  (import "hostenv" "callback" (func (;0;) (type 0)))
  (import "hostenv2" "callback2" (func (;1;) (type 1)))
  (func (;2;) (type 0)
    call 0)
  (func (;3;) (type 1) (param i32) (result i32)
    global.get 0
    call 1)
  (global (;0;) i32 (i32.const 100000 (;=1;)))
  (export "run" (func 2))
  (export "run2" (func 3)))
)";

} // namespace wat_data
