load("@rules_cc//cc:defs.bzl", "cc_library")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "wasmtime_lib",
    hdrs = [
        "include/wasm.h",
    ],
    copts = select({
        "@platforms//os:windows": [
            "-DWASM_API_EXTERN="
        ],
        "//conditions:default": [],
    }),
    include_prefix = "wasmtime",
    deps = [
        "@com_github_bytecodealliance_wasmtime//:rust_c_api",
    ],
)
