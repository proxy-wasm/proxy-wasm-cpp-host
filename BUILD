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
    copts = ["-DWITHOUT_ZLIB=1"],
    deps = [
        ":include",
        "@com_google_protobuf//:protobuf_lite",
        "@proxy_wasm_cpp_sdk//:api_lib",
    ],
)

# TODO: remove when dependent projects have been upgraded.
cc_library(
    name = "lib14",
    srcs = glob(
        ["src/**/*.cc"],
        exclude = [
            "src/**/wavm*",
            "src/**/v8*",
        ],
    ) + glob(["src/**/*.h"]),
    copts = [
        "-std=c++14",
        "-DWITHOUT_ZLIB=1",
    ],
    deps = [
        ":include",
        "@com_google_absl//absl/base",
        "@com_google_absl//absl/strings",
        "@com_google_absl//absl/types:optional",
        "@com_google_protobuf//:protobuf_lite",
        "@proxy_wasm_cpp_sdk//:api_lib",
    ],
)

cc_test(
    name = "wasm_vm_test",
    srcs = ["wasm_vm_test.cc"],
    deps = [
        ":lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "context_test",
    srcs = ["context_test.cc"],
    deps = [
        ":include",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

# TODO: remove when dependent projects have been upgraded.
cc_test(
    name = "context_14_test",
    srcs = ["context_test.cc"],
    copts = ["-std=c++14"],
    deps = [
        ":include",
        "@com_google_absl//absl/base",
        "@com_google_absl//absl/strings",
        "@com_google_absl//absl/types:optional",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)
