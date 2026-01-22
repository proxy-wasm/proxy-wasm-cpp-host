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

load("@rules_cc//cc:defs.bzl", "cc_library")
load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "wasmedge_lib_cmake",
    cache_entries = {
        "WASMEDGE_BUILD_SHARED_LIB": "Off",
        "WASMEDGE_BUILD_STATIC_LIB": "On",
        "WASMEDGE_BUILD_TOOLS": "Off",
        "WASMEDGE_FORCE_DISABLE_LTO": "On",
        # Provide spdlog and fmt as external dependencies via Bazel (not CMake FetchContent)
        "CMAKE_PREFIX_PATH": "$$EXT_BUILD_DEPS/spdlog;$$EXT_BUILD_DEPS/fmt",
    } | select({
        "@proxy_wasm_cpp_host//bazel:engine_wasmedge_llvm": {
            "WASMEDGE_USE_LLVM": "On",
            "WASMEDGE_LINK_LLVM_STATIC": "On",
            "BAZEL_BUILD": "ON",
            # Set LLVM_INCLUDE_DIR for the build to use
            "LLVM_INCLUDE_DIR": "$$EXT_BUILD_ROOT/external/llvm_toolchain_llvm/include",
            # Set LLVM_DIR to the CMake config directory so find_package(LLVM) works
            # Use EXT_BUILD_DEPS since data files are copied there by rules_foreign_cc
            "LLVM_DIR": "$$EXT_BUILD_DEPS/llvm_cmake/lib/cmake/llvm",
        },
        "//conditions:default": {
            "WASMEDGE_USE_LLVM": "Off",
        },
    }),
    # LLVM dependencies for AOT are provided via Bazel, not CMake
    # LLVM headers from hermetic toolchain (bzlmod-compatible via data attribute)
    # LLVM libraries are linked via cc_library deps (see wasmedge_lib below)
    data = select({
        "@proxy_wasm_cpp_host//bazel:engine_wasmedge_llvm": [
            "@llvm-raw//:llvm_cmake_config",
            "@llvm_toolchain_llvm//:all_includes",
        ],
        "//conditions:default": [],
    }),
    env = select({
        "@proxy_wasm_cpp_host//bazel:engine_wasmedge_llvm": {
            # Reference LLVM headers in sandbox via EXT_BUILD_ROOT
            # The data attribute ensures llvm_toolchain_llvm is mounted in sandbox
            # This path works with both WORKSPACE and bzlmod
            "CFLAGS": "-isystem $$EXT_BUILD_ROOT/external/llvm_toolchain_llvm/include",
            "CXXFLAGS": "-isystem $$EXT_BUILD_ROOT/external/llvm_toolchain_llvm/include -Wno-error=deprecated-declarations -std=c++20",
        },
        "//conditions:default": {
            "CXXFLAGS": "-Wno-error=deprecated-declarations -std=c++20",
        },
    }),
    generate_args = ["-GNinja"],
    lib_source = ":srcs",
    out_static_libs = ["libwasmedge.a"],
    deps = [
        "@com_github_fmtlib_fmt//:fmt",
        "@com_github_gabime_spdlog//:spdlog",
    ],
)

# Wrapper library that adds LLVM dependencies for linking
cc_library(
    name = "wasmedge_lib",
    linkopts = select({
        "@proxy_wasm_cpp_host//bazel:engine_wasmedge_llvm": ["-ldl"],
        "//conditions:default": [],
    }),
    deps = [":wasmedge_lib_cmake"] + select({
        "@proxy_wasm_cpp_host//bazel:engine_wasmedge_llvm": [
            "@llvm-raw//:llvm_lib",
        ],
        "//conditions:default": [],
    }),
)
