load("@rules_cc//cc:defs.bzl", "cc_test")
load("@proxy_wasm_cpp_host//bazel:variables.bzl", "COPTS")

cc_test(
    name = "wasm_util_test",
    srcs = ["wasm_util_test.cc"],
    copts = COPTS,
    data = [
        "//test/test_data:abi_export.wasm",
    ],
    deps = [
        "//:lib",
        "//test:utility_lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)
