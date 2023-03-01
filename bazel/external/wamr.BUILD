load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "wamr_lib",
    generate_args = [
        "-DWAMR_BUILD_LIBC_WASI=0",
        "-DWAMR_BUILD_MULTI_MODULE=0",
        "-DWAMR_BUILD_TAIL_CALL=1",
        "-DWAMR_DISABLE_HW_BOUND_CHECK=0",
        "-DWAMR_DISABLE_STACK_HW_BOUND_CHECK=1",
        "-GNinja",
    ] + select({
        "@proxy_wasm_cpp_host//bazel:engine_wamr_jit": [
            "-DLLVM_DIR=$EXT_BUILD_DEPS/copy_llvm-15_0_7/llvm/lib/cmake/llvm",
            "-DWAMR_BUILD_AOT=1",
            "-DWAMR_BUILD_FAST_INTERP=0",
            "-DWAMR_BUILD_INTERP=0",
            "-DWAMR_BUILD_JIT=1",
            "-DWAMR_BUILD_SIMD=1",
        ],
        "//conditions:default": [
            "-DWAMR_BUILD_AOT=0",
            "-DWAMR_BUILD_FAST_INTERP=1",
            "-DWAMR_BUILD_INTERP=1",
            "-DWAMR_BUILD_JIT=0",
            "-DWAMR_BUILD_SIMD=0",
        ],
    }),
    lib_source = ":srcs",
    linkopts = select({
        "@proxy_wasm_cpp_host//bazel:engine_wamr_jit": ["-ldl"],
        "//conditions:default": [],
    }),
    out_static_libs = ["libvmlib.a"],
    deps = select({
        "@proxy_wasm_cpp_host//bazel:engine_wamr_jit": ["@llvm-15_0_7//:llvm_wamr_lib"],
        "//conditions:default": [],
    }),
)
