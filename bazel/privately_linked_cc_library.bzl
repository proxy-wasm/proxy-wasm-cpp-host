# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Build definition for C++ libraries with privately linked dependencies."""

load("@rules_cc//cc:defs.bzl", "CcInfo", "cc_library")
load("@rules_cc//cc:find_cc_toolchain.bzl", "find_cc_toolchain", "use_cc_toolchain")

def _get_static_libs(targets):
    """Extracts static library files from a list of targets providing CcInfo."""
    linker_inputs = depset(transitive = [
        target[CcInfo].linking_context.linker_inputs
        for target in targets
        if CcInfo in target
    ])
    return [
        lib.pic_static_library or lib.static_library
        for input in linker_inputs.to_list()
        for lib in input.libraries
        if lib.pic_static_library or lib.static_library
    ]

def _privatize_symbols_impl(ctx):
    cc_toolchain = find_cc_toolchain(ctx)
    is_macos = ctx.target_platform_has_constraint(
        ctx.attr._macos_constraint[platform_common.ConstraintValueInfo],
    )

    unprivatized_libs = [
        lib.pic_static_library or lib.static_library
        for src in ctx.attr.srcs
        for input in src[CcInfo].linking_context.linker_inputs.to_list()
        if input.owner == src.label
        for lib in input.libraries
        if lib.pic_static_library or lib.static_library
    ]
    private_libs = _get_static_libs(ctx.attr.private_deps)
    all_libs = unprivatized_libs + private_libs

    out_o = ctx.actions.declare_file(ctx.label.name + ".o")

    if is_macos:
        force_load_flags = " ".join([
            "-Wl,-force_load,{}".format(f.path)
            for f in all_libs
        ])
        exported_symbol_flags = " ".join([
            "-Wl,-exported_symbol,'{}'".format(
                pattern if pattern.startswith("*") else "_" + pattern,
            )
            for pattern in ctx.attr.public_symbols
        ])
        command = """
            set -e
            {cc} -r -nostdlib {force_load_flags} {exported_symbol_flags} -o {out}
        """.format(
            cc = cc_toolchain.compiler_executable,
            force_load_flags = force_load_flags,
            exported_symbol_flags = exported_symbol_flags,
            out = out_o.path,
        )
    else:
        # Under Clang ASan, ___asan_globals_registered is emitted as an
        # STB_GLOBAL STV_HIDDEN SHN_COMMON symbol. Demoting a SHN_COMMON
        # symbol to STB_LOCAL causes ld.lld to fail with an invalid relocation
        # against an absolute symbol, and ld.lld -r ignores -d.
        keep_global_patterns = ctx.attr.public_symbols + ["___asan_globals_registered"]
        keep_global_flags = " ".join([
            "-G '{}'".format(pattern)
            for pattern in keep_global_patterns
        ])
        command = """
            set -e
            {cc} -r -nostdlib -Wl,--whole-archive {libs} -Wl,--no-whole-archive -o {out}.tmp
            {objcopy} -w {keep_global_flags} {out}.tmp {out}
            rm -f {out}.tmp
        """.format(
            cc = cc_toolchain.compiler_executable,
            objcopy = cc_toolchain.objcopy_executable,
            libs = " ".join([f.path for f in all_libs]),
            keep_global_flags = keep_global_flags,
            out = out_o.path,
        )

    ctx.actions.run_shell(
        inputs = depset(all_libs, transitive = [cc_toolchain.all_files]),
        outputs = [out_o],
        command = command,
        use_default_shell_env = True,
        mnemonic = "HidePrivateSymbols",
        progress_message = "Hiding private symbols for %{label}",
    )

    return [DefaultInfo(files = depset([out_o]))]

_privatize_symbols = rule(
    implementation = _privatize_symbols_impl,
    attrs = {
        "private_deps": attr.label_list(mandatory = True, providers = [CcInfo]),
        "public_symbols": attr.string_list(mandatory = True),
        "srcs": attr.label_list(mandatory = True, providers = [CcInfo]),
        "_cc_toolchain": attr.label(default = Label("@bazel_tools//tools/cpp:current_cc_toolchain")),
        "_macos_constraint": attr.label(default = Label("@platforms//os:macos")),
    },
    fragments = ["cpp"],
    toolchains = use_cc_toolchain(),
)

def privately_linked_cc_library(
        name,
        srcs = [],
        hdrs = [],
        copts = [],
        defines = [],
        private_deps = [],
        deps = [],
        public_symbols = [],
        linkopts = [],
        linkstatic = True,
        visibility = None,
        **kwargs):
    """Defines a cc_library whose private_deps are statically linked and localized.

    Partially links the compiled library sources (`srcs`) with all static archives
    from `private_deps` into a single relocatable object file and localizes
    non-public symbols (`objcopy -w -G` on ELF, `ld -r -exported_symbol` on Mach-O)
    so that only symbols matching `public_symbols` remain global to the linker.
    All other defined symbols from `srcs` and `private_deps` become local.

    WARNING: Any symbols from `private_deps` (including transitive dependencies of
    `private_deps`) will be linked privately into this target's object file and
    therefore duplicated in the final binary if also linked elsewhere. Care should
    be exercised to ensure that shared libraries (e.g., Abseil, BoringSSL, Protobuf)
    are not linked privately via `private_deps`, and are instead passed via `deps`.

    Args:
        name: Name of the target library.
        srcs: Source files compiled into the library.
        hdrs: Public header files for the library.
        copts: Compiler options for compiling `srcs`.
        defines: Preprocessor definitions for compiling `srcs` and downstream consumers.
        private_deps: Dependencies to privately link and hide inside this library.
        deps: Shared dependencies linked normally by downstream consumers.
        public_symbols: List of symbol glob strings (e.g. `["*proxy_wasm*"]`) to keep
            globally visible to the linker.
        linkopts: Linker options propagated to downstream consumers.
        linkstatic: Whether to restrict the library to static linking (defaults to True).
        visibility: Target visibility for the public library.
        **kwargs: Additional arguments forwarded to the underlying rules.
    """
    cc_library(
        name = name + "_unprivatized_lib",
        srcs = srcs,
        hdrs = hdrs,
        copts = copts,
        defines = defines,
        linkstatic = True,
        deps = deps + private_deps,
        visibility = ["//visibility:private"],
        **kwargs
    )

    _privatize_symbols(
        name = name + "_privatized_lib",
        srcs = [":" + name + "_unprivatized_lib"],
        private_deps = private_deps,
        public_symbols = public_symbols,
        visibility = ["//visibility:private"],
        **kwargs
    )

    cc_library(
        name = name,
        srcs = [":" + name + "_privatized_lib"],
        hdrs = hdrs,
        defines = defines,
        linkopts = linkopts,
        linkstatic = linkstatic,
        deps = deps,
        visibility = visibility,
        **kwargs
    )
