load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "wamr_lib",
    cache_entries = {
        "WAMR_BUILD_INTERP": "1",
        "WAMR_BUILD_FAST_INTERP": "1",
        "WAMR_BUILD_JIT": "0",
        "WAMR_BUILD_LAZY_JIT": "0",
        "WAMR_BUILD_AOT": "0",
        "WAMR_BUILD_SIMD": "0",
        "WAMR_BUILD_MULTI_MODULE": "1",
        "WAMR_BUILD_LIBC_WASI": "0",
        "WAMR_BUILD_TAIL_CALL": "1",
    },
    generate_args = ["-GNinja"],
    lib_source = ":srcs",
    out_static_libs = ["libvmlib.a"],
)
