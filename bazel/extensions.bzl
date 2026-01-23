# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@bazel_features//:features.bzl", "bazel_features")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//bazel/cargo/wasmsign/remote:crates.bzl", _wasmsign_crate_repositories = "crate_repositories")
load("//bazel/cargo/wasmtime/remote:crates.bzl", _wasmtime_crate_repositories = "crate_repositories")

def _wasmtime_crates_impl(ctx):
    deps = []
    for repo in _wasmtime_crate_repositories():
        if not repo.is_dev_dep:
            deps.append(repo.repo)

    return ctx.extension_metadata(
        reproducible = bazel_features.external_deps.extension_metadata_has_reproducible,
        root_module_direct_deps = deps,
        root_module_direct_dev_deps = [],
    )

wasmtime_crates = module_extension(
    implementation = _wasmtime_crates_impl,
)

def _wasmsign_crates_impl(ctx):
    deps = []
    for repo in _wasmsign_crate_repositories():
        if not repo.is_dev_dep:
            deps.append(repo.repo)

    return ctx.extension_metadata(
        reproducible = bazel_features.external_deps.extension_metadata_has_reproducible,
        root_module_direct_deps = deps,
        root_module_direct_dev_deps = [],
    )

wasmsign_crates = module_extension(
    implementation = _wasmsign_crates_impl,
)

def _wasmtime_impl(ctx):
    http_archive(
        name = "com_github_bytecodealliance_wasmtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
        sha256 = "2ccb49bb3bfa4d86907ad4c80d1147aef6156c7b6e3f7f14ed02a39de9761155",
        strip_prefix = "wasmtime-24.0.0",
        url = "https://github.com/bytecodealliance/wasmtime/archive/v24.0.0.tar.gz",
    )
    return ctx.extension_metadata(
        root_module_direct_deps = ["com_github_bytecodealliance_wasmtime"],
        root_module_direct_dev_deps = [],
    )

wasmtime = module_extension(
    implementation = _wasmtime_impl,
)

def _wamr_impl(ctx):
    http_archive(
        name = "com_github_bytecodealliance_wasm_micro_runtime",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wamr.BUILD",
        sha256 = "ca18bbf304f47287bf43707564db63b8908dd6d0d6ac40bb39271a7144def4cc",
        strip_prefix = "wasm-micro-runtime-WAMR-2.4.1",
        url = "https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-2.4.1.zip",
        patches = ["@proxy_wasm_cpp_host//bazel/external:wamr.patch"],
        patch_args = ["-p1"],
    )
    return ctx.extension_metadata(
        root_module_direct_deps = ["com_github_bytecodealliance_wasm_micro_runtime"],
        root_module_direct_dev_deps = [],
    )

wamr = module_extension(
    implementation = _wamr_impl,
)

def _wamr_jit_deps_impl(ctx):
    # These dependencies must be in the global namespace so we can call use_repo_rule.
    # LLVM dependency for jit build
    http_archive(
        name = "llvm-raw",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wamr_llvm.BUILD",
        sha256 = "5042522b49945bc560ff9206f25fb87980a9b89b914193ca00d961511ff0673c",
        strip_prefix = "llvm-project-19.1.0.src",
        url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.0/llvm-project-19.1.0.src.tar.xz",
    )

    # LLVM external dependencies for native Bazel build.
    http_archive(
        name = "llvm_zlib",
        build_file = "@llvm-raw//utils/bazel/third_party_build:zlib-ng.BUILD",
        sha256 = "e36bb346c00472a1f9ff2a0a4643e590a254be6379da7cddd9daeb9a7f296731",
        strip_prefix = "zlib-ng-2.0.7",
        urls = [
            "https://github.com/zlib-ng/zlib-ng/archive/refs/tags/2.0.7.zip",
        ],
    )

    http_archive(
        name = "llvm_zstd",
        build_file = "@llvm-raw//utils/bazel/third_party_build:zstd.BUILD",
        sha256 = "7c42d56fac126929a6a85dbc73ff1db2411d04f104fae9bdea51305663a83fd0",
        strip_prefix = "zstd-1.5.2",
        urls = [
            "https://github.com/facebook/zstd/releases/download/v1.5.2/zstd-1.5.2.tar.gz",
        ],
    )
    return ctx.extension_metadata(
        root_module_direct_deps = ["llvm-raw", "llvm_zlib", "llvm_zstd"],
        root_module_direct_dev_deps = [],
    )

wamr_jit_deps = module_extension(
    implementation = _wamr_jit_deps_impl,
)

def _wasmedge_impl(ctx):
    http_archive(
        name = "com_github_wasmedge_wasmedge",
        build_file = "@proxy_wasm_cpp_host//bazel/external:wasmedge.BUILD",
        sha256 = "7ab8a0df37c8d282ecff72d0f0bff8db63fd92df1645d5a014a9dbed4b7f9025",
        strip_prefix = "WasmEdge-proxy-wasm-0.13.1",
        url = "https://github.com/WasmEdge/WasmEdge/archive/refs/tags/proxy-wasm/0.13.1.tar.gz",
    )
    return ctx.extension_metadata(
        root_module_direct_deps = ["com_github_wasmedge_wasmedge"],
        root_module_direct_dev_deps = [],
    )

wasmedge = module_extension(
    implementation = _wasmedge_impl,
)
