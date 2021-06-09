load("@rules_cc//cc:defs.bzl", "cc_library")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "api_lib",
    hdrs = [
        "proxy_wasm_api.h",
        "proxy_wasm_externs.h",
    ],
    deps = [
        ":common_lib",
    ],
)

cc_library(
    name = "common_lib",
    hdrs = [
        "proxy_wasm_common.h",
        "proxy_wasm_enums.h",
    ],
)
