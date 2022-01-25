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
        # 2022-01-10 (master-with-bazel)
        sha256 = "a530919e3141d00d593a0d74cd0f9f88707e35ec58bb62245968fec16cb9257f",
        strip_prefix = "boringssl-9420fb54116466923afa1f34a23dd8a4a7ddb69d",
        urls = ["https://github.com/google/boringssl/archive/9420fb54116466923afa1f34a23dd8a4a7ddb69d.tar.gz"],
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
        # WAMR-01-18-2022
        sha256 = "af88da144bcb5ecac417af7fd34130487f5e4792e79670f07530474b2ef43912",
        strip_prefix = "wasm-micro-runtime-d856af6c33591815ab4c890f0606bc99ee8135ad",
        url = "https://github.com/bytecodealliance/wasm-micro-runtime/archive/d856af6c33591815ab4c890f0606bc99ee8135ad.tar.gz",
    )

    native.bind(
        name = "wamr",
        actual = "@com_github_bytecodealliance_wasm_micro_runtime//:wamr_lib",
    )

    http_archive(
        name = "com_github_bytecodealliance_wasmtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
        sha256 = "c59a2aa110b25921d370944287cd97205c73cf3dc76776c5b3551135c1e42ddc",
        strip_prefix = "wasmtime-0.33.0",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v0.33.0.tar.gz",
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
        sha256 = "8a2052e8ec707aa04a6b9e72bfc67fea44e915ecab1d2d0a4835ad51c2410c36",
        strip_prefix = "rules_rust-b16c26ba5faf1c58ebe94582afd20567ce676e6d",
        # NOTE: Update Rust version for Linux/s390x in bazel/dependencies.bzl.
        url = "https://github.com/bazelbuild/rules_rust/archive/b16c26ba5faf1c58ebe94582afd20567ce676e6d.tar.gz",
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
        patches = ["@proxy_wasm_cpp_host//bazel/external:wavm.patch"],
        patch_args = ["-p1"],
    )

    native.bind(
        name = "wavm",
        actual = "@com_github_wavm_wavm//:wavm_lib",
    )

    git_repository(
        name = "v8",
        # 9.9.115.3
        commit = "90f089d97b6e4146ad106eee1829d86ad6392027",
        remote = "https://chromium.googlesource.com/v8/v8",
        shallow_since = "1643043727 +0000",
    )

    native.bind(
        name = "wee8",
        actual = "@v8//:wee8",
    )

    new_git_repository(
        name = "com_googlesource_chromium_base_trace_event_common",
        build_file = "@v8//:bazel/BUILD.trace_event_common",
        commit = "7f36dbc19d31e2aad895c60261ca8f726442bfbb",
        remote = "https://chromium.googlesource.com/chromium/src/base/trace_event/common.git",
        shallow_since = "1635355186 -0700",
    )

    native.bind(
        name = "base_trace_event_common",
        actual = "@com_googlesource_chromium_base_trace_event_common//:trace_event_common",
    )

    new_git_repository(
        name = "com_googlesource_chromium_zlib",
        build_file = "@v8//:bazel/BUILD.zlib",
        commit = "fc5cfd78a357d5bb7735a58f383634faaafe706a",
        remote = "https://chromium.googlesource.com/chromium/src/third_party/zlib.git",
        shallow_since = "1642005087 -0800",
    )

    native.bind(
        name = "zlib",
        actual = "@com_googlesource_chromium_zlib//:zlib",
    )

    native.bind(
        name = "zlib_compression_utils",
        actual = "@com_googlesource_chromium_zlib//:zlib_compression_utils",
    )

    http_archive(
        name = "rules_python",
        sha256 = "a30abdfc7126d497a7698c29c46ea9901c6392d6ed315171a6df5ce433aa4502",
        strip_prefix = "rules_python-0.6.0",
        url = "https://github.com/bazelbuild/rules_python/archive/0.6.0.tar.gz",
    )

    http_archive(
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        ],
        sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
    )
