# Development guidelines

## Generating compilation database

Use the Python wrapper `tools/gen_compilation_database.py` to produce a
`compile_commands.json` file for `clangd` or similar tools. This is the
recommended and reproducible approach.

See also:

- JSON Compilation Database: https://clang.llvm.org/docs/JSONCompilationDatabase.html
- clangd: https://clangd.llvm.org/

Generate for the whole workspace (recommended):

```bash
BAZEL_BUILD_OPTION_LIST="--define=engine=multi" python3 tools/gen_compilation_database.py
```

Generate for specific Bazel targets:

```bash
python3 tools/gen_compilation_database.py //test/... //:lib
```

Supported flags:

- `--include_external`
- `--include_genfiles`
- `--include_headers`
- `--include_all`
- `--system-clang`

Notes:

- The Python wrapper calls the external Hedron extractor (`@hedron_compile_commands//:refresh_all`) by
  default.
- If you pass positional targets the script creates a temporary Bazel package that defines a `refresh_compile_commands` target with those targets and runs it. This avoids forwarding targets directly to the extractor at runtime (which can cause `bazel aquery` parsing errors).
- If you prefer a workspace-local target, create it in your root `BUILD` and run it directly with `bazel run :refresh_compile_commands`.
- The extractor writes `compile_commands.json` at the repository root.

