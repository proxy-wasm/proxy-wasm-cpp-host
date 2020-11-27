load("@rules_cc//cc:defs.bzl", "cc_test")
load(
    "@envoy//bazel:envoy_build_system.bzl",
    "envoy_cc_binary",
)

envoy_cc_binary(
    name = "envoy",
    repository = "@envoy",
    deps = [
        "@envoy//source/exe:envoy_main_entry_lib",
    ],
)

cc_test(
    name = "tmp_test",
    srcs = ["tmp.cc"],
    deps = [
        ":envoy",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)
