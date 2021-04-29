def proxy_wasm_select_wasm_runtime_v8(xs):
    return select({
        # TODO(@mathetake): enable V8 build.
        # "@proxy_wasm_cpp_host//bazel:wasm_runtime_v8": xs,
        "//conditions:default": [],
    })

def proxy_wasm_select_wasm_runtime_wavm(xs):
    return select({
        # TODO(@mathetake): enable WAVM build.
        # "@envoy//bazel:wasm_runtime_wavm": xs,
        "//conditions:default": [],
    })

def proxy_wasm_select_wasm_runtime_wasmtime(xs):
    return select({
        "@proxy_wasm_cpp_host//bazel:wasm_runtime_wasmtime": xs,
        "//conditions:default": [],
    })
