# WebAssembly for Proxies (C++ host implementation)

This repo handles most of the generic wasm logic and provides an interface to the ABI which the common/wasm code implements.

## Build & Test

Make sure LLVM is setup in your environment. If not, run the following:

```
bazel/setup_clang.sh /lib/llvm-9
sudo apt install libc++-dev libc++abi-dev
```

Although proxy-wasm is supposed to support different proxies, it needs to be built from the https://github.com/envoyproxy/envoy repo root for now:

```
bazel build --override_repository=proxy_wasm_cpp_host=/path/to/proxy-wasm-cpp-host --config=libc++ //source/exe:envoy
```

## Troubleshoot

If the error mentions the .cache folder, try running the following:

```
bazel clean --expunge
```
