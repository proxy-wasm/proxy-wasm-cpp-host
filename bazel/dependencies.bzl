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

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
load("@envoy_toolshed//sysroot:sysroot.bzl", "setup_sysroots")
load("@proxy_wasm_cpp_host//bazel/cargo/wasmsign/remote:crates.bzl", wasmsign_crate_repositories = "crate_repositories")
load("@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:crates.bzl", wasmtime_crate_repositories = "crate_repositories")
load("@rules_python//python:repositories.bzl", "py_repositories", "python_register_toolchains")
load("@rules_rust//crate_universe:repositories.bzl", "crate_universe_dependencies")
load("@rules_rust//rust:repositories.bzl", "rust_repositories", "rust_repository_set")
load("@toolchains_llvm//toolchain:deps.bzl", "bazel_toolchain_dependencies")
load("@toolchains_llvm//toolchain:rules.bzl", "llvm_toolchain")

def proxy_wasm_cpp_host_dependencies():
    # Bazel extensions.

    py_repositories()
    python_register_toolchains(
        name = "python_3_9",
        python_version = "3.9",
        ignore_root_user_error = True,  # for docker run
    )

    rust_repositories()
    rust_repository_set(
        name = "rust_linux_x86_64",
        exec_triple = "x86_64-unknown-linux-gnu",
        extra_target_triples = [
            "aarch64-unknown-linux-gnu",
            "wasm32-unknown-unknown",
            "wasm32-wasi",  # TODO: Change to wasm32-wasip1 once https://github.com/bazelbuild/rules_rust/issues/2782 is fixed
        ],
        version = "1.77.2",
    )
    rust_repository_set(
        name = "rust_linux_s390x",
        exec_triple = "s390x-unknown-linux-gnu",
        extra_target_triples = [
            "wasm32-unknown-unknown",
            "wasm32-wasi",
        ],
        version = "1.77.2",
    )
    crate_universe_dependencies(bootstrap = True)

    setup_sysroots()
    bazel_toolchain_dependencies()
    llvm_toolchain(
        name = "llvm_toolchain",
        llvm_version = "18.1.8",
        sha256 = {
            "linux-x86_64": "54ec30358afcc9fb8aa74307db3046f5187f9fb89fb37064cdde906e062ebf36",
        },
        strip_prefix = {
            "linux-x86_64": "clang+llvm-18.1.8-x86_64-linux-gnu-ubuntu-18.04",
        },
        urls = {
            "linux-x86_64": [
                "https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/clang+llvm-18.1.8-x86_64-linux-gnu-ubuntu-18.04.tar.xz",
            ],
        },
    )

    llvm_toolchain(
        name = "llvm_aarch64",
        llvm_version = "18.1.8",
        toolchain_roots = {
            "": "@llvm_toolchain_llvm//",
        },
        sysroot = {
          "linux-aarch64": "@sysroot_linux_arm64//:sysroot",
        },
    )

    # NullVM dependencies.

    protobuf_deps()

    # Wasmtime dependencies.

    wasmtime_crate_repositories()

    # Test dependencies.

    wasmsign_crate_repositories()
