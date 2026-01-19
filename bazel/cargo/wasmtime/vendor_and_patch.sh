#!/usr/bin/env bash
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

# This script runs the crates_vendor target and then patches the generated
# BUILD files for wasmtime compatibility.

set -euo pipefail

# Run the crates_vendor target
bazel run //bazel/cargo/wasmtime:crates_vendor "$@"

# Patch 1: Change rust_library to rust_static_library in wasmtime-c-api-impl
# This is required for prefixed symbol linking
for build_file in bazel/cargo/wasmtime/remote/BUILD.wasmtime-c-api-impl-*.bazel; do
  if [ -f "$build_file" ]; then
    # First replacement: change the load statement
    sed 's/load("@rules_rust\/\/rust:defs.bzl", "rust_library")/load("@rules_rust\/\/rust:defs.bzl", "rust_static_library")/' "$build_file" > "$build_file.tmp"
    # Second replacement: change the rule call
    sed 's/^rust_library(/rust_static_library(/' "$build_file.tmp" > "$build_file"
    rm "$build_file.tmp"
  fi
done

# Patch 2: Enable unstable features for wasmtime-internal-fiber on aarch64
# Edition 2024 with naked_functions requires nightly features on stable Rust
for build_file in bazel/cargo/wasmtime/remote/BUILD.wasmtime-internal-fiber-*.bazel; do
  if [ -f "$build_file" ]; then
    # Add unstable feature flags before --cap-lints=allow
    sed 's/"--cap-lints=allow",/"-Zcrate-attr=feature(naked_functions)",\n        "--cap-lints=allow",/' "$build_file" > "$build_file.tmp"
    mv "$build_file.tmp" "$build_file"
  fi
done

echo "Successfully patched wasmtime BUILD files:"
echo "  - rust_static_library for wasmtime-c-api-impl (required for prefixed linking)"
echo "  - unstable features for wasmtime-internal-fiber (required for naked_functions)"
