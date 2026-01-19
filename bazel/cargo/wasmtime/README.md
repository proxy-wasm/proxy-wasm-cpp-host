# Wasmtime Cargo Vendor Patching

## Overview

The wasmtime vendored crates require two patches to work with stable Rust and prefixed linking:

1. **rust_static_library**: The wasmtime-c-api-impl crate needs to be built as a `rust_static_library` 
   instead of `rust_library` for proper prefixed linking support.
2. **unstable features**: The wasmtime-internal-fiber crate uses the `naked_functions` feature which 
   is still unstable in Rust 1.92.0. We need to enable it explicitly via rustc flags.

## Solution

This directory contains a helper script `vendor_and_patch.sh` that automates the process
of running the crates vendor and applying the necessary patches.

### Usage

To update the vendored crates (including when repinning dependencies):

```bash
./bazel/cargo/wasmtime/vendor_and_patch.sh --repin
```

To update vendored crates without repinning:

```bash
./bazel/cargo/wasmtime/vendor_and_patch.sh
```

### What the script does

1. Runs `bazel run //bazel/cargo/wasmtime:crates_vendor` with any provided arguments
2. Patches the generated `BUILD.wasmtime-c-api-impl-*.bazel` file to replace:
   - `rust_library` with `rust_static_library` in the load statement
   - `rust_library(` with `rust_static_library(` in the rule definition
3. Patches the generated `BUILD.wasmtime-internal-fiber-*.bazel` file to add:
   - `-Zcrate-attr=feature(naked_functions)` to rustc_flags to enable the unstable feature

### Manual patching

If you need to patch manually after running crates_vendor directly:

```bash
bazel run //bazel/cargo/wasmtime:crates_vendor -- --repin

# Patch 1: rust_static_library (portable sed approach for macOS and Linux)
for build_file in bazel/cargo/wasmtime/remote/BUILD.wasmtime-c-api-impl-*.bazel; do
  if [ -f "$build_file" ]; then
    sed 's/load("@rules_rust\/\/rust:defs.bzl", "rust_library")/load("@rules_rust\/\/rust:defs.bzl", "rust_static_library")/' "$build_file" > "$build_file.tmp"
    sed 's/^rust_library(/rust_static_library(/' "$build_file.tmp" > "$build_file"
    rm "$build_file.tmp"
  fi
done

# Patch 2: Enable unstable features for wasmtime-internal-fiber
for build_file in bazel/cargo/wasmtime/remote/BUILD.wasmtime-internal-fiber-*.bazel; do
  if [ -f "$build_file" ]; then
    sed 's/"--cap-lints=allow",/"-Zcrate-attr=feature(naked_functions)",\n        "--cap-lints=allow",/' "$build_file" > "$build_file.tmp"
    mv "$build_file.tmp" "$build_file"
  fi
done
```

## Why is this necessary?

### rust_static_library

The wasmtime C API requires prefixed symbols to avoid conflicts with other WebAssembly 
runtimes. This prefixing is done at the link level using a static library, which requires
the use of `rust_static_library` instead of the default `rust_library`.

### unstable features for wasmtime-internal-fiber

wasmtime-internal-fiber uses the `naked_functions` feature which is still unstable in
Rust 1.92.0. To use this feature with stable Rust, we need to enable it explicitly via
the `-Zcrate-attr=feature(naked_functions)` rustc flag.

See `bazel/cargo/wasmtime/Cargo.toml` for more details.
