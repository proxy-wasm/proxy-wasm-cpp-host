load("@proxy_wasm_cpp_host//bazel:wasm.bzl", "wasm_rust_binary")
load("@proxy_wasm_cpp_sdk//bazel:defs.bzl", "proxy_wasm_cc_binary")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

wasm_rust_binary(
    name = "abi_export.wasm",
    srcs = ["abi_export.rs"],
)

wasm_rust_binary(
    name = "abi_export.signed.with.key1.wasm",
    srcs = ["abi_export.rs"],
    signing_key = [
        "signature_key1.key",
        "signature_key1.pub",
    ],
)

wasm_rust_binary(
    name = "abi_export.signed.with.key2.wasm",
    srcs = ["abi_export.rs"],
    signing_key = [
        "signature_key2.key",
        "signature_key2.pub",
    ],
)

wasm_rust_binary(
    name = "bad_malloc.wasm",
    srcs = ["bad_malloc.rs"],
)

wasm_rust_binary(
    name = "callback.wasm",
    srcs = ["callback.rs"],
)

wasm_rust_binary(
    name = "trap.wasm",
    srcs = ["trap.rs"],
)

wasm_rust_binary(
    name = "resource_limits.wasm",
    srcs = ["resource_limits.rs"],
)

wasm_rust_binary(
    name = "env.wasm",
    srcs = ["env.rs"],
    wasi = True,
)

wasm_rust_binary(
    name = "clock.wasm",
    srcs = ["clock.rs"],
    wasi = True,
)

wasm_rust_binary(
    name = "random.wasm",
    srcs = ["random.rs"],
    wasi = True,
)

proxy_wasm_cc_binary(
    name = "canary_check.wasm",
    srcs = ["canary_check.cc"],
)
