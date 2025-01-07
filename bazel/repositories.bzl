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

    # Update platforms for crate_universe. Can remove when we update Bazel version.
    maybe(
        http_archive,
        name = "platforms",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/platforms/releases/download/0.0.10/platforms-0.0.10.tar.gz",
            "https://github.com/bazelbuild/platforms/releases/download/0.0.10/platforms-0.0.10.tar.gz",
        ],
        sha256 = "218efe8ee736d26a3572663b374a253c012b716d8af0c07e842e82f238a0a7ee",
    )

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
        name = "rules_cc",
        sha256 = "abc605dd850f813bb37004b77db20106a19311a96b2da1c92b789da529d28fe1",
        strip_prefix = "rules_cc-0.0.17",
        urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.17/rules_cc-0.0.17.tar.gz"],
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
        sha256 = "3ec0eee05b243552cc4a784b30323d088bf73cb2177ddda02c827e68981933f1",
        strip_prefix = "rules_fuzzing-0.5.2",
        urls = ["https://github.com/bazelbuild/rules_fuzzing/archive/v0.5.2.tar.gz"],
    )

    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "778aaeab3e6cfd56d681c89f5c10d7ad6bf8d2f1a72de9de55b23081b2d31618",
        strip_prefix = "rules_python-0.34.0",
        url = "https://github.com/bazelbuild/rules_python/releases/download/0.34.0/rules_python-0.34.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "f1306aac0b258b790df01ad9abc6abb0df0b65416c74b4ef27f4aab298780a64",
        # NOTE: Update Rust version in bazel/dependencies.bzl.
        url = "https://github.com/bazelbuild/rules_rust/releases/download/0.56.0/rules_rust-0.56.0.tar.gz",
        patches = ["@proxy_wasm_cpp_host//bazel/external:rules_rust.patch"],
        patch_args = ["-p1"],
    )

    # Core deps. Keep them updated.

    # Note: we depend on Abseil via rules_fuzzing. Remove this pin when we update that.
    #
    # This is the latest LTS release, which picks up:
    # - Build fix: https://github.com/abseil/abseil-cpp/pull/1187
    # - A bugfix found in local fuzzing:
    #   https://github.com/abseil/abseil-cpp/commit/e7858c73279d81cbc005d9c76a385ab535520635
    maybe(
        http_archive,
        name = "com_google_absl",
        sha256 = "f50e5ac311a81382da7fa75b97310e4b9006474f9560ac46f54a9967f07d4ae3",
        strip_prefix = "abseil-cpp-20240722.0",
        urls = ["https://github.com/abseil/abseil-cpp/releases/download/20240722.0/abseil-cpp-20240722.0.tar.gz"],
    )

    # Required for boringssl. Boringssl has migrated to bzlmod and does not have a `dependencies` bzl function.
    maybe(
        http_archive,
        name = "rules_license",
        sha256 = "26d4021f6898e23b82ef953078389dd49ac2b5618ac564ade4ef87cced147b38",
        urls = [
            "https://github.com/bazelbuild/rules_license/releases/download/1.0.0/rules_license-1.0.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "boringssl",
        # 2025-01-06 (master-with-bazel)
        sha256 = "58dc95e4144320d1b77fc1dd6ef3e833ee9032e1021e1ff40f14fea229dacb74",
        strip_prefix = "boringssl-e168d25f4bfb75e661170839fc4b17eeb1c77306",
        urls = ["https://github.com/google/boringssl/archive/e168d25f4bfb75e661170839fc4b17eeb1c77306.tar.gz"],
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_sdk",
        sha256 = "4cdbee65d7c3c491ba42dcc3b201144ac781031f8b1e40cb0b9244ffca9c5d3e",
        strip_prefix = "proxy-wasm-cpp-sdk-a982ad089d1962f1b92f4343c910c0be6b6e6280",
        urls = ["https://github.com/proxy-wasm/proxy-wasm-cpp-sdk/archive/a982ad089d1962f1b92f4343c910c0be6b6e6280.tar.gz"],
    )

    # Compile DB dependencies.
    maybe(
        http_archive,
        name = "bazel_compdb",
        sha256 = "acd2a9eaf49272bb1480c67d99b82662f005b596a8c11739046a4220ec73c4da",
        strip_prefix = "bazel-compilation-database-40864791135333e1446a04553b63cbe744d358d0",
        url = "https://github.com/grailbio/bazel-compilation-database/archive/40864791135333e1446a04553b63cbe744d358d0.tar.gz",
    )

    # Test dependencies.

    maybe(
        http_archive,
        name = "com_google_googletest",
        sha256 = "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926",
        strip_prefix = "googletest-1.15.2",
        urls = ["https://github.com/google/googletest/releases/download/v1.15.2/googletest-1.15.2.tar.gz"],
    )

    # NullVM dependencies.

    maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = "63150aba23f7a90fd7d87bdf514e459dd5fe7023fdde01b56ac53335df64d4bd",
        strip_prefix = "protobuf-29.2",
        url = "https://github.com/protocolbuffers/protobuf/releases/download/v29.2/protobuf-29.2.tar.gz",
    )

    # V8 with dependencies.

    maybe(
        git_repository,
        name = "v8",
        # 10.7.193.13
        commit = "6c8b357a84847a479cd329478522feefc1c3195a",
        remote = "https://chromium.googlesource.com/v8/v8",
        shallow_since = "1664374400 +0000",
        patches = [
            "@proxy_wasm_cpp_host//bazel/external:v8.patch",
            "@proxy_wasm_cpp_host//bazel/external:v8_include.patch",
        ],
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
        # WAMR-2.2.0
        sha256 = "93b6ba03f681e061967106046b1908631ee705312b9a6410f3baee7af7c6aac9",
        strip_prefix = "wasm-micro-runtime-WAMR-2.2.0",
        url = "https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-2.2.0.tar.gz",
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
        sha256 = "7ab8a0df37c8d282ecff72d0f0bff8db63fd92df1645d5a014a9dbed4b7f9025",
        strip_prefix = "WasmEdge-proxy-wasm-0.13.1",
        url = "https://github.com/WasmEdge/WasmEdge/archive/refs/tags/proxy-wasm/0.13.1.tar.gz",
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
        sha256 = "17850ca356fce6ea8bcd3847692b3233588ddf32ff31fcccac67ad06bcac0a3a",
        strip_prefix = "wasmtime-25.0.3",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v25.0.3.tar.gz",
    )

    native.bind(
        name = "wasmtime",
        actual = "@com_github_bytecodealliance_wasmtime//:wasmtime_lib",
    )

    native.bind(
        name = "prefixed_wasmtime",
        actual = "@com_github_bytecodealliance_wasmtime//:prefixed_wasmtime_lib",
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
