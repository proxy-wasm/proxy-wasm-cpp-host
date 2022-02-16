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
        name = "rust_linux_x86_64",
        exec_triple = "x86_64-unknown-linux-gnu",
        extra_target_triples = [
            "aarch64-unknown-linux-gnu",
            "wasm32-unknown-unknown",
            "wasm32-wasi",
        ],
        version = "1.58.1",
    )
    rust_repository_set(
        name = "rust_linux_s390x",
        exec_triple = "s390x-unknown-linux-gnu",
        extra_target_triples = [
            "wasm32-unknown-unknown",
            "wasm32-wasi",
        ],
        version = "1.58.1",
    )

    zig_register_toolchains(
        version = "0.10.0-dev.654+44b5fdf32",
        url_format = "https://ziglang.org/builds/zig-{host_platform}-{version}.tar.xz",
        host_platform_sha256 = {
            "linux-aarch64": "a881dfc72671191ed01e50c9fa622c5ec73855b2aa9c99473c273a4f38585712",
            "linux-x86_64": "e20e1887c3236f59c3f783e471ec0ccbcd699fcbb08f25f50cbe2968a221fffa",
            "macos-aarch64": "17b6ab7c12cb7f5c8dd62540945f2bea56f332d1efe289ce72c9a7e0b186e550",
            "macos-x86_64": "b038d63ad620e48dac146b2e4e0b848864d124e7e19e1cde57db20ec2dda3081",
        },
    )

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
