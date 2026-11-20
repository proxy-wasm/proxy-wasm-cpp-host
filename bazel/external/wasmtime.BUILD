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
load("@rules_rust//rust:defs.bzl", "rust_static_library")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "wasmtime_lib",
    srcs = [
        ":wasmtime_lib_staticlib",
    ],
    hdrs = glob(["crates/c-api/include/**"]) + [":wasmtime_conf.h"],
    includes = ["crates/c-api/include/"],
)

genrule(
    name = "wasmtime_c_api_lib_rs",
    outs = ["wasmtime_c_api_lib.rs"],
    cmd = "echo 'pub use wasmtime_c_api;' > $@",
)

# Wrap wasmtime-c-api-impl in a rust_static_library so it can be used as a cc_library.
rust_static_library(
    name = "wasmtime_lib_staticlib",
    srcs = [
        ":wasmtime_c_api_lib_rs",
    ],
    crate_root = ":wasmtime_c_api_lib_rs",
    edition = "2021",
    deps = [
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:wasmtime-c-api-impl",
    ],
)

# This should match the features defined in `bazel/cargo/wasmtime/Cargo.toml`
# for the C/C++ API to expose the right set of methods. Listing the feature
# here enables the C-api implementations of the features. Rust-side
# implementations are controlled by the Cargo.toml file. Mismatching features
# will result in compile/link time failures.
features = [
    "cranelift",
    "winch",
    "gc-drc",
    # The C API of Wasmtime references the "gc" feature whenever cranelift is turned on.
    # Without adding `gc` to the headers, the C++ API will fail at compile time.
    # `gc` is not actually used by proxy-wasm, so the corresponding feature is not
    # enabled in Cargo.toml. If proxy-wasm used gc, this configuration would fail
    # at link time.
    "gc",
]

# Wasmtime C-api headers use cmakedefines to generate the config file.
# This does the same as CMake's configure_file, but using the crate features array above.
genrule(
    name = "wasmtime_conf.h",
    srcs = ["crates/c-api/include/wasmtime/conf.h.in"],
    outs = ["crates/c-api/include/wasmtime/conf.h"],
    cmd = """
      TMPDIR=$${{TMPDIR:-"$$(mktemp -d)"}}
      cat < $< > $$TMPDIR/working_file
      for enabled_feature in $$(echo "{}"); do
        perl -pi -e "s/#cmakedefine WASMTIME_FEATURE_$$enabled_feature/#define WASMTIME_FEATURE_$$enabled_feature 1/" $$TMPDIR/working_file
      done
      perl -pi -e 's?#cmakedefine (.*)?// \\1 is not defined.?' $$TMPDIR/working_file
      cp $$TMPDIR/working_file $@
      """.format(" ".join([f.upper() for f in features])),
)
