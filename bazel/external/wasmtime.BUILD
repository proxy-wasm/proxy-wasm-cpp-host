load("@rules_cc//cc:defs.bzl", "cc_library")
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
        "@proxy_wasm_cpp_host//bazel/cargo:wasmtime_c_api_macros",
    ],
    deps = [
        "@proxy_wasm_cpp_host//bazel/cargo:anyhow",
        "@proxy_wasm_cpp_host//bazel/cargo:env_logger",
        "@proxy_wasm_cpp_host//bazel/cargo:once_cell",
        "@proxy_wasm_cpp_host//bazel/cargo:wasmtime",
    ],
)
