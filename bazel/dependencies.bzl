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

load("@bazel-zig-cc//toolchain:defs.bzl", zig_register_toolchains = "register_toolchains")
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
load("@proxy_wasm_cpp_host//bazel/cargo/wasmsign:crates.bzl", "wasmsign_fetch_remote_crates")
load("@proxy_wasm_cpp_host//bazel/cargo/wasmtime:crates.bzl", "wasmtime_fetch_remote_crates")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
load("@rules_python//python:pip.bzl", "pip_install")
load("@rules_rust//rust:repositories.bzl", "rust_repositories", "rust_repository_set")

def proxy_wasm_cpp_host_dependencies():
    # Bazel extensions.

    rules_foreign_cc_dependencies()

    rust_repositories()
    rust_repository_set(
        name = "rust_linux_s390x",
        exec_triple = "s390x-unknown-linux-gnu",
        extra_target_triples = ["wasm32-unknown-unknown", "wasm32-wasi"],
        version = "1.58.1",
    )

    zig_register_toolchains()

    # Core dependencies.

    protobuf_deps()

    wasmsign_fetch_remote_crates()

    # V8 dependencies.

    pip_install(
        name = "v8_python_deps",
        extra_pip_args = ["--require-hashes"],
        requirements = "@v8//:bazel/requirements.txt",
    )

    # Wasmtime dependencies.

    wasmtime_fetch_remote_crates()
