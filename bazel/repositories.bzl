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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def proxy_wasm_cpp_host_repositories():
    http_archive(
        name = "proxy_wasm_cpp_sdk",
        sha256 = "b97e3e716b1f38dc601487aa0bde72490bbc82b8f3ad73f1f3e69733984955df",
        strip_prefix = "proxy-wasm-cpp-sdk-956f0d500c380cc1656a2d861b7ee12c2515a664",
        urls = ["https://github.com/proxy-wasm/proxy-wasm-cpp-sdk/archive/956f0d500c380cc1656a2d861b7ee12c2515a664.tar.gz"],
    )

    http_archive(
        name = "boringssl",
        sha256 = "bb55b0ed2f0cb548b5dce6a6b8307ce37f7f748eb9f1be6bfe2d266ff2b4d52b",
        strip_prefix = "boringssl-2192bbc878822cf6ab5977d4257a1339453d9d39",
        urls = ["https://github.com/google/boringssl/archive/2192bbc878822cf6ab5977d4257a1339453d9d39.tar.gz"],
    )

    http_archive(
        name = "com_google_googletest",
        sha256 = "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
        strip_prefix = "googletest-release-1.10.0",
        urls = ["https://github.com/google/googletest/archive/release-1.10.0.tar.gz"],
    )

    http_archive(
        name = "wamr",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wamr.BUILD",
        sha256 = "3f9c993cf81a573cd733b7d97fa15ed757351881e502aad22ff873371ee55202",
        strip_prefix = "wasm-micro-runtime-0.1-beta",
        url = "https://github.com/lum1n0us/wasm-micro-runtime/archive/refs/tags/v0.1-beta.tar.gz",
    )

    http_archive(
        name = "wasmtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
        sha256 = "e95d274822ac72bf06355bdfbeddcacae60d7e98fec8ee4b2e21740636fb5c2c",
        strip_prefix = "wasmtime-0.26.0",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v0.26.0.tar.gz",
    )

    http_archive(
        name = "wasm_c_api",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasm-c-api.BUILD",
        sha256 = "c774044f51431429e878bd1b9e2a4e38932f861f9211df72f75e9427eb6b8d32",
        strip_prefix = "wasm-c-api-c9d31284651b975f05ac27cee0bab1377560b87e",
        url = "https://github.com/WebAssembly/wasm-c-api/archive/c9d31284651b975f05ac27cee0bab1377560b87e.tar.gz",
    )

    http_archive(
        name = "rules_rust",
        sha256 = "242deacf4c9e4274d90964689dfae6c245bfb1bfa5e3336b2ad3b44f2541b70c",
        strip_prefix = "rules_rust-1b648302edb64d3ddcc159655bf065bff40e6571",
        url = "https://github.com/bazelbuild/rules_rust/archive/1b648302edb64d3ddcc159655bf065bff40e6571.tar.gz",
    )

    http_archive(
        name = "com_google_protobuf",
        sha256 = "59621f4011a95df270748dcc0ec1cc51946473f0e140d4848a2f20c8719e43aa",
        strip_prefix = "protobuf-655310ca192a6e3a050e0ca0b7084a2968072260",
        url = "https://github.com/protocolbuffers/protobuf/archive/655310ca192a6e3a050e0ca0b7084a2968072260.tar.gz",
    )

    http_archive(
        name = "rules_foreign_cc",
        sha256 = "d54742ffbdc6924f222d2179f0e10e911c5c659c4ae74158e9fe827aad862ac6",
        strip_prefix = "rules_foreign_cc-0.2.0",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.2.0.tar.gz",
    )
