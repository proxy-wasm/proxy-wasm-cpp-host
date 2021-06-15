load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "wavm_lib",
    cache_entries = {
        "LLVM_DIR": "$EXT_BUILD_DEPS/copy_llvm/llvm/lib/cmake/llvm",
        "WAVM_ENABLE_STATIC_LINKING": "on",
        "WAVM_ENABLE_RELEASE_ASSERTS": "on",
        "WAVM_ENABLE_UNWIND": "on",
        # Workaround for the issue with statically linked libstdc++
        # using -l:libstdc++.a.
        "CMAKE_CXX_FLAGS": "-lstdc++ -Wno-unused-command-line-argument",
    },
    env_vars = {
        # Workaround for the -DDEBUG flag added in fastbuild on macOS,
        # which conflicts with DEBUG macro used in LLVM.
        "CFLAGS": "-UDEBUG",
        "CXXFLAGS": "-UDEBUG",
        "ASMFLAGS": "-UDEBUG",
    },
    generate_args = ["-GNinja"],
    lib_source = ":srcs",
    out_static_libs = [
        "libWAVM.a",
        "libWAVMUnwind.a",
    ],
    deps = ["@llvm//:llvm_lib"],
)
