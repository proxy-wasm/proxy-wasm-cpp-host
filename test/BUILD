load("@proxy_wasm_cpp_host//bazel:select.bzl", "proxy_wasm_select_engine_null")
load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_test(
    name = "null_vm_test",
    srcs = proxy_wasm_select_engine_null(["null_vm_test.cc"]),
    linkstatic = 1,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "bytecode_util_test",
    srcs = ["bytecode_util_test.cc"],
    data = [
        "//test/test_data:abi_export.wasm",
    ],
    linkstatic = 1,
    deps = [
        ":utility_lib",
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "signature_util_test",
    srcs = ["signature_util_test.cc"],
    data = [
        "//test/test_data:abi_export.signed.with.key1.wasm",
        "//test/test_data:abi_export.signed.with.key2.wasm",
        "//test/test_data:abi_export.wasm",
    ],
    linkstatic = 1,
    # Test only when compiled to verify plugins.
    tags = ["manual"],
    deps = [
        ":utility_lib",
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "runtime_test",
    srcs = ["runtime_test.cc"],
    data = [
        "//test/test_data:callback.wasm",
        "//test/test_data:clock.wasm",
        "//test/test_data:infinite_loop.wasm",
        "//test/test_data:trap.wasm",
    ],
    linkstatic = 1,
    deps = [
        ":utility_lib",
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "exports_test",
    srcs = ["exports_test.cc"],
    data = [
        "//test/test_data:clock.wasm",
        "//test/test_data:env.wasm",
    ],
    linkstatic = 1,
    deps = [
        ":utility_lib",
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "wasm_test",
    srcs = ["wasm_test.cc"],
    data = [
        "//test/test_data:abi_export.wasm",
    ],
    linkstatic = 1,
    deps = [
        ":utility_lib",
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "shared_data",
    srcs = ["shared_data_test.cc"],
    linkstatic = 1,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "shared_queue",
    srcs = ["shared_queue_test.cc"],
    linkstatic = 1,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "vm_id_handle",
    srcs = ["vm_id_handle_test.cc"],
    linkstatic = 1,
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "wasm_vm_test",
    srcs = ["wasm_vm_test.cc"],
    data = [
        "//test/test_data:abi_export.wasm",
    ],
    linkstatic = 1,
    deps = [
        ":utility_lib",
        "//:lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "utility_lib",
    testonly = True,
    srcs = [
        "utility.cc",
        "utility.h",
    ],
    hdrs = ["utility.h"],
    deps = [
        "//:lib",
        "@com_google_googletest//:gtest",
    ],
)
