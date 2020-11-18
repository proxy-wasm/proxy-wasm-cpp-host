licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "wasmtime_lib",
    hdrs = [
        "include/wasm.h",
    ],
    defines = ["WASM_WASMTIME"],
    include_prefix = "wasmtime",
    deps = [
        "@wasmtime//:rust_c_api",
    ],
)
