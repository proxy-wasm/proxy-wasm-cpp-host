# See bazel/README.md for details on how this system works.
EXTENSIONS = {
    #
    # Access loggers
    #
    "envoy.access_loggers.wasm": "//source/extensions/access_loggers/wasm:config",

    #
    # WASM
    #
    "envoy.bootstrap.wasm": "//source/extensions/bootstrap/wasm:config",

    #
    # HTTP filters
    #
    "envoy.filters.http.router": "//source/extensions/filters/http/router:config",
    "envoy.filters.http.wasm": "//source/extensions/filters/http/wasm:config",

    #
    # Network filters
    #
    "envoy.filters.network.http_connection_manager": "//source/extensions/filters/network/http_connection_manager:config",
    "envoy.filters.network.tcp_proxy": "//source/extensions/filters/network/tcp_proxy:config",
    "envoy.filters.network.wasm": "//source/extensions/filters/network/wasm:config",

    #
    # Stat sinks
    #
    "envoy.stat_sinks.wasm": "//source/extensions/stat_sinks/wasm:config",

    #
    # WebAssembly runtimes
    #
    "envoy.wasm.runtime.null": "//source/extensions/wasm_runtime/null:config",
    "envoy.wasm.runtime.v8": "//source/extensions/wasm_runtime/v8:config",
    "envoy.wasm.runtime.wavm": "//source/extensions/wasm_runtime/wavm:config",
    "envoy.wasm.runtime.wasmtime": "//source/extensions/wasm_runtime/wasmtime:config",
}

# These can be changed to ["//visibility:public"], for  downstream builds which
# need to directly reference Envoy extensions.
EXTENSION_CONFIG_VISIBILITY = ["//:extension_config"]
EXTENSION_PACKAGE_VISIBILITY = ["//:extension_library"]
