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
load("@rules_fuzzing//fuzzing:init.bzl", "rules_fuzzing_init")
load("@rules_fuzzing//fuzzing:repositories.bzl", "rules_fuzzing_dependencies")
load("@rules_python//python:pip.bzl", "pip_install")
load("@rules_rust//rust:repositories.bzl", "rust_repositories", "rust_repository_set")

def proxy_wasm_cpp_host_dependencies():
    # Bazel extensions.

    rules_foreign_cc_dependencies()

    rules_fuzzing_dependencies()
    rules_fuzzing_init()

    rust_repositories()
    rust_repository_set(
        name = "rust_linux_x86_64",
        exec_triple = "x86_64-unknown-linux-gnu",
        extra_target_triples = [
            "aarch64-unknown-linux-gnu",
            "wasm32-unknown-unknown",
            "wasm32-wasi",
        ],
        version = "1.68.0",
    )
    rust_repository_set(
        name = "rust_linux_s390x",
        exec_triple = "s390x-unknown-linux-gnu",
        extra_target_triples = [
            "wasm32-unknown-unknown",
            "wasm32-wasi",
        ],
        version = "1.68.0",
    )

    zig_register_toolchains(
        version = "0.9.1",
        url_format = "https://ziglang.org/download/{version}/zig-{host_platform}-{version}.tar.xz",
        host_platform_sha256 = {
            "linux-aarch64": "5d99a39cded1870a3fa95d4de4ce68ac2610cca440336cfd252ffdddc2b90e66",
            "linux-x86_64": "be8da632c1d3273f766b69244d80669fe4f5e27798654681d77c992f17c237d7",
            "macos-aarch64": "8c473082b4f0f819f1da05de2dbd0c1e891dff7d85d2c12b6ee876887d438287",
            "macos-x86_64": "2d94984972d67292b55c1eb1c00de46580e9916575d083003546e9a01166754c",
        },
    )

    # Test dependencies.

    wasmsign_fetch_remote_crates()

    # NullVM dependencies.

    protobuf_deps()

    # V8 dependencies.

    pip_install(
        name = "v8_python_deps",
        extra_pip_args = ["--require-hashes"],
        requirements = "@v8//:bazel/requirements.txt",
    )

    # Wasmtime dependencies.

    wasmtime_fetch_remote_crates()
