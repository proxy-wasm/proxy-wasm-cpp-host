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

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def proxy_wasm_cpp_host_repositories():
    http_archive(
        name = "proxy_wasm_cpp_sdk",
        sha256 = "c57de2425b5c61d7f630c5061e319b4557ae1f1c7526e5a51c33dc1299471b08",
        strip_prefix = "proxy-wasm-cpp-sdk-fd0be8405db25de0264bdb78fae3a82668c03782",
        urls = ["https://github.com/proxy-wasm/proxy-wasm-cpp-sdk/archive/fd0be8405db25de0264bdb78fae3a82668c03782.tar.gz"],
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
        name = "com_google_protobuf",
        sha256 = "77ad26d3f65222fd96ccc18b055632b0bfedf295cb748b712a98ba1ac0b704b2",
        strip_prefix = "protobuf-3.17.3",
        url = "https://github.com/protocolbuffers/protobuf/releases/download/v3.17.3/protobuf-all-3.17.3.tar.gz",
    )

    http_archive(
        name = "llvm13",
        build_file = "@proxy_wasm_cpp_host//bazel/external:llvm13.BUILD",
        sha256 = "408d11708643ea826f519ff79761fcdfc12d641a2510229eec459e72f8163020",
        strip_prefix = "llvm-13.0.0.src",
        url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/llvm-13.0.0.src.tar.xz",
    )

    http_archive(
        name = "com_github_bytecodealliance_wasm_micro_runtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wamr.BUILD",
        sha256 = "0ccf19f30f744fca635be5428f6460c14dfee19bfa0820c70e0fc9554f79c9b1",
        strip_prefix = "wasm-micro-runtime-cdf306364eff8f50fd6473b32a316cb90cc15a2f",
        url = "https://github.com/bytecodealliance/wasm-micro-runtime/archive/cdf306364eff8f50fd6473b32a316cb90cc15a2f.tar.gz",
        patches = ["@proxy_wasm_cpp_host//bazel/external:wamr.patch"],
        patch_args = ["-p1"],
    )

    native.bind(
        name = "wamr",
        actual = "@com_github_bytecodealliance_wasm_micro_runtime//:wamr_lib",
    )

    http_archive(
        name = "com_github_bytecodealliance_wasmtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
        sha256 = "47d823a71c2512f201b772fae73912c22882385197d67ece6855f29393516147",
        strip_prefix = "wasmtime-0.32.0",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v0.32.0.tar.gz",
    )

    http_archive(
        name = "com_github_webassembly_wasm_c_api",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasm-c-api.BUILD",
        sha256 = "c774044f51431429e878bd1b9e2a4e38932f861f9211df72f75e9427eb6b8d32",
        strip_prefix = "wasm-c-api-c9d31284651b975f05ac27cee0bab1377560b87e",
        url = "https://github.com/WebAssembly/wasm-c-api/archive/c9d31284651b975f05ac27cee0bab1377560b87e.tar.gz",
    )

    native.bind(
        name = "wasmtime",
        actual = "@com_github_webassembly_wasm_c_api//:wasmtime_lib",
    )

    http_archive(
        name = "rules_rust",
        sha256 = "d195a85d38ee2dd7aecfedba6c9814a2ff22f968abac0818fd91e35c5b7aca6f",
        strip_prefix = "rules_rust-6f79458dee68d691d6a5aee67b06a620bdf9293f",
        url = "https://github.com/bazelbuild/rules_rust/archive/6f79458dee68d691d6a5aee67b06a620bdf9293f.tar.gz",
    )

    http_archive(
        name = "rules_foreign_cc",
        sha256 = "d54742ffbdc6924f222d2179f0e10e911c5c659c4ae74158e9fe827aad862ac6",
        strip_prefix = "rules_foreign_cc-0.2.0",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.2.0.tar.gz",
    )

    http_archive(
        name = "llvm",
        build_file = "@proxy_wasm_cpp_host//bazel/external:llvm.BUILD",
        sha256 = "7d9a8405f557cefc5a21bf5672af73903b64749d9bc3a50322239f56f34ffddf",
        strip_prefix = "llvm-12.0.1.src",
        url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/llvm-12.0.1.src.tar.xz",
    )

    http_archive(
        name = "com_github_wavm_wavm",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wavm.BUILD",
        sha256 = "bf2b2aec8a4c6a5413081c0527cb40dd16cb67e9c74a91f8a82fe1cf27a3c5d5",
        strip_prefix = "WAVM-c8997ebf154f3b42e688e670a7d0fa045b7a32a0",
        url = "https://github.com/WAVM/WAVM/archive/c8997ebf154f3b42e688e670a7d0fa045b7a32a0.tar.gz",
    )

    native.bind(
        name = "wavm",
        actual = "@com_github_wavm_wavm//:wavm_lib",
    )

    git_repository(
        name = "v8",
        commit = "3ac58d694cdcdc2a6e1420c06a955f64310c42f8",
        remote = "https://chromium.googlesource.com/v8/v8",
        shallow_since = "1641210631 +0000",
        patches = ["@proxy_wasm_cpp_host//bazel/external:v8.patch"],
        patch_args = ["-p1"],
    )

    new_git_repository(
        name = "com_googlesource_chromium_trace_event_common",
        build_file = "@v8//:bazel/BUILD.trace_event_common",
        commit = "7f36dbc19d31e2aad895c60261ca8f726442bfbb",
        remote = "https://chromium.googlesource.com/chromium/src/base/trace_event/common.git",
        shallow_since = "1635355186 -0700",
    )

    new_git_repository(
        name = "com_googlesource_chromium_zlib",
        build_file = "@v8//:bazel/BUILD.zlib",
        commit = "efd9399ae01364926be2a38946127fdf463480db",
        remote = "https://chromium.googlesource.com/chromium/src/third_party/zlib.git",
        shallow_since = "1638492135 -0800",
    )

    http_archive(
        name = "rules_python",
        sha256 = "cd6730ed53a002c56ce4e2f396ba3b3be262fd7cb68339f0377a45e8227fe332",
        url = "https://github.com/bazelbuild/rules_python/releases/download/0.5.0/rules_python-0.5.0.tar.gz",
    )

    native.bind(
        name = "wee8",
        actual = "@v8//:wee8",
    )
