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

def dependencies(name = ""):
    _envoy_deps()
    _http_archives()

def _http_archives():
    http_archive(
        name = "rules_cc",
        sha256 = "9d48151ea71b3e225adfb6867e6d2c7d0dce46cbdc8710d9a9a628574dfd40a0",
        strip_prefix = "rules_cc-818289e5613731ae410efb54218a4077fb9dbb03",
        urls = ["https://github.com/bazelbuild/rules_cc/archive/818289e5613731ae410efb54218a4077fb9dbb03.tar.gz"],
    )

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
        sha256 = "e3812f256dd7347a33bf9d93a950cf356c61c0596842ff07d8154cd415145d83",
        strip_prefix = "abseil-cpp-5d8fc9192245f0ea67094af57399d7931d6bd53f",
        urls = ["https://github.com/abseil/abseil-cpp/archive/5d8fc9192245f0ea67094af57399d7931d6bd53f.tar.gz"],
    )

    http_archive(
        name = "io_bazel_rules_rust",
        sha256 = "7401878bf966325bbec5224eeb4ff7e8762681070b401acaa168da68d383563a",
        strip_prefix = "rules_rust-9741a32e50a8c50c504c0931111bb6048d6d6888",
        url = "https://github.com/bazelbuild/rules_rust/archive/9741a32e50a8c50c504c0931111bb6048d6d6888.tar.gz",
    )

    http_archive(
        name = "bazel_skylib",
        sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        ],
    )

    http_archive(
        name = "com_google_protobuf",
        sha256 = "465fd9367992a9b9c4fba34a549773735da200903678b81b25f367982e8df376",
        strip_prefix = "protobuf-3.13.0",
        url = "https://github.com/protocolbuffers/protobuf/releases/download/v3.13.0/protobuf-all-3.13.0.tar.gz",
        patches = ["@envoy//bazel:protobuf.patch"],
        patch_args = ["-p1"],
    )

def _envoy_deps():
    native.new_local_repository(
        name = "envoy_build_config",
        path = "bazel/external/envoy",
        build_file_content = "",
    )

    http_archive(
        name = "envoy",
        sha256 = "910ef0c163a0b9ff34506a6c787de7239d8f57c558ef8db92b3c71d15fc3a281",
        strip_prefix = "envoy-0f7952d1850be92620f2add304c8d95fce028f93",
        url = "https://github.com/envoyproxy/envoy/archive/0f7952d1850be92620f2add304c8d95fce028f93.tar.gz",
    )
