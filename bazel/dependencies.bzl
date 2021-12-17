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
load("@proxy_wasm_cpp_host//bazel/cargo:crates.bzl", "proxy_wasm_cpp_host_fetch_remote_crates")
load("@rules_python//python:pip.bzl", "pip_install")
load("@rules_rust//rust:repositories.bzl", "rust_repositories")

def proxy_wasm_cpp_host_dependencies():
    protobuf_deps()
    rust_repositories()
    proxy_wasm_cpp_host_fetch_remote_crates()

    pip_install(
        name = "v8_python_deps",
        extra_pip_args = ["--require-hashes"],
        requirements = "@v8//:bazel/requirements.txt",
    )
