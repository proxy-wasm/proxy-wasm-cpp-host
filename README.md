# WebAssembly for Proxies (C++ host implementation)


This repo handles most of the generic wasm logic and provides an interface to the ABI which the common/wasm code implements.

## Build & Test

Uses Bazel. Make sure LLVM is setup in your environment.

Although proxy-wasm is supposed to support different proxies, it mostly works with the Envoy Proxy https://github.com/envoyproxy/envoy for now. To build code changes with Envoy, run the following from Envoy repo root:

```
bazel build --override_repository=proxy_wasm_cpp_host=/path/to/proxy-wasm-cpp-host --config=libc++ //source/exe:envoy
```

## Contribute

Requires DCO signoff:

```
git commit --signoff
```

## Troubleshoot

If the error mentions the .cache folder, try running the following:

```
bazel clean --expunge
```
