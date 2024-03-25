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
load("@proxy_wasm_cpp_host//bazel/cargo/wasmsign/remote:crates.bzl", wasmsign_crate_repositories = "crate_repositories")
load("@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:crates.bzl", wasmtime_crate_repositories = "crate_repositories")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
load("@rules_fuzzing//fuzzing:init.bzl", "rules_fuzzing_init")
load("@rules_fuzzing//fuzzing:repositories.bzl", "rules_fuzzing_dependencies")
load("@rules_python//python:pip.bzl", "pip_install")
load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")
load("@rules_rust//rust:repositories.bzl", "rust_repositories", "rust_repository_set")
load("@rules_rust//crate_universe:repositories.bzl", "crate_universe_dependencies")

SUPPORTED_PLATFORM_TRIPLES = [
    "aarch64-unknown-linux-gnu",
    "aarch64-unknown-nixos-gnu",
    "i686-apple-darwin",
    "i686-pc-windows-msvc",
    "i686-unknown-linux-gnu",
    "x86_64-apple-darwin",
    "x86_64-pc-windows-msvc",
    "x86_64-unknown-linux-gnu",
    "x86_64-unknown-nixos-gnu",
    "aarch64-apple-darwin",
    "aarch64-apple-ios-sim",
    "aarch64-apple-ios",
    "aarch64-fuchsia",
    "aarch64-linux-android",
    "aarch64-pc-windows-msvc",
    "arm-unknown-linux-gnueabi",
    "armv7-linux-androideabi",
    "armv7-unknown-linux-gnueabi",
    "i686-linux-android",
    "i686-unknown-freebsd",
    "powerpc-unknown-linux-gnu",
    "riscv32imc-unknown-none-elf",
    "riscv64gc-unknown-none-elf",
    "s390x-unknown-linux-gnu",
    "thumbv7em-none-eabi",
    "thumbv8m.main-none-eabi",
    "wasm32-unknown-unknown",
    "wasm32-wasi",
    "x86_64-apple-ios",
    "x86_64-fuchsia",
    "x86_64-linux-android",
    "x86_64-unknown-freebsd",
    "x86_64-unknown-none",
    "aarch64-unknown-nto-qnx710",
]

def proxy_wasm_cpp_host_dependencies():
    # Bazel extensions.

    rules_foreign_cc_dependencies()

    rules_fuzzing_dependencies()
    rules_fuzzing_init()


    rules_rust_dependencies()

    rust_register_toolchains()

    rust_repositories()
    rust_repository_set(
        name = "rust_linux_x86_64",
        exec_triple = "x86_64-unknown-linux-gnu",
        extra_target_triples = [
            "aarch64-unknown-linux-gnu",
            "wasm32-unknown-unknown",
            "wasm32-wasi",
        ],
        version = "1.76.0",
    )
    rust_repository_set(
        name = "rust_linux_s390x",
        exec_triple = "s390x-unknown-linux-gnu",
        extra_target_triples = [
            "wasm32-unknown-unknown",
            "wasm32-wasi",
        ],
        version = "1.76.0",
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

    # NullVM dependencies.

    protobuf_deps()

    # V8 dependencies.

    pip_install(
        name = "v8_python_deps",
        extra_pip_args = ["--require-hashes"],
        requirements = "@v8//:bazel/requirements.txt",
    )

    crate_universe_dependencies(
        bootstrap = True,
    )

    # Wasmtime dependencies.
    wasmtime_crate_repositories()

    # Test dependencies.
    wasmsign_crate_repositories()
