load("@rules_cc//cc:defs.bzl", "cc_library")
load(
    "@proxy_wasm_cpp_host//bazel:select.bzl",
    "proxy_wasm_select_runtime_v8",
    "proxy_wasm_select_runtime_wamr",
    "proxy_wasm_select_runtime_wasmtime",
    "proxy_wasm_select_runtime_wavm",
)

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
    name = "common_lib",
    srcs = glob([
        "src/*.h",
        "src/*.cc",
        "src/common/*.h",
        "src/null/*.cc",
        "src/third_party/*.h",
        "src/third_party/*.cc",
    ]),
    deps = [
        ":include",
        "@boringssl//:crypto",
        "@proxy_wasm_cpp_sdk//:api_lib",
    ],
)

cc_library(
    name = "v8_lib",
    srcs = glob([
        # TODO(@mathetake): Add V8 lib.
        # "src/v8/*.h",
        # "src/v8/*.cc",
    ]),
    deps = [
        ":common_lib",
        # TODO(@mathetake): Add V8 lib.
    ],
)

cc_library(
    name = "wamr_lib",
    srcs = glob([
        "src/wamr/*.h",
        "src/wamr/*.cc",
    ]),
    deps = [
        ":common_lib",
        "@wamr//:wamr_lib",
    ],
)

cc_library(
    name = "wasmtime_lib",
    srcs = glob([
        "src/wasmtime/*.h",
        "src/wasmtime/*.cc",
    ]),
    deps = [
        ":common_lib",
        "@wasm_c_api//:wasmtime_lib",
    ],
)

cc_library(
    name = "wavm_lib",
    srcs = glob([
        "src/wavm/*.h",
        "src/wavm/*.cc",
    ]),
    copts = [
        '-DWAVM_API=""',
        "-Wno-non-virtual-dtor",
        "-Wno-old-style-cast",
    ],
    deps = [
        ":common_lib",
        "@wavm//:wavm_lib",
    ],
)

cc_library(
    name = "lib",
    deps = [
        ":common_lib",
    ] + proxy_wasm_select_runtime_v8(
        [":v8_lib"],
    ) + proxy_wasm_select_runtime_wamr(
        [":wamr_lib"],
    ) + proxy_wasm_select_runtime_wasmtime(
        [":wasmtime_lib"],
    ) + proxy_wasm_select_runtime_wavm(
        [":wavm_lib"],
    ),
)
