load("@proxy_wasm_cpp_host//bazel:wasm.bzl", "wasm_rust_binary")

package(default_visibility = ["//visibility:public"])

wasm_rust_binary(
    name = "abi_export.wasm",
    srcs = ["abi_export.rs"],
)

wasm_rust_binary(
    name = "callback.wasm",
    srcs = ["callback.rs"],
)

wasm_rust_binary(
    name = "trap.wasm",
    srcs = ["trap.rs"],
)
