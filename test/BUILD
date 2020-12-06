load("@rules_cc//cc:defs.bzl", "cc_test")
load("@proxy_wasm_cpp_host//bazel:variables.bzl", "COPTS", "LINKOPTS")

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

cc_test(
    name = "shared_data",
    srcs = ["shared_data_test.cc"],
    copts = COPTS,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "shared_queue",
    srcs = ["shared_queue_test.cc"],
    copts = COPTS,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "vm_id_handle",
    srcs = ["vm_id_handle_test.cc"],
    copts = COPTS,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)
