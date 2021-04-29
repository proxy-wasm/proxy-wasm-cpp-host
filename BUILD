load("@rules_cc//cc:defs.bzl", "cc_library")
load(
    "@proxy_wasm_cpp_host//bazel:select.bzl",
    "proxy_wasm_select_wasm_runtime_v8",
    "proxy_wasm_select_wasm_runtime_wasmtime",
    "proxy_wasm_select_wasm_runtime_wavm",
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
        "src/common/*.cc",
        "src/third_party/*.h",
        "src/third_party/*.cc",
        "src/null/*.cc",
    ]),
    deps = [
        ":include",
        "@boringssl//:crypto",
        "@com_google_protobuf//:protobuf_lite",
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
        # TODO(@mathetake): Add WAVM lib.
        # "src/wavm/*.h",
        # "src/wavm/*.cc",
    ]),
    deps = [
        ":common_lib",
        # TODO(@mathetake): Add WAVM lib.
    ],
)

cc_library(
    name = "lib",
    deps = [
        ":common_lib",
    ] + proxy_wasm_select_wasm_runtime_wasmtime(
        ["wasmtime_lib"],
    ) + proxy_wasm_select_wasm_runtime_v8(
        ["v8_lib"],
    ) + proxy_wasm_select_wasm_runtime_wavm(
        ["wavm_lib"],
    ),
)
