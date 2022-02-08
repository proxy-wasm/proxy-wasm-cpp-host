load("@rules_cc//cc:defs.bzl", "cc_library")
load(
    "@proxy_wasm_cpp_host//bazel:select.bzl",
    "proxy_wasm_select_runtime_v8",
    "proxy_wasm_select_runtime_wamr",
    "proxy_wasm_select_runtime_wasmtime",
    "proxy_wasm_select_runtime_wavm",
)

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

exports_files(["LICENSE"])

cc_library(
    name = "wasm_vm_headers",
    hdrs = [
        "include/proxy-wasm/wasm_vm.h",
        "include/proxy-wasm/word.h",
    ],
    deps = [
        "@proxy_wasm_cpp_sdk//:common_lib",
    ],
)

cc_library(
    name = "headers",
    hdrs = [
        "include/proxy-wasm/context.h",
        "include/proxy-wasm/context_interface.h",
        "include/proxy-wasm/exports.h",
        "include/proxy-wasm/vm_id_handle.h",
        "include/proxy-wasm/wasm.h",
    ],
    deps = [
        ":wasm_vm_headers",
    ],
)

cc_library(
    name = "base_lib",
    srcs = [
        "src/bytecode_util.cc",
        "src/context.cc",
        "src/exports.cc",
        "src/shared_data.cc",
        "src/shared_data.h",
        "src/shared_queue.cc",
        "src/shared_queue.h",
        "src/signature_util.cc",
        "src/vm_id_handle.cc",
        "src/wasm.cc",
    ],
    hdrs = [
        "include/proxy-wasm/bytecode_util.h",
        "include/proxy-wasm/signature_util.h",
    ],
    linkopts = select({
        "//bazel:crypto_system": ["-lcrypto"],
        "//conditions:default": [],
    }),
    deps = [
        ":headers",
    ] + select({
        "//bazel:crypto_system": [],
        "//conditions:default": ["@boringssl//:crypto"],
    }),
)

cc_library(
    name = "null_lib",
    srcs = [
        "src/null/null.cc",
        "src/null/null_plugin.cc",
        "src/null/null_vm.cc",
    ],
    hdrs = [
        "include/proxy-wasm/null.h",
        "include/proxy-wasm/null_plugin.h",
        "include/proxy-wasm/null_vm.h",
        "include/proxy-wasm/null_vm_plugin.h",
        "include/proxy-wasm/wasm_api_impl.h",
    ],
    defines = ["PROXY_WASM_HAS_RUNTIME_NULL"],
    deps = [
        ":headers",
        "@com_google_protobuf//:protobuf_lite",
        "@proxy_wasm_cpp_sdk//:api_lib",
    ],
)

cc_library(
    name = "v8_lib",
    srcs = [
        "src/v8/v8.cc",
    ],
    hdrs = ["include/proxy-wasm/v8.h"],
    defines = ["PROXY_WASM_HAS_RUNTIME_V8"],
    deps = [
        ":wasm_vm_headers",
        "//external:wee8",
    ],
)

cc_library(
    name = "wamr_lib",
    srcs = [
        "src/common/types.h",
        "src/wamr/types.h",
        "src/wamr/wamr.cc",
    ],
    hdrs = ["include/proxy-wasm/wamr.h"],
    defines = ["PROXY_WASM_HAS_RUNTIME_WAMR"],
    deps = [
        ":wasm_vm_headers",
        "//external:wamr",
    ],
)

cc_library(
    name = "wasmtime_lib",
    srcs = [
        "src/common/types.h",
        "src/wasmtime/types.h",
        "src/wasmtime/wasmtime.cc",
    ],
    hdrs = ["include/proxy-wasm/wasmtime.h"],
    defines = ["PROXY_WASM_HAS_RUNTIME_WASMTIME"],
    deps = [
        ":wasm_vm_headers",
        "//external:wasmtime",
    ],
)

cc_library(
    name = "wavm_lib",
    srcs = [
        "src/wavm/wavm.cc",
    ],
    hdrs = ["include/proxy-wasm/wavm.h"],
    copts = [
        '-DWAVM_API=""',
        "-Wno-non-virtual-dtor",
        "-Wno-old-style-cast",
    ],
    defines = ["PROXY_WASM_HAS_RUNTIME_WAVM"],
    deps = [
        ":wasm_vm_headers",
        "//external:wavm",
    ],
)

cc_library(
    name = "lib",
    deps = [
        ":base_lib",
        ":null_lib",
    ] + proxy_wasm_select_runtime_v8(
        [":v8_lib"],
    ) + proxy_wasm_select_runtime_wamr(
        [":wamr_lib"],
    ) + proxy_wasm_select_runtime_wasmtime(
        [":wasmtime_lib"],
    ) + proxy_wasm_select_runtime_wavm(
        [":wavm_lib"],
    ),
)
