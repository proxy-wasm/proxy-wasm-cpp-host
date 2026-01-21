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

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//bazel/cargo/wasmtime/remote:crates.bzl", _wasmtime_crate_repositories = "crate_repositories")

def _wasmtime_crates_impl(ctx):
    direct_deps = _wasmtime_crate_repositories()
    return ctx.extension_metadata(
        root_module_direct_deps = [dep.repo for dep in direct_deps],
        root_module_direct_dev_deps = [],
    )

wasmtime_crates = module_extension(
    implementation = _wasmtime_crates_impl,
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

def _v8_impl(ctx):
    http_archive(
        name = "v8",
        urls = ["https://github.com/v8/v8/archive/refs/tags/14.4.258.16.tar.gz"],
        integrity = "sha256-igwEEi6kcb2q7EodzjJasjCx/6LRMiFTVWfDKcNB+Xw=",
        strip_prefix = "v8-14.4.258.16",
        patches = [
            "@proxy_wasm_cpp_host//bazel/external:v8.patch",
        ],
        patch_strip = 1,
        patch_cmds = [
            "find ./src ./include -type f -exec sed -i.bak -e 's!#include \"third_party/simdutf/simdutf.h\"!#include \"simdutf.h\"!' {} \\;",
            "find ./src ./include -type f -exec sed -i.bak -e 's!#include \"third_party/fp16/src/include/fp16.h\"!#include \"fp16.h\"!' {} \\;",
            "find ./src ./include -type f -exec sed -i.bak -e 's!#include \"third_party/dragonbox/src/include/dragonbox/dragonbox.h\"!#include \"dragonbox/dragonbox.h\"!' {} \\;",
            "find ./src ./include -type f -exec sed -i.bak -e 's!#include \"third_party/fast_float/src/include/fast_float/!#include \"fast_float/!' {} \\;",
        ],
    )
    return ctx.extension_metadata(
        root_module_direct_deps = ["v8"],
        root_module_direct_dev_deps = [],
    )

v8 = module_extension(
    implementation = _v8_impl,
)

def _v8_deps_impl(ctx):
    # V8 supporting dependencies
    http_archive(
        name = "highway",
        sha256 = "7e0be78b8318e8bdbf6fa545d2ecb4c90f947df03f7aadc42c1967f019e63343",
        urls = ["https://github.com/google/highway/archive/refs/tags/1.2.0.tar.gz"],
        strip_prefix = "highway-1.2.0",
    )
    http_archive(
        name = "fast_float",
        sha256 = "d2a08e722f461fe699ba61392cd29e6b23be013d0f56e50c7786d0954bffcb17",
        urls = ["https://github.com/fastfloat/fast_float/archive/refs/tags/v7.0.0.tar.gz"],
        strip_prefix = "fast_float-7.0.0",
    )
    http_archive(
        name = "dragonbox",
        urls = ["https://github.com/jk-jeon/dragonbox/archive/6c7c925b571d54486b9ffae8d9d18a822801cbda.zip"],
        strip_prefix = "dragonbox-6c7c925b571d54486b9ffae8d9d18a822801cbda",
        sha256 = "2f10448d665355b41f599e869ac78803f82f13b070ce7ef5ae7b5cceb8a178f3",
        build_file = "@proxy_wasm_cpp_host//bazel/external:dragonbox.BUILD",
    )
    http_archive(
        name = "fp16",
        urls = ["https://github.com/Maratyszcza/FP16/archive/0a92994d729ff76a58f692d3028ca1b64b145d91.zip"],
        strip_prefix = "FP16-0a92994d729ff76a58f692d3028ca1b64b145d91",
        sha256 = "e66e65515fa09927b348d3d584c68be4215cfe664100d01c9dbc7655a5716d70",
        build_file = "@proxy_wasm_cpp_host//bazel/external:fp16.BUILD",
    )
    http_archive(
        name = "simdutf",
        sha256 = "512374f8291d3daf102ccd0ad223b1a8318358f7c1295efd4d9a3abbb8e4b6ff",
        urls = ["https://github.com/simdutf/simdutf/releases/download/v7.3.0/singleheader.zip"],
        build_file = "@proxy_wasm_cpp_host//bazel/external:simdutf.BUILD",
    )
    http_archive(
        name = "intel_ittapi",
        strip_prefix = "ittapi-a3911fff01a775023a06af8754f9ec1e5977dd97",
        sha256 = "1d0dddfc5abb786f2340565c82c6edd1cff10c917616a18ce62ee0b94dbc2ed4",
        urls = ["https://github.com/intel/ittapi/archive/a3911fff01a775023a06af8754f9ec1e5977dd97.tar.gz"],
        build_file = "@proxy_wasm_cpp_host//bazel/external: intel_ittapi.BUILD",
    )
    return ctx.extension_metadata(
        root_module_direct_deps = [
            "highway",
            "fast_float",
            "dragonbox",
            "fp16",
            "simdutf",
            "intel_ittapi",
        ],
        root_module_direct_dev_deps = [],
    )

v8_deps = module_extension(
    implementation = _v8_deps_impl,
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
