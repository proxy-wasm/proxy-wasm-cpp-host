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

load("@io_bazel_rules_rust//:workspace.bzl", "rust_workspace")
load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
load("@proxy_wasm_cpp_host//bazel/cargo:crates.bzl", "proxy_wasm_cpp_host_raze__fetch_remote_crates")

def dependencies_extra():
    bazel_skylib_workspace()
    rust_repositories()
    rust_workspace()
    proxy_wasm_cpp_host_raze__fetch_remote_crates()
