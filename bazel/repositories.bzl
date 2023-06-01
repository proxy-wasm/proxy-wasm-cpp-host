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
        sha256 = "ff89e0220c72cdc774e451a35e5c3b9f1593d0df71341844b2108c181ac0eef9",
        strip_prefix = "hermetic_cc_toolchain-0.4.4",
        url = "https://github.com/uber/hermetic_cc_toolchain/archive/refs/tags/v0.4.4.tar.gz",
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
        name = "rules_fuzzing",
        sha256 = "23bb074064c6f488d12044934ab1b0631e8e6898d5cf2f6bde087adb01111573",
        strip_prefix = "rules_fuzzing-0.3.1",
        url = "https://github.com/bazelbuild/rules_fuzzing/archive/v0.3.1.zip",
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
        sha256 = "88a6911bf60c44710407cc718668ce79a4a339e1310b47f306aa0f1beadc6895",
        strip_prefix = "rules_rust-0.22.0",
        # NOTE: Update Rust version in bazel/dependencies.bzl.
        url = "https://github.com/bazelbuild/rules_rust/archive/0.22.0.tar.gz",
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
        sha256 = "89792fc1abca331f29f99870476a04146de5e82ff903bdffca90e6729c1f2470",
        strip_prefix = "proxy-wasm-cpp-sdk-95bb82ce45c41d9100fd1ec15d2ffc67f7f3ceee",
        urls = ["https://github.com/proxy-wasm/proxy-wasm-cpp-sdk/archive/95bb82ce45c41d9100fd1ec15d2ffc67f7f3ceee.tar.gz"],
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
        # 10.7.193.13
        commit = "6c8b357a84847a479cd329478522feefc1c3195a",
        remote = "https://chromium.googlesource.com/v8/v8",
        shallow_since = "1664374400 +0000",
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
        commit = "521ac34ebd795939c7e16b37d9d3ddb40e8ed556",
        remote = "https://chromium.googlesource.com/chromium/src/base/trace_event/common.git",
        shallow_since = "1662508800 +0000",
    )

    native.bind(
        name = "base_trace_event_common",
        actual = "@com_googlesource_chromium_base_trace_event_common//:trace_event_common",
    )

    # WAMR with dependencies.

    maybe(
        http_archive,
        name = "com_github_bytecodealliance_wasm_micro_runtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wamr.BUILD",
        # WAMR-1.2.1
        sha256 = "7548d4bbea8dbb9b005e83bd571f93a12fb3f0b5e87a8b0130f004dd92df4b0b",
        strip_prefix = "wasm-micro-runtime-WAMR-1.2.1",
        url = "https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-1.2.1.zip",
    )

    native.bind(
        name = "wamr",
        actual = "@com_github_bytecodealliance_wasm_micro_runtime//:wamr_lib",
    )

    maybe(
        http_archive,
        name = "llvm-15_0_7",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wamr_llvm.BUILD",
        sha256 = "8b5fcb24b4128cf04df1b0b9410ce8b1a729cb3c544e6da885d234280dedeac6",
        strip_prefix = "llvm-project-15.0.7.src",
        url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.7/llvm-project-15.0.7.src.tar.xz",
    )

    # WasmEdge with dependencies.

    maybe(
        http_archive,
        name = "com_github_wasmedge_wasmedge",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmedge.BUILD",
        sha256 = "65d95e5f83d25ab09fa9a29369f578838e8a519fb170704d0f5896187364429b",
        strip_prefix = "WasmEdge-proxy-wasm-0.11.2",
        url = "https://github.com/WasmEdge/WasmEdge/archive/refs/tags/proxy-wasm/0.11.2.tar.gz",
    )

    native.bind(
        name = "wasmedge",
        actual = "@com_github_wasmedge_wasmedge//:wasmedge_lib",
    )

    # Wasmtime with dependencies.

    maybe(
        http_archive,
        name = "com_github_bytecodealliance_wasmtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
        sha256 = "917da461249b11a3176a39573723f78c627259576d0ca10b00d6e7f7fa047081",
        strip_prefix = "wasmtime-9.0.3",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v9.0.3.tar.gz",
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
        sha256 = "7cfa3d7334c96f89553bb44eeee736a192826a78b4db114042d38d6882748f5b",
        strip_prefix = "WAVM-nightly-2022-05-14",
        url = "https://github.com/WAVM/WAVM/archive/refs/tags/nightly/2022-05-14.tar.gz",
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
