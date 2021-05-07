load("@rules_cc//cc:defs.bzl", "cc_test")

cc_test(
    name = "bytecode_util_test",
    srcs = ["bytecode_util_test.cc"],
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
