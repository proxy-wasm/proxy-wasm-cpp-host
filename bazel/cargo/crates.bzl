"""
@generated
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def raze_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__addr2line__0_14_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.14.0/download",
        type = "tar.gz",
        strip_prefix = "addr2line-0.14.0",
        build_file = Label("//bazel/cargo/remote:BUILD.addr2line-0.14.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__adler__0_2_3",
        url = "https://crates.io/api/v1/crates/adler/0.2.3/download",
        type = "tar.gz",
        strip_prefix = "adler-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.adler-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__aho_corasick__0_7_15",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.15/download",
        type = "tar.gz",
        strip_prefix = "aho-corasick-0.7.15",
        build_file = Label("//bazel/cargo/remote:BUILD.aho-corasick-0.7.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__anyhow__1_0_34",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.34/download",
        type = "tar.gz",
        strip_prefix = "anyhow-1.0.34",
        build_file = Label("//bazel/cargo/remote:BUILD.anyhow-1.0.34.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__arrayref__0_3_6",
        url = "https://crates.io/api/v1/crates/arrayref/0.3.6/download",
        type = "tar.gz",
        strip_prefix = "arrayref-0.3.6",
        build_file = Label("//bazel/cargo/remote:BUILD.arrayref-0.3.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__arrayvec__0_5_2",
        url = "https://crates.io/api/v1/crates/arrayvec/0.5.2/download",
        type = "tar.gz",
        strip_prefix = "arrayvec-0.5.2",
        build_file = Label("//bazel/cargo/remote:BUILD.arrayvec-0.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//bazel/cargo/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__backtrace__0_3_54",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.54/download",
        type = "tar.gz",
        strip_prefix = "backtrace-0.3.54",
        build_file = Label("//bazel/cargo/remote:BUILD.backtrace-0.3.54.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base64__0_12_3",
        url = "https://crates.io/api/v1/crates/base64/0.12.3/download",
        type = "tar.gz",
        strip_prefix = "base64-0.12.3",
        build_file = Label("//bazel/cargo/remote:BUILD.base64-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bincode__1_3_1",
        url = "https://crates.io/api/v1/crates/bincode/1.3.1/download",
        type = "tar.gz",
        strip_prefix = "bincode-1.3.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bincode-1.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__blake2b_simd__0_5_11",
        url = "https://crates.io/api/v1/crates/blake2b_simd/0.5.11/download",
        type = "tar.gz",
        strip_prefix = "blake2b_simd-0.5.11",
        build_file = Label("//bazel/cargo/remote:BUILD.blake2b_simd-0.5.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block_buffer__0_7_3",
        url = "https://crates.io/api/v1/crates/block-buffer/0.7.3/download",
        type = "tar.gz",
        strip_prefix = "block-buffer-0.7.3",
        build_file = Label("//bazel/cargo/remote:BUILD.block-buffer-0.7.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block_padding__0_1_5",
        url = "https://crates.io/api/v1/crates/block-padding/0.1.5/download",
        type = "tar.gz",
        strip_prefix = "block-padding-0.1.5",
        build_file = Label("//bazel/cargo/remote:BUILD.block-padding-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byte_tools__0_3_1",
        url = "https://crates.io/api/v1/crates/byte-tools/0.3.1/download",
        type = "tar.gz",
        strip_prefix = "byte-tools-0.3.1",
        build_file = Label("//bazel/cargo/remote:BUILD.byte-tools-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_3_4",
        url = "https://crates.io/api/v1/crates/byteorder/1.3.4/download",
        type = "tar.gz",
        strip_prefix = "byteorder-1.3.4",
        build_file = Label("//bazel/cargo/remote:BUILD.byteorder-1.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cc__1_0_61",
        url = "https://crates.io/api/v1/crates/cc/1.0.61/download",
        type = "tar.gz",
        strip_prefix = "cc-1.0.61",
        build_file = Label("//bazel/cargo/remote:BUILD.cc-1.0.61.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//bazel/cargo/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__constant_time_eq__0_1_5",
        url = "https://crates.io/api/v1/crates/constant_time_eq/0.1.5/download",
        type = "tar.gz",
        strip_prefix = "constant_time_eq-0.1.5",
        build_file = Label("//bazel/cargo/remote:BUILD.constant_time_eq-0.1.5.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__cranelift_bforest__0_67_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-bforest-0.67.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__cranelift_codegen__0_67_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-0.67.0.bazel"),
        init_submodules = False,
    )

    maybe(
        new_git_repository,
        name = "raze__cranelift_codegen_meta__0_67_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-meta-0.67.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__cranelift_codegen_shared__0_67_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-shared-0.67.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__cranelift_entity__0_67_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-entity-0.67.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__cranelift_frontend__0_67_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-frontend-0.67.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__cranelift_native__0_67_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-native-0.67.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__cranelift_wasm__0_67_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-wasm-0.67.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__crc32fast__1_2_1",
        url = "https://crates.io/api/v1/crates/crc32fast/1.2.1/download",
        type = "tar.gz",
        strip_prefix = "crc32fast-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.crc32fast-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_7_2",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.7.2/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-utils-0.7.2",
        build_file = Label("//bazel/cargo/remote:BUILD.crossbeam-utils-0.7.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__digest__0_8_1",
        url = "https://crates.io/api/v1/crates/digest/0.8.1/download",
        type = "tar.gz",
        strip_prefix = "digest-0.8.1",
        build_file = Label("//bazel/cargo/remote:BUILD.digest-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__directories__2_0_2",
        url = "https://crates.io/api/v1/crates/directories/2.0.2/download",
        type = "tar.gz",
        strip_prefix = "directories-2.0.2",
        build_file = Label("//bazel/cargo/remote:BUILD.directories-2.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__dirs_sys__0_3_5",
        url = "https://crates.io/api/v1/crates/dirs-sys/0.3.5/download",
        type = "tar.gz",
        strip_prefix = "dirs-sys-0.3.5",
        build_file = Label("//bazel/cargo/remote:BUILD.dirs-sys-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        strip_prefix = "either-1.6.1",
        build_file = Label("//bazel/cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__env_logger__0_7_1",
        url = "https://crates.io/api/v1/crates/env_logger/0.7.1/download",
        type = "tar.gz",
        strip_prefix = "env_logger-0.7.1",
        build_file = Label("//bazel/cargo/remote:BUILD.env_logger-0.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__errno__0_2_7",
        url = "https://crates.io/api/v1/crates/errno/0.2.7/download",
        type = "tar.gz",
        strip_prefix = "errno-0.2.7",
        build_file = Label("//bazel/cargo/remote:BUILD.errno-0.2.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__errno_dragonfly__0_1_1",
        url = "https://crates.io/api/v1/crates/errno-dragonfly/0.1.1/download",
        type = "tar.gz",
        strip_prefix = "errno-dragonfly-0.1.1",
        build_file = Label("//bazel/cargo/remote:BUILD.errno-dragonfly-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fake_simd__0_1_2",
        url = "https://crates.io/api/v1/crates/fake-simd/0.1.2/download",
        type = "tar.gz",
        strip_prefix = "fake-simd-0.1.2",
        build_file = Label("//bazel/cargo/remote:BUILD.fake-simd-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fallible_iterator__0_2_0",
        url = "https://crates.io/api/v1/crates/fallible-iterator/0.2.0/download",
        type = "tar.gz",
        strip_prefix = "fallible-iterator-0.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.fallible-iterator-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__file_per_thread_logger__0_1_4",
        url = "https://crates.io/api/v1/crates/file-per-thread-logger/0.1.4/download",
        type = "tar.gz",
        strip_prefix = "file-per-thread-logger-0.1.4",
        build_file = Label("//bazel/cargo/remote:BUILD.file-per-thread-logger-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gcc__0_3_55",
        url = "https://crates.io/api/v1/crates/gcc/0.3.55/download",
        type = "tar.gz",
        strip_prefix = "gcc-0.3.55",
        build_file = Label("//bazel/cargo/remote:BUILD.gcc-0.3.55.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__generic_array__0_12_3",
        url = "https://crates.io/api/v1/crates/generic-array/0.12.3/download",
        type = "tar.gz",
        strip_prefix = "generic-array-0.12.3",
        build_file = Label("//bazel/cargo/remote:BUILD.generic-array-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_1_15",
        url = "https://crates.io/api/v1/crates/getrandom/0.1.15/download",
        type = "tar.gz",
        strip_prefix = "getrandom-0.1.15",
        build_file = Label("//bazel/cargo/remote:BUILD.getrandom-0.1.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gimli__0_22_0",
        url = "https://crates.io/api/v1/crates/gimli/0.22.0/download",
        type = "tar.gz",
        strip_prefix = "gimli-0.22.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.22.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gimli__0_23_0",
        url = "https://crates.io/api/v1/crates/gimli/0.23.0/download",
        type = "tar.gz",
        strip_prefix = "gimli-0.23.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.23.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__glob__0_3_0",
        url = "https://crates.io/api/v1/crates/glob/0.3.0/download",
        type = "tar.gz",
        strip_prefix = "glob-0.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.glob-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_17",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.17/download",
        type = "tar.gz",
        strip_prefix = "hermit-abi-0.1.17",
        build_file = Label("//bazel/cargo/remote:BUILD.hermit-abi-0.1.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__humantime__1_3_0",
        url = "https://crates.io/api/v1/crates/humantime/1.3.0/download",
        type = "tar.gz",
        strip_prefix = "humantime-1.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.humantime-1.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__indexmap__1_1_0",
        url = "https://crates.io/api/v1/crates/indexmap/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "indexmap-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.indexmap-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itertools__0_9_0",
        url = "https://crates.io/api/v1/crates/itertools/0.9.0/download",
        type = "tar.gz",
        strip_prefix = "itertools-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.itertools-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__jobserver__0_1_21",
        url = "https://crates.io/api/v1/crates/jobserver/0.1.21/download",
        type = "tar.gz",
        strip_prefix = "jobserver-0.1.21",
        build_file = Label("//bazel/cargo/remote:BUILD.jobserver-0.1.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__leb128__0_2_4",
        url = "https://crates.io/api/v1/crates/leb128/0.2.4/download",
        type = "tar.gz",
        strip_prefix = "leb128-0.2.4",
        build_file = Label("//bazel/cargo/remote:BUILD.leb128-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_80",
        url = "https://crates.io/api/v1/crates/libc/0.2.80/download",
        type = "tar.gz",
        strip_prefix = "libc-0.2.80",
        build_file = Label("//bazel/cargo/remote:BUILD.libc-0.2.80.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_11",
        url = "https://crates.io/api/v1/crates/log/0.4.11/download",
        type = "tar.gz",
        strip_prefix = "log-0.4.11",
        build_file = Label("//bazel/cargo/remote:BUILD.log-0.4.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mach__0_3_2",
        url = "https://crates.io/api/v1/crates/mach/0.3.2/download",
        type = "tar.gz",
        strip_prefix = "mach-0.3.2",
        build_file = Label("//bazel/cargo/remote:BUILD.mach-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_3_4",
        url = "https://crates.io/api/v1/crates/memchr/2.3.4/download",
        type = "tar.gz",
        strip_prefix = "memchr-2.3.4",
        build_file = Label("//bazel/cargo/remote:BUILD.memchr-2.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memoffset__0_5_6",
        url = "https://crates.io/api/v1/crates/memoffset/0.5.6/download",
        type = "tar.gz",
        strip_prefix = "memoffset-0.5.6",
        build_file = Label("//bazel/cargo/remote:BUILD.memoffset-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__miniz_oxide__0_4_3",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.4.3/download",
        type = "tar.gz",
        strip_prefix = "miniz_oxide-0.4.3",
        build_file = Label("//bazel/cargo/remote:BUILD.miniz_oxide-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__more_asserts__0_2_1",
        url = "https://crates.io/api/v1/crates/more-asserts/0.2.1/download",
        type = "tar.gz",
        strip_prefix = "more-asserts-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.more-asserts-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__object__0_21_1",
        url = "https://crates.io/api/v1/crates/object/0.21.1/download",
        type = "tar.gz",
        strip_prefix = "object-0.21.1",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.21.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__object__0_22_0",
        url = "https://crates.io/api/v1/crates/object/0.22.0/download",
        type = "tar.gz",
        strip_prefix = "object-0.22.0",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.22.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__once_cell__1_4_1",
        url = "https://crates.io/api/v1/crates/once_cell/1.4.1/download",
        type = "tar.gz",
        strip_prefix = "once_cell-1.4.1",
        build_file = Label("//bazel/cargo/remote:BUILD.once_cell-1.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__opaque_debug__0_2_3",
        url = "https://crates.io/api/v1/crates/opaque-debug/0.2.3/download",
        type = "tar.gz",
        strip_prefix = "opaque-debug-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.opaque-debug-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_24",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.24/download",
        type = "tar.gz",
        strip_prefix = "proc-macro2-1.0.24",
        build_file = Label("//bazel/cargo/remote:BUILD.proc-macro2-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quick_error__1_2_3",
        url = "https://crates.io/api/v1/crates/quick-error/1.2.3/download",
        type = "tar.gz",
        strip_prefix = "quick-error-1.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.quick-error-1.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_7",
        url = "https://crates.io/api/v1/crates/quote/1.0.7/download",
        type = "tar.gz",
        strip_prefix = "quote-1.0.7",
        build_file = Label("//bazel/cargo/remote:BUILD.quote-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__raw_cpuid__7_0_3",
        url = "https://crates.io/api/v1/crates/raw-cpuid/7.0.3/download",
        type = "tar.gz",
        strip_prefix = "raw-cpuid-7.0.3",
        build_file = Label("//bazel/cargo/remote:BUILD.raw-cpuid-7.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_syscall__0_1_57",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.1.57/download",
        type = "tar.gz",
        strip_prefix = "redox_syscall-0.1.57",
        build_file = Label("//bazel/cargo/remote:BUILD.redox_syscall-0.1.57.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_users__0_3_5",
        url = "https://crates.io/api/v1/crates/redox_users/0.3.5/download",
        type = "tar.gz",
        strip_prefix = "redox_users-0.3.5",
        build_file = Label("//bazel/cargo/remote:BUILD.redox_users-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regalloc__0_0_30",
        url = "https://crates.io/api/v1/crates/regalloc/0.0.30/download",
        type = "tar.gz",
        strip_prefix = "regalloc-0.0.30",
        build_file = Label("//bazel/cargo/remote:BUILD.regalloc-0.0.30.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex__1_4_2",
        url = "https://crates.io/api/v1/crates/regex/1.4.2/download",
        type = "tar.gz",
        strip_prefix = "regex-1.4.2",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_syntax__0_6_21",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.21/download",
        type = "tar.gz",
        strip_prefix = "regex-syntax-0.6.21",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-syntax-0.6.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__region__2_2_0",
        url = "https://crates.io/api/v1/crates/region/2.2.0/download",
        type = "tar.gz",
        strip_prefix = "region-2.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.region-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rust_argon2__0_8_2",
        url = "https://crates.io/api/v1/crates/rust-argon2/0.8.2/download",
        type = "tar.gz",
        strip_prefix = "rust-argon2-0.8.2",
        build_file = Label("//bazel/cargo/remote:BUILD.rust-argon2-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_demangle__0_1_18",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.18/download",
        type = "tar.gz",
        strip_prefix = "rustc-demangle-0.1.18",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-demangle-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_hash__1_1_0",
        url = "https://crates.io/api/v1/crates/rustc-hash/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "rustc-hash-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-hash-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scroll__0_10_2",
        url = "https://crates.io/api/v1/crates/scroll/0.10.2/download",
        type = "tar.gz",
        strip_prefix = "scroll-0.10.2",
        build_file = Label("//bazel/cargo/remote:BUILD.scroll-0.10.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scroll_derive__0_10_4",
        url = "https://crates.io/api/v1/crates/scroll_derive/0.10.4/download",
        type = "tar.gz",
        strip_prefix = "scroll_derive-0.10.4",
        build_file = Label("//bazel/cargo/remote:BUILD.scroll_derive-0.10.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_117",
        url = "https://crates.io/api/v1/crates/serde/1.0.117/download",
        type = "tar.gz",
        strip_prefix = "serde-1.0.117",
        build_file = Label("//bazel/cargo/remote:BUILD.serde-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_117",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.117/download",
        type = "tar.gz",
        strip_prefix = "serde_derive-1.0.117",
        build_file = Label("//bazel/cargo/remote:BUILD.serde_derive-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sha2__0_8_2",
        url = "https://crates.io/api/v1/crates/sha2/0.8.2/download",
        type = "tar.gz",
        strip_prefix = "sha2-0.8.2",
        build_file = Label("//bazel/cargo/remote:BUILD.sha2-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_4_2",
        url = "https://crates.io/api/v1/crates/smallvec/1.4.2/download",
        type = "tar.gz",
        strip_prefix = "smallvec-1.4.2",
        build_file = Label("//bazel/cargo/remote:BUILD.smallvec-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stable_deref_trait__1_2_0",
        url = "https://crates.io/api/v1/crates/stable_deref_trait/1.2.0/download",
        type = "tar.gz",
        strip_prefix = "stable_deref_trait-1.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.stable_deref_trait-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_48",
        url = "https://crates.io/api/v1/crates/syn/1.0.48/download",
        type = "tar.gz",
        strip_prefix = "syn-1.0.48",
        build_file = Label("//bazel/cargo/remote:BUILD.syn-1.0.48.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__target_lexicon__0_11_1",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.11.1/download",
        type = "tar.gz",
        strip_prefix = "target-lexicon-0.11.1",
        build_file = Label("//bazel/cargo/remote:BUILD.target-lexicon-0.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__termcolor__1_1_0",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "termcolor-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.termcolor-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror__1_0_22",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.22/download",
        type = "tar.gz",
        strip_prefix = "thiserror-1.0.22",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-1.0.22.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror_impl__1_0_22",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.22/download",
        type = "tar.gz",
        strip_prefix = "thiserror-impl-1.0.22",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-impl-1.0.22.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thread_local__1_0_1",
        url = "https://crates.io/api/v1/crates/thread_local/1.0.1/download",
        type = "tar.gz",
        strip_prefix = "thread_local-1.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.thread_local-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__toml__0_5_7",
        url = "https://crates.io/api/v1/crates/toml/0.5.7/download",
        type = "tar.gz",
        strip_prefix = "toml-0.5.7",
        build_file = Label("//bazel/cargo/remote:BUILD.toml-0.5.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typenum__1_12_0",
        url = "https://crates.io/api/v1/crates/typenum/1.12.0/download",
        type = "tar.gz",
        strip_prefix = "typenum-1.12.0",
        build_file = Label("//bazel/cargo/remote:BUILD.typenum-1.12.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_2_1",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.1/download",
        type = "tar.gz",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.unicode-xid-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.9.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasi-0.9.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmparser__0_57_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.57.0/download",
        type = "tar.gz",
        strip_prefix = "wasmparser-0.57.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.57.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmparser__0_59_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.59.0/download",
        type = "tar.gz",
        strip_prefix = "wasmparser-0.59.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.59.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-0.20.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_cache__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-cache-0.20.0.bazel"),
        init_submodules = True,
        patches = [
            "//bazel/external:wasmtime-0.20.0-fix-git-rev.diff",
        ],
        patch_args = [
            "-p1",
        ],
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_cranelift__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-cranelift-0.20.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_debug__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-debug-0.20.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_environ__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-environ-0.20.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_jit__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-jit-0.20.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_obj__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-obj-0.20.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_profiling__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-profiling-0.20.0.bazel"),
        init_submodules = True,
    )

    maybe(
        new_git_repository,
        name = "raze__wasmtime_runtime__0_20_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "a04001211cad679a4322dd70787050eee713fc89",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-runtime-0.20.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "raze__wast__26_0_1",
        url = "https://crates.io/api/v1/crates/wast/26.0.1/download",
        type = "tar.gz",
        strip_prefix = "wast-26.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wast-26.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wat__1_0_27",
        url = "https://crates.io/api/v1/crates/wat/1.0.27/download",
        type = "tar.gz",
        strip_prefix = "wat-1.0.27",
        build_file = Label("//bazel/cargo/remote:BUILD.wat-1.0.27.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__zstd__0_5_3_zstd_1_4_5",
        url = "https://crates.io/api/v1/crates/zstd/0.5.3+zstd.1.4.5/download",
        type = "tar.gz",
        strip_prefix = "zstd-0.5.3+zstd.1.4.5",
        build_file = Label("//bazel/cargo/remote:BUILD.zstd-0.5.3+zstd.1.4.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__zstd_safe__2_0_5_zstd_1_4_5",
        url = "https://crates.io/api/v1/crates/zstd-safe/2.0.5+zstd.1.4.5/download",
        type = "tar.gz",
        strip_prefix = "zstd-safe-2.0.5+zstd.1.4.5",
        build_file = Label("//bazel/cargo/remote:BUILD.zstd-safe-2.0.5+zstd.1.4.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__zstd_sys__1_4_17_zstd_1_4_5",
        url = "https://crates.io/api/v1/crates/zstd-sys/1.4.17+zstd.1.4.5/download",
        type = "tar.gz",
        strip_prefix = "zstd-sys-1.4.17+zstd.1.4.5",
        build_file = Label("//bazel/cargo/remote:BUILD.zstd-sys-1.4.17+zstd.1.4.5.bazel"),
    )
