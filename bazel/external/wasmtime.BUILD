load("@rules_rust//rust:defs.bzl", "rust_static_library")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

rust_static_library(
    name = "rust_c_api",
    srcs = glob(["crates/c-api/src/**/*.rs"]),
    crate_features = [],
    crate_root = "crates/c-api/src/lib.rs",
    edition = "2018",
    proc_macro_deps = [
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:wasmtime_c_api_macros",
    ],
    deps = [
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:anyhow",
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:env_logger",
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:once_cell",
        # buildifier: leave-alone
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:wasmtime",
    ],
)
