licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "c_api",
    srcs = glob([
        "include/*.h",
        "lib/*.a",
    ]),
    hdrs = [
        "include/wasm.h",
        "include/wasmtime.h",
    ],
    include_prefix = "wasmtime",
    includes = ["include/"],
)
