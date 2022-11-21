
# Updating `wasmtime`

Projects depending upon `proxy-wasm-cpp-host` and `wasmtime` should
ensure that the `wasmtime` dependency here is updated whenever updating
`proxy-wasm-cpp-host`.

## Install `rust`

Ensure you have the latest version of rust.

```console
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$ rustup update
```

## Install `cargo-raze`

```console
$ cargo install cargo-raze --version 0.14.1.
```

## Generate lockfile

```console
$ cd bazel/cargo/wasmtime
$ cargo raze --generate-lockfile
$ cd ../..
```

## Commit changes

```console
$ git add bazel/cargo/wasmtime
$ git commit ...
```
