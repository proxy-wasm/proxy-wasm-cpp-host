load("//:bazel/variables.bzl", "COPTS", "LINKOPTS")

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
        ["src/**/*.cc"],
        exclude = [
            "src/**/wavm*",
            "src/**/v8*",
        ],
    ) + glob(["src/**/*.h"]),
    copts = COPTS,
    deps = [
        ":include",
        "@boringssl//:crypto",
        "@com_google_protobuf//:protobuf_lite",
        "@proxy_wasm_cpp_sdk//:api_lib",
        "@wasm_c_api//:wasmtime_lib",
    ],
)
