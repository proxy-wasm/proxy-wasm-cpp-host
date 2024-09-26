# WebAssembly for Proxies (C++ host implementation)

## Development

You could use the following commands to generate the `compile_commands.json` file:

```
BAZEL_BUILD_OPTION_LIST="--define=engine=multi" ./tools/gen_compdb.py --include_all //test/... //:lib
```
