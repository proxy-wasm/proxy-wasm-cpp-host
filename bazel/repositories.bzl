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
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def proxy_wasm_cpp_host_repositories():
    # Bazel extensions.

    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        ],
        sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
    )

    maybe(
        http_archive,
        name = "bazel_clang_tidy",
        sha256 = "6ed23cbff9423a30ef10becf57210a26d54fe198a211f4037d931c06f843c023",
        strip_prefix = "bazel_clang_tidy-c2fe98cfec0430e78bff4169e9ca0a43123e4c99",
        url = "https://github.com/erenon/bazel_clang_tidy/archive/c2fe98cfec0430e78bff4169e9ca0a43123e4c99.tar.gz",
        patches = ["@proxy_wasm_cpp_host//bazel/external:bazel_clang_tidy.patch"],
        patch_args = ["-p1"],
    )

    maybe(
        http_archive,
        name = "bazel-zig-cc",
        sha256 = "ad6384b4d16ebb3e5047df6548a195e598346da84e5f320250beb9198705ac81",
        strip_prefix = "bazel-zig-cc-v0.4.4",
        url = "https://git.sr.ht/~motiejus/bazel-zig-cc/archive/v0.4.4.tar.gz",
    )

    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "bcd0c5f46a49b85b384906daae41d277b3dc0ff27c7c752cc51e43048a58ec83",
        strip_prefix = "rules_foreign_cc-0.7.1",
        url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.7.1.tar.gz",
    )

    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "a30abdfc7126d497a7698c29c46ea9901c6392d6ed315171a6df5ce433aa4502",
        strip_prefix = "rules_python-0.6.0",
        url = "https://github.com/bazelbuild/rules_python/archive/0.6.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "6c26af1bb98276917fcf29ea942615ab375cf9d3c52f15c27fdd176ced3ee906",
        strip_prefix = "rules_rust-b3ddf6f096887b757ab1a661662a95d6b2699fa7",
        # NOTE: Update Rust version in bazel/dependencies.bzl.
        url = "https://github.com/bazelbuild/rules_rust/archive/b3ddf6f096887b757ab1a661662a95d6b2699fa7.tar.gz",
        patches = ["@proxy_wasm_cpp_host//bazel/external:rules_rust.patch"],
        patch_args = ["-p1"],
    )

    # Core.

    maybe(
        http_archive,
        name = "boringssl",
        # 2022-02-07 (master-with-bazel)
        sha256 = "7dec97795a7ac7e3832228e4440ee06cceb18d3663f4580b0840e685281e28a0",
        strip_prefix = "boringssl-eaa29f431f71b8121e1da76bcd3ddc2248238ade",
        urls = ["https://github.com/google/boringssl/archive/eaa29f431f71b8121e1da76bcd3ddc2248238ade.tar.gz"],
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_sdk",
        sha256 = "c57de2425b5c61d7f630c5061e319b4557ae1f1c7526e5a51c33dc1299471b08",
        strip_prefix = "proxy-wasm-cpp-sdk-fd0be8405db25de0264bdb78fae3a82668c03782",
        urls = ["https://github.com/proxy-wasm/proxy-wasm-cpp-sdk/archive/fd0be8405db25de0264bdb78fae3a82668c03782.tar.gz"],
    )

    # Test dependencies.

    maybe(
        http_archive,
        name = "com_google_googletest",
        sha256 = "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
        strip_prefix = "googletest-release-1.10.0",
        urls = ["https://github.com/google/googletest/archive/release-1.10.0.tar.gz"],
    )

    # NullVM dependencies.

    maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = "77ad26d3f65222fd96ccc18b055632b0bfedf295cb748b712a98ba1ac0b704b2",
        strip_prefix = "protobuf-3.17.3",
        url = "https://github.com/protocolbuffers/protobuf/releases/download/v3.17.3/protobuf-all-3.17.3.tar.gz",
    )

    # V8 with dependencies.

    maybe(
        git_repository,
        name = "v8",
        # 10.0.139.6
        commit = "1e242a567b609aa18ce46f7b04cc51fd85756b67",
        remote = "https://chromium.googlesource.com/v8/v8",
        shallow_since = "1646671271 +0000",
        patches = ["@proxy_wasm_cpp_host//bazel/external:v8.patch"],
        patch_args = ["-p1"],
    )

    native.bind(
        name = "wee8",
        actual = "@v8//:wee8",
    )

    maybe(
        new_git_repository,
        name = "com_googlesource_chromium_base_trace_event_common",
        build_file = "@v8//:bazel/BUILD.trace_event_common",
        commit = "d115b033c4e53666b535cbd1985ffe60badad082",
        remote = "https://chromium.googlesource.com/chromium/src/base/trace_event/common.git",
        shallow_since = "1642576054 -0800",
    )

    native.bind(
        name = "base_trace_event_common",
        actual = "@com_googlesource_chromium_base_trace_event_common//:trace_event_common",
    )

    maybe(
        new_git_repository,
        name = "com_googlesource_chromium_zlib",
        build_file = "@v8//:bazel/BUILD.zlib",
        commit = "9538f4194f6e5eff1bd59f2396ed9d05b1a8d801",
        remote = "https://chromium.googlesource.com/chromium/src/third_party/zlib.git",
        shallow_since = "1644963419 -0800",
    )

    native.bind(
        name = "zlib",
        actual = "@com_googlesource_chromium_zlib//:zlib",
    )

    native.bind(
        name = "zlib_compression_utils",
        actual = "@com_googlesource_chromium_zlib//:zlib_compression_utils",
    )

    # WAMR with dependencies.

    maybe(
        http_archive,
        name = "com_github_bytecodealliance_wasm_micro_runtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wamr.BUILD",
        # WAMR-01-18-2022
        sha256 = "af88da144bcb5ecac417af7fd34130487f5e4792e79670f07530474b2ef43912",
        strip_prefix = "wasm-micro-runtime-d856af6c33591815ab4c890f0606bc99ee8135ad",
        url = "https://github.com/bytecodealliance/wasm-micro-runtime/archive/d856af6c33591815ab4c890f0606bc99ee8135ad.tar.gz",
    )

    native.bind(
        name = "wamr",
        actual = "@com_github_bytecodealliance_wasm_micro_runtime//:wamr_lib",
    )

    # Wasmtime with dependencies.

    maybe(
        http_archive,
        name = "com_github_bytecodealliance_wasmtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
        sha256 = "9dcb51313f9d6a67169f70759411cddf511000b0372e57532e638441100aac9c",
        strip_prefix = "wasmtime-0.35.2",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v0.35.2.tar.gz",
    )

    maybe(
        http_archive,
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

    native.bind(
        name = "prefixed_wasmtime",
        actual = "@com_github_webassembly_wasm_c_api//:prefixed_wasmtime_lib",
    )

    # WAVM with dependencies.

    maybe(
        http_archive,
        name = "com_github_wavm_wavm",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wavm.BUILD",
        sha256 = "bf2b2aec8a4c6a5413081c0527cb40dd16cb67e9c74a91f8a82fe1cf27a3c5d5",
        strip_prefix = "WAVM-c8997ebf154f3b42e688e670a7d0fa045b7a32a0",
        url = "https://github.com/WAVM/WAVM/archive/c8997ebf154f3b42e688e670a7d0fa045b7a32a0.tar.gz",
        patches = ["@proxy_wasm_cpp_host//bazel/external:wavm.patch"],
        patch_args = ["-p1"],
    )

    native.bind(
        name = "wavm",
        actual = "@com_github_wavm_wavm//:wavm_lib",
    )

    maybe(
        http_archive,
        name = "llvm",
        build_file = "@proxy_wasm_cpp_host//bazel/external:llvm.BUILD",
        sha256 = "7d9a8405f557cefc5a21bf5672af73903b64749d9bc3a50322239f56f34ffddf",
        strip_prefix = "llvm-12.0.1.src",
        url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/llvm-12.0.1.src.tar.xz",
        patches = ["@proxy_wasm_cpp_host//bazel/external:llvm.patch"],
        patch_args = ["-p1"],
    )
