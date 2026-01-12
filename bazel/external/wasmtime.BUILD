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

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "wasmtime_lib",
    srcs = [
        ":prefixed_wasmtime_c_api_lib",
    ],
    hdrs = glob(["crates/c-api/include/**"]) + [":wasmtime_conf.h"],
    includes = ["crates/c-api/include/"],
    linkstatic = 1,
)

genrule(
    name = "prefixed_wasmtime_c_api_lib",
    srcs = [
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:wasmtime-c-api-impl",
    ],
    outs = [
        "prefixed_wasmtime_c_api.a",
    ],
    cmd = """
        for symbol in $$(nm -P $(<) 2>/dev/null | grep -E ^_?wasm_ | cut -d" " -f1); do
            echo $$symbol | sed -r 's/^(_?)(wasm_[a-z_]+)$$/\\1\\2 \\1wasmtime_\\2/' >>prefixed
        done
        # This should be OBJCOPY, but bazel-zig-cc doesn't define it.
        objcopy --redefine-syms=prefixed $(<) $@
        """,
    toolchains = ["@bazel_tools//tools/cpp:current_cc_toolchain"],
)

# This must match the features defined in `bazel/cargo/wasmtime/Cargo.toml` for
# the C/C++ API to expose the right set of methods.
features = [
    "cranelift",
    "wat",
    "wasi",
    "gc-drc",
]

# Wasmtime C-api headers use cmakedefines to generate the config file.
# This does the same as CMake's configure_file, but using the crate features array above.
genrule(
    name = "wasmtime_conf.h",
    srcs = ["crates/c-api/include/wasmtime/conf.h.in"],
    outs = ["crates/c-api/include/wasmtime/conf.h"],
    cmd = """
      cat < $< > $$TMPDIR/working_file
      for enabled_feature in $$(echo "{}"); do
        sed -i "s/#cmakedefine WASMTIME_FEATURE_$$enabled_feature/#define WASMTIME_FEATURE_$$enabled_feature 1/" $$TMPDIR/working_file
      done
      sed -i 's/#cmakedefine \\(.*\\)/\\/\\/ \\1 is not defined./' $$TMPDIR/working_file
      cp $$TMPDIR/working_file $@
      """.format(" ".join([f.upper() for f in features])),
)
