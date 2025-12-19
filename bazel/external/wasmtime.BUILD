load("@rules_cc//cc:defs.bzl", "cc_library")
load("@rules_rust//rust:defs.bzl", "rust_static_library")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "wasmtime_lib",
    hdrs = [
        "crates/c-api/include/wasm.h",
        "crates/c-api/include/wasmtime.h",
        "crates/c-api/include/wasi.h",
        "crates/c-api/include/wasmtime/conf.h",
        "crates/c-api/include/wasmtime/config.h",
        "crates/c-api/include/wasmtime/async.h",
        "crates/c-api/include/wasmtime/error.h",
        "crates/c-api/include/wasmtime/engine.h",
        "crates/c-api/include/wasmtime/extern.h",
        "crates/c-api/include/wasmtime/module.h",
        "crates/c-api/include/wasmtime/sharedmemory.h",
        "crates/c-api/include/wasmtime/store.h",
        "crates/c-api/include/wasmtime/func.h",
        "crates/c-api/include/wasmtime/val.h",
        "crates/c-api/include/wasmtime/global.h",
        "crates/c-api/include/wasmtime/instance.h",
        "crates/c-api/include/wasmtime/linker.h",
        "crates/c-api/include/wasmtime/memory.h",
        "crates/c-api/include/wasmtime/profiling.h",
        "crates/c-api/include/wasmtime/table.h",
        "crates/c-api/include/wasmtime/trap.h",
    ],
    includes = ["crates/c-api/include"],
    deps = [
        ":rust_c_api",
        ":wasmtime_conf_hdr",
    ],
)

genrule(
    name = "prefixed_wasmtime_c_api_headers",
    srcs = [
        "crates/c-api/include/wasm.h",
    ],
    outs = [
        "crates/c-api/include/prefixed_wasm.h",
    ],
    cmd = """
        sed -e 's/\\ wasm_/\\ wasmtime_wasm_/g' \
            -e 's/\\*wasm_/\\*wasmtime_wasm_/g' \
            -e 's/(wasm_/(wasmtime_wasm_/g'     \
        $(<) >$@
        """,
)

genrule(
    name = "prefixed_wasmtime_c_api_lib",
    srcs = [
        ":rust_c_api",
    ],
    outs = [
        "prefixed_wasmtime_c_api.a",
    ],
    cmd = """
        for symbol in $$(nm -P $(<) 2>/dev/null | grep -E ^_?wasm_ | cut -d" " -f1); do
            echo $$symbol | sed -r 's/^(_?)(wasm_[a-z_]+)$$/\\1\\2 \\1wasmtime_\\2/' >>prefixed
        done
        # This should be OBJCOPY, but bazel-zig-cc doesn't define it.
        objcopy --redefine-syms=prefixed $(<) $@
        """,
    toolchains = ["@bazel_tools//tools/cpp:current_cc_toolchain"],
)

cc_library(
    name = "prefixed_wasmtime_lib",
    srcs = [
        ":prefixed_wasmtime_c_api_lib",
    ],
    hdrs = [
        ":prefixed_wasmtime_c_api_headers",
    ],
    linkstatic = 1,
)

rust_static_library(
    name = "rust_c_api",
    srcs = glob(["crates/c-api/src/**/*.rs"]),
    crate_features = ["cranelift", "async"],
    crate_root = "crates/c-api/src/lib.rs",
    edition = "2021",
    proc_macro_deps = [
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:wasmtime-c-api-macros",
    ],
    deps = [
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:anyhow",
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:env_logger",
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:once_cell",
        # buildifier: leave-alone
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:wasmtime",
        "@proxy_wasm_cpp_host//bazel/cargo/wasmtime/remote:futures",
    ],
)

genrule(
    name = "wasmtime_conf_hdr",
    outs = ["crates/c-api/include/wasmtime/conf.h"],
    cmd = """
    echo "

#ifndef WASMTIME_CONF_H
#define WASMTIME_CONF_H

#define WASMTIME_FEATURE_ASYNC
#define WASMTIME_FEATURE_CRANELIFT

#if defined(WASMTIME_FEATURE_CRANELIFT) || defined(WASMTIME_FEATURE_WINCH)
#define WASMTIME_FEATURE_COMPILER
#endif

#endif // WASMTIME_CONF_H" > $@
    """,
)

