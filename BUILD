load("@rules_cc//cc:defs.bzl", "cc_library")
load("@proxy_wasm_cpp_host//bazel:variables.bzl", "COPTS")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "include",
    hdrs = glob(["include/proxy-wasm/**/*.h"]),
    deps = [
        "@proxy_wasm_cpp_sdk//:common_lib",
    ],
)

# TODO(mathetkae): once other runtimes(WAVM,V8) can be linked in this repos,
#   use -define=wasm=v8|wavm|wasmtime and switch
cc_library(
    name = "lib",
    srcs = glob(
        [
            "src/**/*.cc",
            "src/**/*.h",
        ],
        exclude = [
            "src/**/wavm*",
            "src/**/v8*",
        ],
    ),
    hdrs = glob(["src/**/*.h"]),
    copts = COPTS,
    deps = [
        ":include",
        "@boringssl//:crypto",
        "@com_google_protobuf//:protobuf_lite",
        "@proxy_wasm_cpp_sdk//:api_lib",
        "@wasm_c_api//:wasmtime_lib",
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
    ]),
    deps = [
        ":include",
        "//external:abseil_flat_hash_map",
        "//external:abseil_optional",
        "//external:abseil_strings",
        "//external:protobuf",
        "//external:ssl",
        "//external:zlib",
        "@proxy_wasm_cpp_sdk//:api_lib",
        "@proxy_wasm_cpp_sdk//:common_lib",
    ],
)

cc_library(
    name = "null_lib",
    srcs = glob([
        "src/null/*.cc",
    ]),
    deps = [
        ":common_lib",
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
        "@com_github_wasm_c_api//:wasmtime_lib",
    ],
)
