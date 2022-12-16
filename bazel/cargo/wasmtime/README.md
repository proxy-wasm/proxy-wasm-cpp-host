
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

## Resolve duplicates in lockfile

Currently due to an issue with raze (https://github.com/google/cargo-raze/issues/451) it
is likely that you will need to clear up any duplicates created in the lockfile.

Resolving this issue can be tricky as updates can generate a lot of change, but essentially
you will need to check the overall diff for any problematic files and check to see where new
dependencies have been added.

## Commit changes

```console
$ git add bazel/cargo/wasmtime
$ git commit ...
```
