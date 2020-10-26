load("@io_bazel_rules_rust//rust:rust.bzl", "rust_library")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "helpers_lib",
    srcs = [
        "crates/runtime/src/helpers.c",
    ],
    visibility = ["//visibility:private"],
)

rust_library(
    name = "rust_c_api",
    srcs = glob(["crates/c-api/src/**/*.rs"]),
    crate_features = [
        "jitdump",
        "wat",
        "cache",
    ],
    crate_root = "crates/c-api/src/lib.rs",
    crate_type = "staticlib",
    edition = "2018",
    proc_macro_deps = [
        "@proxy_wasm_cpp_host//bazel/cargo:wasmtime_c_api_macros",
    ],
    visibility = ["//visibility:private"],
    deps = [
        ":helpers_lib",
        "@proxy_wasm_cpp_host//bazel/cargo:anyhow",
        "@proxy_wasm_cpp_host//bazel/cargo:env_logger",
        "@proxy_wasm_cpp_host//bazel/cargo:once_cell",
        "@proxy_wasm_cpp_host//bazel/cargo:wasmtime",
        "@proxy_wasm_cpp_host//bazel/cargo:wat",
    ],
)

cc_library(
    name = "c_api",
    hdrs = [
        "crates/c-api/include/wasi.h",
        "crates/c-api/include/wasmtime.h",
        "@wasm-c-api//:include/wasm.h",
    ],
    include_prefix = "wasmtime",
    includes = [
        "crates/c-api/include/",
        "include/",
    ],
    deps = [
        ":helpers_lib",
        ":rust_c_api",
    ],
)
