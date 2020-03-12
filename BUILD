licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "include",
    hdrs = [
        "include/proxy-wasm/compat.h",
        "include/proxy-wasm/context.h",
        "include/proxy-wasm/wasm_vm.h",
        "include/proxy-wasm/word.h",
    ],
    deps = [
        "@proxy_wasm_cpp_sdk//:common_lib",
    ],
)

# TODO: remove when dependent projects have been upgraded.
cc_library(
    name = "include14",
    hdrs = [
        "include/proxy-wasm/compat.h",
        "include/proxy-wasm/context.h",
        "include/proxy-wasm/wasm_vm.h",
        "include/proxy-wasm/word.h",
    ],
    deps = [
        "@proxy_wasm_cpp_sdk//:common_lib",
    ],
)

cc_test(
    name = "wasm_vm_test",
    srcs = ["wasm_vm_test.cc"],
    copts = ["-std=c++17"],
    deps = [
        ":include",
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
    name = "wasm_vm_14_test",
    srcs = ["wasm_vm_test.cc"],
    copts = ["-std=c++14"],
    deps = [
        ":include14",
        "@com_google_absl//absl/base",
        "@com_google_absl//absl/strings:strings",
        "@com_google_absl//absl/types:optional",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "context_14_test",
    srcs = ["context_test.cc"],
    copts = ["-std=c++14"],
    deps = [
        ":include14",
        "@com_google_absl//absl/base",
        "@com_google_absl//absl/strings:strings",
        "@com_google_absl//absl/types:optional",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)
