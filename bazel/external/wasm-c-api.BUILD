load("@rules_cc//cc:defs.bzl", "cc_library")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

genrule(
    name = "wasmtime_prefixed_wasm_c_api_headers",
    srcs = [
        "include/wasm.h",
    ],
    outs = [
        "wasmtime/include/wasm.h",
    ],
    cmd = """
        sed -e 's/\\ wasm_/\\ wasmtime_wasm_/g' \
            -e 's/\\*wasm_/\\*wasmtime_wasm_/g' \
            -e 's/(wasm_/(wasmtime_wasm_/g'     \
        $(<) >$@
        """,
)

genrule(
    name = "wasmtime_prefixed_wasm_c_api_lib",
    srcs = [
        "@com_github_bytecodealliance_wasmtime//:rust_c_api",
    ],
    outs = [
        "wasmtime_prefixed_wasm_c_api.a",
    ],
    cmd = """
        for symbol in $$(nm -P $(<) 2>/dev/null | grep ^wasm_ | cut -d" " -f1); do
            echo "$$symbol wasmtime_$$symbol" >>prefixed
        done
        objcopy --redefine-syms=prefixed $(<) $@
        """,
)

cc_library(
    name = "wasmtime_lib",
    srcs = [
        ":wasmtime_prefixed_wasm_c_api_lib",
    ],
    hdrs = [
        ":wasmtime_prefixed_wasm_c_api_headers",
    ],
    linkstatic = 1,
)
