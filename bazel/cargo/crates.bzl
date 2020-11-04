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
        name = "raze__addr2line__0_13_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.13.0/download",
        type = "tar.gz",
        sha256 = "1b6a2d3371669ab3ca9797670853d61402b03d0b4b9ebf33d677dfa720203072",
        strip_prefix = "addr2line-0.13.0",
        build_file = Label("//bazel/cargo/remote:BUILD.addr2line-0.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__adler__0_2_3",
        url = "https://crates.io/api/v1/crates/adler/0.2.3/download",
        type = "tar.gz",
        sha256 = "ee2a4ec343196209d6594e19543ae87a39f96d5534d7174822a3ad825dd6ed7e",
        strip_prefix = "adler-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.adler-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__aho_corasick__0_7_14",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.14/download",
        type = "tar.gz",
        sha256 = "b476ce7103678b0c6d3d395dbbae31d48ff910bd28be979ba5d48c6351131d0d",
        strip_prefix = "aho-corasick-0.7.14",
        build_file = Label("//bazel/cargo/remote:BUILD.aho-corasick-0.7.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__anyhow__1_0_33",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.33/download",
        type = "tar.gz",
        sha256 = "a1fd36ffbb1fb7c834eac128ea8d0e310c5aeb635548f9d58861e1308d46e71c",
        strip_prefix = "anyhow-1.0.33",
        build_file = Label("//bazel/cargo/remote:BUILD.anyhow-1.0.33.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__arrayref__0_3_6",
        url = "https://crates.io/api/v1/crates/arrayref/0.3.6/download",
        type = "tar.gz",
        sha256 = "a4c527152e37cf757a3f78aae5a06fbeefdb07ccc535c980a3208ee3060dd544",
        strip_prefix = "arrayref-0.3.6",
        build_file = Label("//bazel/cargo/remote:BUILD.arrayref-0.3.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__arrayvec__0_5_2",
        url = "https://crates.io/api/v1/crates/arrayvec/0.5.2/download",
        type = "tar.gz",
        sha256 = "23b62fc65de8e4e7f52534fb52b0f3ed04746ae267519eef2a83941e8085068b",
        strip_prefix = "arrayvec-0.5.2",
        build_file = Label("//bazel/cargo/remote:BUILD.arrayvec-0.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//bazel/cargo/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__backtrace__0_3_53",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.53/download",
        type = "tar.gz",
        sha256 = "707b586e0e2f247cbde68cdd2c3ce69ea7b7be43e1c5b426e37c9319c4b9838e",
        strip_prefix = "backtrace-0.3.53",
        build_file = Label("//bazel/cargo/remote:BUILD.backtrace-0.3.53.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base64__0_12_3",
        url = "https://crates.io/api/v1/crates/base64/0.12.3/download",
        type = "tar.gz",
        sha256 = "3441f0f7b02788e948e47f457ca01f1d7e6d92c693bc132c22b087d3141c03ff",
        strip_prefix = "base64-0.12.3",
        build_file = Label("//bazel/cargo/remote:BUILD.base64-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bincode__1_3_1",
        url = "https://crates.io/api/v1/crates/bincode/1.3.1/download",
        type = "tar.gz",
        sha256 = "f30d3a39baa26f9651f17b375061f3233dde33424a8b72b0dbe93a68a0bc896d",
        strip_prefix = "bincode-1.3.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bincode-1.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__blake2b_simd__0_5_10",
        url = "https://crates.io/api/v1/crates/blake2b_simd/0.5.10/download",
        type = "tar.gz",
        sha256 = "d8fb2d74254a3a0b5cac33ac9f8ed0e44aa50378d9dbb2e5d83bd21ed1dc2c8a",
        strip_prefix = "blake2b_simd-0.5.10",
        build_file = Label("//bazel/cargo/remote:BUILD.blake2b_simd-0.5.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block_buffer__0_7_3",
        url = "https://crates.io/api/v1/crates/block-buffer/0.7.3/download",
        type = "tar.gz",
        sha256 = "c0940dc441f31689269e10ac70eb1002a3a1d3ad1390e030043662eb7fe4688b",
        strip_prefix = "block-buffer-0.7.3",
        build_file = Label("//bazel/cargo/remote:BUILD.block-buffer-0.7.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__block_padding__0_1_5",
        url = "https://crates.io/api/v1/crates/block-padding/0.1.5/download",
        type = "tar.gz",
        sha256 = "fa79dedbb091f449f1f39e53edf88d5dbe95f895dae6135a8d7b881fb5af73f5",
        strip_prefix = "block-padding-0.1.5",
        build_file = Label("//bazel/cargo/remote:BUILD.block-padding-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byte_tools__0_3_1",
        url = "https://crates.io/api/v1/crates/byte-tools/0.3.1/download",
        type = "tar.gz",
        sha256 = "e3b5ca7a04898ad4bcd41c90c5285445ff5b791899bb1b0abdd2a2aa791211d7",
        strip_prefix = "byte-tools-0.3.1",
        build_file = Label("//bazel/cargo/remote:BUILD.byte-tools-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_3_4",
        url = "https://crates.io/api/v1/crates/byteorder/1.3.4/download",
        type = "tar.gz",
        sha256 = "08c48aae112d48ed9f069b33538ea9e3e90aa263cfa3d1c24309612b1f7472de",
        strip_prefix = "byteorder-1.3.4",
        build_file = Label("//bazel/cargo/remote:BUILD.byteorder-1.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cc__1_0_61",
        url = "https://crates.io/api/v1/crates/cc/1.0.61/download",
        type = "tar.gz",
        sha256 = "ed67cbde08356238e75fc4656be4749481eeffb09e19f320a25237d5221c985d",
        strip_prefix = "cc-1.0.61",
        build_file = Label("//bazel/cargo/remote:BUILD.cc-1.0.61.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        sha256 = "4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//bazel/cargo/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__constant_time_eq__0_1_5",
        url = "https://crates.io/api/v1/crates/constant_time_eq/0.1.5/download",
        type = "tar.gz",
        sha256 = "245097e9a4535ee1e3e3931fcfcd55a796a44c643e8596ff6566d68f09b87bbc",
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
        sha256 = "81156fece84ab6a9f2afdb109ce3ae577e42b1228441eded99bd77f627953b1a",
        strip_prefix = "crc32fast-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.crc32fast-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_7_2",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.7.2/download",
        type = "tar.gz",
        sha256 = "c3c7c73a2d1e9fc0886a08b93e98eb643461230d5f1925e4036204d5f2e261a8",
        strip_prefix = "crossbeam-utils-0.7.2",
        build_file = Label("//bazel/cargo/remote:BUILD.crossbeam-utils-0.7.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__digest__0_8_1",
        url = "https://crates.io/api/v1/crates/digest/0.8.1/download",
        type = "tar.gz",
        sha256 = "f3d0c8c8752312f9713efd397ff63acb9f85585afbf179282e720e7704954dd5",
        strip_prefix = "digest-0.8.1",
        build_file = Label("//bazel/cargo/remote:BUILD.digest-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__directories__2_0_2",
        url = "https://crates.io/api/v1/crates/directories/2.0.2/download",
        type = "tar.gz",
        sha256 = "551a778172a450d7fc12e629ca3b0428d00f6afa9a43da1b630d54604e97371c",
        strip_prefix = "directories-2.0.2",
        build_file = Label("//bazel/cargo/remote:BUILD.directories-2.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__dirs_sys__0_3_5",
        url = "https://crates.io/api/v1/crates/dirs-sys/0.3.5/download",
        type = "tar.gz",
        sha256 = "8e93d7f5705de3e49895a2b5e0b8855a1c27f080192ae9c32a6432d50741a57a",
        strip_prefix = "dirs-sys-0.3.5",
        build_file = Label("//bazel/cargo/remote:BUILD.dirs-sys-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//bazel/cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__env_logger__0_7_1",
        url = "https://crates.io/api/v1/crates/env_logger/0.7.1/download",
        type = "tar.gz",
        sha256 = "44533bbbb3bb3c1fa17d9f2e4e38bbbaf8396ba82193c4cb1b6445d711445d36",
        strip_prefix = "env_logger-0.7.1",
        build_file = Label("//bazel/cargo/remote:BUILD.env_logger-0.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__errno__0_2_7",
        url = "https://crates.io/api/v1/crates/errno/0.2.7/download",
        type = "tar.gz",
        sha256 = "fa68f2fb9cae9d37c9b2b3584aba698a2e97f72d7aef7b9f7aa71d8b54ce46fe",
        strip_prefix = "errno-0.2.7",
        build_file = Label("//bazel/cargo/remote:BUILD.errno-0.2.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__errno_dragonfly__0_1_1",
        url = "https://crates.io/api/v1/crates/errno-dragonfly/0.1.1/download",
        type = "tar.gz",
        sha256 = "14ca354e36190500e1e1fb267c647932382b54053c50b14970856c0b00a35067",
        strip_prefix = "errno-dragonfly-0.1.1",
        build_file = Label("//bazel/cargo/remote:BUILD.errno-dragonfly-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fake_simd__0_1_2",
        url = "https://crates.io/api/v1/crates/fake-simd/0.1.2/download",
        type = "tar.gz",
        sha256 = "e88a8acf291dafb59c2d96e8f59828f3838bb1a70398823ade51a84de6a6deed",
        strip_prefix = "fake-simd-0.1.2",
        build_file = Label("//bazel/cargo/remote:BUILD.fake-simd-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fallible_iterator__0_2_0",
        url = "https://crates.io/api/v1/crates/fallible-iterator/0.2.0/download",
        type = "tar.gz",
        sha256 = "4443176a9f2c162692bd3d352d745ef9413eec5782a80d8fd6f8a1ac692a07f7",
        strip_prefix = "fallible-iterator-0.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.fallible-iterator-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__file_per_thread_logger__0_1_4",
        url = "https://crates.io/api/v1/crates/file-per-thread-logger/0.1.4/download",
        type = "tar.gz",
        sha256 = "4fdbe0d94371f9ce939b555dd342d0686cc4c0cadbcd4b61d70af5ff97eb4126",
        strip_prefix = "file-per-thread-logger-0.1.4",
        build_file = Label("//bazel/cargo/remote:BUILD.file-per-thread-logger-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gcc__0_3_55",
        url = "https://crates.io/api/v1/crates/gcc/0.3.55/download",
        type = "tar.gz",
        sha256 = "8f5f3913fa0bfe7ee1fd8248b6b9f42a5af4b9d65ec2dd2c3c26132b950ecfc2",
        strip_prefix = "gcc-0.3.55",
        build_file = Label("//bazel/cargo/remote:BUILD.gcc-0.3.55.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__generic_array__0_12_3",
        url = "https://crates.io/api/v1/crates/generic-array/0.12.3/download",
        type = "tar.gz",
        sha256 = "c68f0274ae0e023facc3c97b2e00f076be70e254bc851d972503b328db79b2ec",
        strip_prefix = "generic-array-0.12.3",
        build_file = Label("//bazel/cargo/remote:BUILD.generic-array-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_1_15",
        url = "https://crates.io/api/v1/crates/getrandom/0.1.15/download",
        type = "tar.gz",
        sha256 = "fc587bc0ec293155d5bfa6b9891ec18a1e330c234f896ea47fbada4cadbe47e6",
        strip_prefix = "getrandom-0.1.15",
        build_file = Label("//bazel/cargo/remote:BUILD.getrandom-0.1.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__gimli__0_22_0",
        url = "https://crates.io/api/v1/crates/gimli/0.22.0/download",
        type = "tar.gz",
        sha256 = "aaf91faf136cb47367fa430cd46e37a788775e7fa104f8b4bcb3861dc389b724",
        strip_prefix = "gimli-0.22.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.22.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__glob__0_3_0",
        url = "https://crates.io/api/v1/crates/glob/0.3.0/download",
        type = "tar.gz",
        sha256 = "9b919933a397b79c37e33b77bb2aa3dc8eb6e165ad809e58ff75bc7db2e34574",
        strip_prefix = "glob-0.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.glob-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_17",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.17/download",
        type = "tar.gz",
        sha256 = "5aca5565f760fb5b220e499d72710ed156fdb74e631659e99377d9ebfbd13ae8",
        strip_prefix = "hermit-abi-0.1.17",
        build_file = Label("//bazel/cargo/remote:BUILD.hermit-abi-0.1.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__humantime__1_3_0",
        url = "https://crates.io/api/v1/crates/humantime/1.3.0/download",
        type = "tar.gz",
        sha256 = "df004cfca50ef23c36850aaaa59ad52cc70d0e90243c3c7737a4dd32dc7a3c4f",
        strip_prefix = "humantime-1.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.humantime-1.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__indexmap__1_1_0",
        url = "https://crates.io/api/v1/crates/indexmap/1.1.0/download",
        type = "tar.gz",
        sha256 = "a4d6d89e0948bf10c08b9ecc8ac5b83f07f857ebe2c0cbe38de15b4e4f510356",
        strip_prefix = "indexmap-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.indexmap-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itertools__0_9_0",
        url = "https://crates.io/api/v1/crates/itertools/0.9.0/download",
        type = "tar.gz",
        sha256 = "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b",
        strip_prefix = "itertools-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.itertools-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__jobserver__0_1_21",
        url = "https://crates.io/api/v1/crates/jobserver/0.1.21/download",
        type = "tar.gz",
        sha256 = "5c71313ebb9439f74b00d9d2dcec36440beaf57a6aa0623068441dd7cd81a7f2",
        strip_prefix = "jobserver-0.1.21",
        build_file = Label("//bazel/cargo/remote:BUILD.jobserver-0.1.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__leb128__0_2_4",
        url = "https://crates.io/api/v1/crates/leb128/0.2.4/download",
        type = "tar.gz",
        sha256 = "3576a87f2ba00f6f106fdfcd16db1d698d648a26ad8e0573cad8537c3c362d2a",
        strip_prefix = "leb128-0.2.4",
        build_file = Label("//bazel/cargo/remote:BUILD.leb128-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_80",
        url = "https://crates.io/api/v1/crates/libc/0.2.80/download",
        type = "tar.gz",
        sha256 = "4d58d1b70b004888f764dfbf6a26a3b0342a1632d33968e4a179d8011c760614",
        strip_prefix = "libc-0.2.80",
        build_file = Label("//bazel/cargo/remote:BUILD.libc-0.2.80.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_11",
        url = "https://crates.io/api/v1/crates/log/0.4.11/download",
        type = "tar.gz",
        sha256 = "4fabed175da42fed1fa0746b0ea71f412aa9d35e76e95e59b192c64b9dc2bf8b",
        strip_prefix = "log-0.4.11",
        build_file = Label("//bazel/cargo/remote:BUILD.log-0.4.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mach__0_3_2",
        url = "https://crates.io/api/v1/crates/mach/0.3.2/download",
        type = "tar.gz",
        sha256 = "b823e83b2affd8f40a9ee8c29dbc56404c1e34cd2710921f2801e2cf29527afa",
        strip_prefix = "mach-0.3.2",
        build_file = Label("//bazel/cargo/remote:BUILD.mach-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_3_3",
        url = "https://crates.io/api/v1/crates/memchr/2.3.3/download",
        type = "tar.gz",
        sha256 = "3728d817d99e5ac407411fa471ff9800a778d88a24685968b36824eaf4bee400",
        strip_prefix = "memchr-2.3.3",
        build_file = Label("//bazel/cargo/remote:BUILD.memchr-2.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memoffset__0_5_6",
        url = "https://crates.io/api/v1/crates/memoffset/0.5.6/download",
        type = "tar.gz",
        sha256 = "043175f069eda7b85febe4a74abbaeff828d9f8b448515d3151a14a3542811aa",
        strip_prefix = "memoffset-0.5.6",
        build_file = Label("//bazel/cargo/remote:BUILD.memoffset-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__miniz_oxide__0_4_3",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.4.3/download",
        type = "tar.gz",
        sha256 = "0f2d26ec3309788e423cfbf68ad1800f061638098d76a83681af979dc4eda19d",
        strip_prefix = "miniz_oxide-0.4.3",
        build_file = Label("//bazel/cargo/remote:BUILD.miniz_oxide-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__more_asserts__0_2_1",
        url = "https://crates.io/api/v1/crates/more-asserts/0.2.1/download",
        type = "tar.gz",
        sha256 = "0debeb9fcf88823ea64d64e4a815ab1643f33127d995978e099942ce38f25238",
        strip_prefix = "more-asserts-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.more-asserts-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__object__0_21_1",
        url = "https://crates.io/api/v1/crates/object/0.21.1/download",
        type = "tar.gz",
        sha256 = "37fd5004feb2ce328a52b0b3d01dbf4ffff72583493900ed15f22d4111c51693",
        strip_prefix = "object-0.21.1",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.21.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__once_cell__1_4_1",
        url = "https://crates.io/api/v1/crates/once_cell/1.4.1/download",
        type = "tar.gz",
        sha256 = "260e51e7efe62b592207e9e13a68e43692a7a279171d6ba57abd208bf23645ad",
        strip_prefix = "once_cell-1.4.1",
        build_file = Label("//bazel/cargo/remote:BUILD.once_cell-1.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__opaque_debug__0_2_3",
        url = "https://crates.io/api/v1/crates/opaque-debug/0.2.3/download",
        type = "tar.gz",
        sha256 = "2839e79665f131bdb5782e51f2c6c9599c133c6098982a54c794358bf432529c",
        strip_prefix = "opaque-debug-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.opaque-debug-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_24",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.24/download",
        type = "tar.gz",
        sha256 = "1e0704ee1a7e00d7bb417d0770ea303c1bccbabf0ef1667dae92b5967f5f8a71",
        strip_prefix = "proc-macro2-1.0.24",
        build_file = Label("//bazel/cargo/remote:BUILD.proc-macro2-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quick_error__1_2_3",
        url = "https://crates.io/api/v1/crates/quick-error/1.2.3/download",
        type = "tar.gz",
        sha256 = "a1d01941d82fa2ab50be1e79e6714289dd7cde78eba4c074bc5a4374f650dfe0",
        strip_prefix = "quick-error-1.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.quick-error-1.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_7",
        url = "https://crates.io/api/v1/crates/quote/1.0.7/download",
        type = "tar.gz",
        sha256 = "aa563d17ecb180e500da1cfd2b028310ac758de548efdd203e18f283af693f37",
        strip_prefix = "quote-1.0.7",
        build_file = Label("//bazel/cargo/remote:BUILD.quote-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__raw_cpuid__7_0_3",
        url = "https://crates.io/api/v1/crates/raw-cpuid/7.0.3/download",
        type = "tar.gz",
        sha256 = "b4a349ca83373cfa5d6dbb66fd76e58b2cca08da71a5f6400de0a0a6a9bceeaf",
        strip_prefix = "raw-cpuid-7.0.3",
        build_file = Label("//bazel/cargo/remote:BUILD.raw-cpuid-7.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_syscall__0_1_57",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.1.57/download",
        type = "tar.gz",
        sha256 = "41cc0f7e4d5d4544e8861606a285bb08d3e70712ccc7d2b84d7c0ccfaf4b05ce",
        strip_prefix = "redox_syscall-0.1.57",
        build_file = Label("//bazel/cargo/remote:BUILD.redox_syscall-0.1.57.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_users__0_3_5",
        url = "https://crates.io/api/v1/crates/redox_users/0.3.5/download",
        type = "tar.gz",
        sha256 = "de0737333e7a9502c789a36d7c7fa6092a49895d4faa31ca5df163857ded2e9d",
        strip_prefix = "redox_users-0.3.5",
        build_file = Label("//bazel/cargo/remote:BUILD.redox_users-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regalloc__0_0_30",
        url = "https://crates.io/api/v1/crates/regalloc/0.0.30/download",
        type = "tar.gz",
        sha256 = "2041c2d34f6ff346d6f428974f03d8bf12679b0c816bb640dc5eb1d48848d8d1",
        strip_prefix = "regalloc-0.0.30",
        build_file = Label("//bazel/cargo/remote:BUILD.regalloc-0.0.30.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex__1_4_1",
        url = "https://crates.io/api/v1/crates/regex/1.4.1/download",
        type = "tar.gz",
        sha256 = "8963b85b8ce3074fecffde43b4b0dded83ce2f367dc8d363afc56679f3ee820b",
        strip_prefix = "regex-1.4.1",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-1.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_syntax__0_6_20",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.20/download",
        type = "tar.gz",
        sha256 = "8cab7a364d15cde1e505267766a2d3c4e22a843e1a601f0fa7564c0f82ced11c",
        strip_prefix = "regex-syntax-0.6.20",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-syntax-0.6.20.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__region__2_2_0",
        url = "https://crates.io/api/v1/crates/region/2.2.0/download",
        type = "tar.gz",
        sha256 = "877e54ea2adcd70d80e9179344c97f93ef0dffd6b03e1f4529e6e83ab2fa9ae0",
        strip_prefix = "region-2.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.region-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rust_argon2__0_8_2",
        url = "https://crates.io/api/v1/crates/rust-argon2/0.8.2/download",
        type = "tar.gz",
        sha256 = "9dab61250775933275e84053ac235621dfb739556d5c54a2f2e9313b7cf43a19",
        strip_prefix = "rust-argon2-0.8.2",
        build_file = Label("//bazel/cargo/remote:BUILD.rust-argon2-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_demangle__0_1_18",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.18/download",
        type = "tar.gz",
        sha256 = "6e3bad0ee36814ca07d7968269dd4b7ec89ec2da10c4bb613928d3077083c232",
        strip_prefix = "rustc-demangle-0.1.18",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-demangle-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_hash__1_1_0",
        url = "https://crates.io/api/v1/crates/rustc-hash/1.1.0/download",
        type = "tar.gz",
        sha256 = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2",
        strip_prefix = "rustc-hash-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-hash-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        sha256 = "138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scroll__0_10_2",
        url = "https://crates.io/api/v1/crates/scroll/0.10.2/download",
        type = "tar.gz",
        sha256 = "fda28d4b4830b807a8b43f7b0e6b5df875311b3e7621d84577188c175b6ec1ec",
        strip_prefix = "scroll-0.10.2",
        build_file = Label("//bazel/cargo/remote:BUILD.scroll-0.10.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scroll_derive__0_10_4",
        url = "https://crates.io/api/v1/crates/scroll_derive/0.10.4/download",
        type = "tar.gz",
        sha256 = "b12bd20b94c7cdfda8c7ba9b92ad0d9a56e3fa018c25fca83b51aa664c9b4c0d",
        strip_prefix = "scroll_derive-0.10.4",
        build_file = Label("//bazel/cargo/remote:BUILD.scroll_derive-0.10.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_117",
        url = "https://crates.io/api/v1/crates/serde/1.0.117/download",
        type = "tar.gz",
        sha256 = "b88fa983de7720629c9387e9f517353ed404164b1e482c970a90c1a4aaf7dc1a",
        strip_prefix = "serde-1.0.117",
        build_file = Label("//bazel/cargo/remote:BUILD.serde-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_117",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.117/download",
        type = "tar.gz",
        sha256 = "cbd1ae72adb44aab48f325a02444a5fc079349a8d804c1fc922aed3f7454c74e",
        strip_prefix = "serde_derive-1.0.117",
        build_file = Label("//bazel/cargo/remote:BUILD.serde_derive-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sha2__0_8_2",
        url = "https://crates.io/api/v1/crates/sha2/0.8.2/download",
        type = "tar.gz",
        sha256 = "a256f46ea78a0c0d9ff00077504903ac881a1dafdc20da66545699e7776b3e69",
        strip_prefix = "sha2-0.8.2",
        build_file = Label("//bazel/cargo/remote:BUILD.sha2-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_4_2",
        url = "https://crates.io/api/v1/crates/smallvec/1.4.2/download",
        type = "tar.gz",
        sha256 = "fbee7696b84bbf3d89a1c2eccff0850e3047ed46bfcd2e92c29a2d074d57e252",
        strip_prefix = "smallvec-1.4.2",
        build_file = Label("//bazel/cargo/remote:BUILD.smallvec-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__stable_deref_trait__1_2_0",
        url = "https://crates.io/api/v1/crates/stable_deref_trait/1.2.0/download",
        type = "tar.gz",
        sha256 = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3",
        strip_prefix = "stable_deref_trait-1.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.stable_deref_trait-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_48",
        url = "https://crates.io/api/v1/crates/syn/1.0.48/download",
        type = "tar.gz",
        sha256 = "cc371affeffc477f42a221a1e4297aedcea33d47d19b61455588bd9d8f6b19ac",
        strip_prefix = "syn-1.0.48",
        build_file = Label("//bazel/cargo/remote:BUILD.syn-1.0.48.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__target_lexicon__0_11_1",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.11.1/download",
        type = "tar.gz",
        sha256 = "4ee5a98e506fb7231a304c3a1bd7c132a55016cf65001e0282480665870dfcb9",
        strip_prefix = "target-lexicon-0.11.1",
        build_file = Label("//bazel/cargo/remote:BUILD.target-lexicon-0.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__termcolor__1_1_0",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.0/download",
        type = "tar.gz",
        sha256 = "bb6bfa289a4d7c5766392812c0a1f4c1ba45afa1ad47803c11e1f407d846d75f",
        strip_prefix = "termcolor-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.termcolor-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror__1_0_21",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.21/download",
        type = "tar.gz",
        sha256 = "318234ffa22e0920fe9a40d7b8369b5f649d490980cf7aadcf1eb91594869b42",
        strip_prefix = "thiserror-1.0.21",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-1.0.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror_impl__1_0_21",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.21/download",
        type = "tar.gz",
        sha256 = "cae2447b6282786c3493999f40a9be2a6ad20cb8bd268b0a0dbf5a065535c0ab",
        strip_prefix = "thiserror-impl-1.0.21",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-impl-1.0.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thread_local__1_0_1",
        url = "https://crates.io/api/v1/crates/thread_local/1.0.1/download",
        type = "tar.gz",
        sha256 = "d40c6d1b69745a6ec6fb1ca717914848da4b44ae29d9b3080cbee91d72a69b14",
        strip_prefix = "thread_local-1.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.thread_local-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__toml__0_5_7",
        url = "https://crates.io/api/v1/crates/toml/0.5.7/download",
        type = "tar.gz",
        sha256 = "75cf45bb0bef80604d001caaec0d09da99611b3c0fd39d3080468875cdb65645",
        strip_prefix = "toml-0.5.7",
        build_file = Label("//bazel/cargo/remote:BUILD.toml-0.5.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typenum__1_12_0",
        url = "https://crates.io/api/v1/crates/typenum/1.12.0/download",
        type = "tar.gz",
        sha256 = "373c8a200f9e67a0c95e62a4f52fbf80c23b4381c05a17845531982fa99e6b33",
        strip_prefix = "typenum-1.12.0",
        build_file = Label("//bazel/cargo/remote:BUILD.typenum-1.12.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_xid__0_2_1",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.1/download",
        type = "tar.gz",
        sha256 = "f7fe0bb3479651439c9112f72b6c505038574c9fbb575ed1bf3b797fa39dd564",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.unicode-xid-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_9_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.9.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519",
        strip_prefix = "wasi-0.9.0+wasi-snapshot-preview1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasi-0.9.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmparser__0_57_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.57.0/download",
        type = "tar.gz",
        sha256 = "32fddd575d477c6e9702484139cf9f23dcd554b06d185ed0f56c857dd3a47aa6",
        strip_prefix = "wasmparser-0.57.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.57.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasmparser__0_59_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.59.0/download",
        type = "tar.gz",
        sha256 = "a950e6a618f62147fd514ff445b2a0b53120d382751960797f85f058c7eda9b9",
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
        sha256 = "b3f174eed73e885ede6c8fcc3fbea8c3757afa521840676496cde56bb742ddab",
        strip_prefix = "wast-26.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wast-26.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wat__1_0_27",
        url = "https://crates.io/api/v1/crates/wat/1.0.27/download",
        type = "tar.gz",
        sha256 = "26b2dccbce4d0e14875091846e110a2369267b18ddd0d6423479b88dad914d71",
        strip_prefix = "wat-1.0.27",
        build_file = Label("//bazel/cargo/remote:BUILD.wat-1.0.27.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__zstd__0_5_3_zstd_1_4_5",
        url = "https://crates.io/api/v1/crates/zstd/0.5.3+zstd.1.4.5/download",
        type = "tar.gz",
        sha256 = "01b32eaf771efa709e8308605bbf9319bf485dc1503179ec0469b611937c0cd8",
        strip_prefix = "zstd-0.5.3+zstd.1.4.5",
        build_file = Label("//bazel/cargo/remote:BUILD.zstd-0.5.3+zstd.1.4.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__zstd_safe__2_0_5_zstd_1_4_5",
        url = "https://crates.io/api/v1/crates/zstd-safe/2.0.5+zstd.1.4.5/download",
        type = "tar.gz",
        sha256 = "1cfb642e0d27f64729a639c52db457e0ae906e7bc6f5fe8f5c453230400f1055",
        strip_prefix = "zstd-safe-2.0.5+zstd.1.4.5",
        build_file = Label("//bazel/cargo/remote:BUILD.zstd-safe-2.0.5+zstd.1.4.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__zstd_sys__1_4_17_zstd_1_4_5",
        url = "https://crates.io/api/v1/crates/zstd-sys/1.4.17+zstd.1.4.5/download",
        type = "tar.gz",
        sha256 = "b89249644df056b522696b1bb9e7c18c87e8ffa3e2f0dc3b0155875d6498f01b",
        strip_prefix = "zstd-sys-1.4.17+zstd.1.4.5",
        build_file = Label("//bazel/cargo/remote:BUILD.zstd-sys-1.4.17+zstd.1.4.5.bazel"),
    )
