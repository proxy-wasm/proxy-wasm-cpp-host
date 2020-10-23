load("//:variables.bzl", "COPTS", "LINKOPTS")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "include",
    hdrs = glob(["include/proxy-wasm/**/*.h"]),
    deps = [
        "@proxy_wasm_cpp_sdk//:common_lib",
    ],
)

cc_library(
    name = "lib",
    srcs = glob(
        ["src/**/*.cc"],
        exclude = [
            "src/**/wavm*",
            "src/**/v8*",
        ],
    ) + glob(["src/**/*.h"]),
    copts = COPTS,
    linkopts = LINKOPTS,
    deps = [
        ":include",
        "@boringssl//:crypto",
        "@com_google_protobuf//:protobuf_lite",
        "@proxy_wasm_cpp_sdk//:api_lib",
        "@wasmtime//:c_api",
    ],
)
