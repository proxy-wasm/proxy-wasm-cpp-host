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
        name = "wasmtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
        sha256 = "7874feb1026bbef06796bd5ab80e73f15b8e83752bde8dc93994f5bc039a4952",
        strip_prefix = "wasmtime-0.21.0",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v0.21.0.tar.gz",
    )

    http_archive(
        name = "wasm_c_api",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasm-c-api.BUILD",
        sha256 = "aea8cd095e9937f1e14f2c93e026317b197eb2345e7a817fe3932062eb7b792c",
        strip_prefix = "wasm-c-api-d9a80099d496b5cdba6f3fe8fc77586e0e505ddc",
        url = "https://github.com/WebAssembly/wasm-c-api/archive/d9a80099d496b5cdba6f3fe8fc77586e0e505ddc.tar.gz",
    )

    http_archive(
        name = "com_google_absl",
        sha256 = "19391fb4882601a65cb648d638c11aa301ce5f525ef02da1a9eafd22f72d7c59",
        strip_prefix = "abseil-cpp-37dd2562ec830d547a1524bb306be313ac3f2556",
        # 2020-01-29
        urls = ["https://github.com/abseil/abseil-cpp/archive/37dd2562ec830d547a1524bb306be313ac3f2556.tar.gz"],
    )

    http_archive(
        name = "io_bazel_rules_rust",
        sha256 = "442a102e2a6f6c75e10d43f21c0c30218947a3e827d91529ced7380c5fec05f0",
        strip_prefix = "rules_rust-39523e32ac0bd64f5d60154114a42e61e58ffd17",
        url = "https://github.com/bazelbuild/rules_rust/archive/39523e32ac0bd64f5d60154114a42e61e58ffd17.tar.gz",
    )

    http_archive(
        name = "com_google_protobuf",
        sha256 = "59621f4011a95df270748dcc0ec1cc51946473f0e140d4848a2f20c8719e43aa",
        strip_prefix = "protobuf-655310ca192a6e3a050e0ca0b7084a2968072260",
        url = "https://github.com/protocolbuffers/protobuf/archive/655310ca192a6e3a050e0ca0b7084a2968072260.tar.gz",
    )
