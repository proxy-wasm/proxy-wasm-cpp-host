# Development guidelines

## Generate compilation database

[JSON Compilation Database](https://clang.llvm.org/docs/JSONCompilationDatabase.html) files can be used by [clangd](https://clangd.llvm.org/) or similar tools to add source code cross-references and code completion functionality to editors.

The following command can be used to generate the `compile_commands.json` file:

```
BAZEL_BUILD_OPTION_LIST="--define=engine=multi" ./tools/gen_compilation_database.py --include_all //test/... //:lib
```

## Testing s390x locally

The s390x build-tools image used in our CI environment does not contain all the tools necessary to build test wasm modules. First, build those wasm modules in your native environment:

```bash
bazel build --verbose_failures --test_output=errors --config=clang --config=hermetic-llvm -c opt $(bazel query 'kind(was.*_rust_binary, //test/test_data/...)') $(bazel query 'kind(_optimized_wasm_cc_binary, //test/test_data/...)')

# Copy the built artifacts to the test_data dir.
cp bazel-bin/test/test_data/*.wasm test/test_data/

# Rewrite test/test_data/BUILD to use the pre-built wasm module artifacts
echo "package(default_visibility = [\"//visibility:public\"])" > test/test_data/BUILD
for i in $(cd test/test_data && ls -1 *.wasm | sed 's/\.wasm$//g'); do \
  echo "filegroup(name = \"$i\", srcs = [\"$i.wasm\"])" >> test/test_data/BUILD; \
done
# Rewrite test/BUILD to use the pre-built artifacts
sed 's/\.wasm//g' test/BUILD > test/BUILD.tmp && mv test/BUILD.tmp test/BUILD
```

s390x tests can be run locally using the build-tools docker images published in
this repo. An s390x QEMU emulator is required to be installed ([example
instructions](https://docs.gitlab.com/omnibus/development/s390x/#vm-provisioning)).
The following command will start an interactive session in an emulated s390x
environment with bazel installed. The command mounts $HOME inside the container
and assumes proxy-wasm-cpp-host is somewhere under $HOME.

```bash
docker run --env HOME=$HOME --env USER=$(id -un) --volume "$HOME:$HOME" --workdir $(pwd) --user $(id -u):$(id -g) --platform linux/s390x --interactive -t --env PS1="docker (s390x):" ghcr.io/proxy-wasm/build-tools:ubuntu-24.04-bazel-7.7.1 bash

# Set a useful prompt to remind yourself this shell is in s390x:
export PS1='docker@s390x:\[\033[01;34m\]\w\[\033[00m\] )> '
```

Inside this shell, you may now call out to bazel to run any build or test
command using the s390x environment. Note that `--config=hermetic-llvm` is not
supported for s390x.

```bash
bazel test --verbose_failures --test_output=errors --define engine=wasmtime --config=clang --test_timeout=1800 //test:runtime_test --test_filter=\*PassingValue\*
```


### Troubleshooting

If you experience errors relating to GCC_DUMMY_TOOLCHAIN, re-check that your
test/test_data/BUILD file contains only `filegroup()` rules pointing at
pre-build wasm modules.

If you get a "Required file not available" error message when executing a
toolchain with your host architecture in the file path, it is likely due to
bazel re-using a cache from your host environment. Please run `bazel clean
--expunge` and `bazel shutdown` in the docker container to clear bazel's cache
analysis cache.

