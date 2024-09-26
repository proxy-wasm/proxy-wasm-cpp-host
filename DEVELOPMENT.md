# How to Develop Proxy Wasm Cpp Host

## Generate compile commands

You could use the following commands to generate the `compile_commands.json` file:

```
BAZEL_BUILD_OPTION_LIST="--define=engine=multi" ./tools/gen_compdb.py --include_all //test/... //:lib
```

Then you could use clangd (or other tools the could parse `compile_commands.json`) to setup editors with cross reference, code completion.
