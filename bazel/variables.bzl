# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

COPTS = select({
    "@bazel_tools//src/conditions:windows": [
        "/std:c++17",
    ],
    "//conditions:default": [
        "-std=c++17",
    ],
})

# https://bytecodealliance.github.io/wasmtime/c-api/
LINKOPTS = select({
    "@bazel_tools//src/conditions:windows": [
        "-",
        "ws2_32.lib",
        "advapi32.lib",
        "userenv.lib",
        "ntdll.lib",
        "shell32.lib",
        "ole32.lib",
    ],
    "@bazel_tools//src/conditions:darwin": [],
    "//conditions:default": [
        # required for linux
        "-lpthread",
        "-ldl",
        "-lm",
    ],
})
