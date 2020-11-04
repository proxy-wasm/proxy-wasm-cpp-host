load("@rules_cc//cc:defs.bzl", "cc_test")
load("//:variables.bzl", "COPTS", "LINKOPTS")

cc_test(
    name = "null_vm_test",
    srcs = ["null_vm_test.cc"],
    copts = COPTS,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "runtime_test",
    srcs = ["runtime_test.cc"],
    copts = COPTS,
    data = [
        "//test/test_data:abi_export.wasm",
        "//test/test_data:callback.wasm",
        "//test/test_data:trap.wasm",
    ],
    linkopts = LINKOPTS,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "context_test",
    srcs = ["context_test.cc"],
    copts = COPTS,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)
