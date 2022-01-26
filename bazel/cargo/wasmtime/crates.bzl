"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def wasmtime_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "wasmtime__addr2line__0_17_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.17.0/download",
        type = "tar.gz",
        sha256 = "b9ecd88a8c8378ca913a680cd98f0f13ac67383d35993f86c90a70e3f137816b",
        strip_prefix = "addr2line-0.17.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.addr2line-0.17.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__adler__1_0_2",
        url = "https://crates.io/api/v1/crates/adler/1.0.2/download",
        type = "tar.gz",
        sha256 = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe",
        strip_prefix = "adler-1.0.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.adler-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__aho_corasick__0_7_18",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.18/download",
        type = "tar.gz",
        sha256 = "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f",
        strip_prefix = "aho-corasick-0.7.18",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.aho-corasick-0.7.18.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__anyhow__1_0_53",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.53/download",
        type = "tar.gz",
        sha256 = "94a45b455c14666b85fc40a019e8ab9eb75e3a124e05494f5397122bc9eb06e0",
        strip_prefix = "anyhow-1.0.53",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.53.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__backtrace__0_3_63",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.63/download",
        type = "tar.gz",
        sha256 = "321629d8ba6513061f26707241fa9bc89524ff1cd7a915a97ef0c62c666ce1b6",
        strip_prefix = "backtrace-0.3.63",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.backtrace-0.3.63.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__bincode__1_3_3",
        url = "https://crates.io/api/v1/crates/bincode/1.3.3/download",
        type = "tar.gz",
        sha256 = "b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad",
        strip_prefix = "bincode-1.3.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bincode-1.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__bitflags__1_3_2",
        url = "https://crates.io/api/v1/crates/bitflags/1.3.2/download",
        type = "tar.gz",
        sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a",
        strip_prefix = "bitflags-1.3.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bitflags-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cc__1_0_72",
        url = "https://crates.io/api/v1/crates/cc/1.0.72/download",
        type = "tar.gz",
        sha256 = "22a9137b95ea06864e018375b72adfb7db6e6f68cfc8df5a04d00288050485ee",
        strip_prefix = "cc-1.0.72",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cc-1.0.72.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cpp_demangle__0_3_5",
        url = "https://crates.io/api/v1/crates/cpp_demangle/0.3.5/download",
        type = "tar.gz",
        sha256 = "eeaa953eaad386a53111e47172c2fedba671e5684c8dd601a5f474f4f118710f",
        strip_prefix = "cpp_demangle-0.3.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cpp_demangle-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_bforest__0_80_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.80.0/download",
        type = "tar.gz",
        sha256 = "9516ba6b2ba47b4cbf63b713f75b432fafa0a0e0464ec8381ec76e6efe931ab3",
        strip_prefix = "cranelift-bforest-0.80.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_80_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.80.0/download",
        type = "tar.gz",
        sha256 = "489e5d0081f7edff6be12d71282a8bf387b5df64d5592454b75d662397f2d642",
        strip_prefix = "cranelift-codegen-0.80.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_80_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.80.0/download",
        type = "tar.gz",
        sha256 = "d36ee1140371bb0f69100e734b30400157a4adf7b86148dee8b0a438763ead48",
        strip_prefix = "cranelift-codegen-meta-0.80.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_80_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.80.0/download",
        type = "tar.gz",
        sha256 = "981da52d8f746af1feb96290c83977ff8d41071a7499e991d8abae0d4869f564",
        strip_prefix = "cranelift-codegen-shared-0.80.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_80_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.80.0/download",
        type = "tar.gz",
        sha256 = "a2906740053dd3bcf95ce53df0fd9b5649c68ae4bd9adada92b406f059eae461",
        strip_prefix = "cranelift-entity-0.80.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_80_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.80.0/download",
        type = "tar.gz",
        sha256 = "b7cb156de1097f567d46bf57a0cd720a72c3e15e1a2bd8b1041ba2fc894471b7",
        strip_prefix = "cranelift-frontend-0.80.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_80_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.80.0/download",
        type = "tar.gz",
        sha256 = "166028ca0343a6ee7bddac0e70084e142b23f99c701bd6f6ea9123afac1a7a46",
        strip_prefix = "cranelift-native-0.80.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_80_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.80.0/download",
        type = "tar.gz",
        sha256 = "5012a1cde0c8b3898770b711490d803018ae9bec2d60674ba0e5b2058a874f80",
        strip_prefix = "cranelift-wasm-0.80.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.80.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crc32fast__1_3_1",
        url = "https://crates.io/api/v1/crates/crc32fast/1.3.1/download",
        type = "tar.gz",
        sha256 = "a2209c310e29876f7f0b2721e7e26b84aff178aa3da5d091f9bfbf47669e60e3",
        strip_prefix = "crc32fast-1.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crc32fast-1.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__env_logger__0_8_4",
        url = "https://crates.io/api/v1/crates/env_logger/0.8.4/download",
        type = "tar.gz",
        sha256 = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3",
        strip_prefix = "env_logger-0.8.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.env_logger-0.8.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__errno__0_2_8",
        url = "https://crates.io/api/v1/crates/errno/0.2.8/download",
        type = "tar.gz",
        sha256 = "f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8ce6c396a1",
        strip_prefix = "errno-0.2.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.errno-0.2.8.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__errno_dragonfly__0_1_2",
        url = "https://crates.io/api/v1/crates/errno-dragonfly/0.1.2/download",
        type = "tar.gz",
        sha256 = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf",
        strip_prefix = "errno-dragonfly-0.1.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.errno-dragonfly-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__fallible_iterator__0_2_0",
        url = "https://crates.io/api/v1/crates/fallible-iterator/0.2.0/download",
        type = "tar.gz",
        sha256 = "4443176a9f2c162692bd3d352d745ef9413eec5782a80d8fd6f8a1ac692a07f7",
        strip_prefix = "fallible-iterator-0.2.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.fallible-iterator-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__getrandom__0_2_4",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.4/download",
        type = "tar.gz",
        sha256 = "418d37c8b1d42553c93648be529cb70f920d3baf8ef469b74b9638df426e0b4c",
        strip_prefix = "getrandom-0.2.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.getrandom-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__gimli__0_26_1",
        url = "https://crates.io/api/v1/crates/gimli/0.26.1/download",
        type = "tar.gz",
        sha256 = "78cc372d058dcf6d5ecd98510e7fbc9e5aec4d21de70f65fea8fecebcd881bd4",
        strip_prefix = "gimli-0.26.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.gimli-0.26.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__hashbrown__0_11_2",
        url = "https://crates.io/api/v1/crates/hashbrown/0.11.2/download",
        type = "tar.gz",
        sha256 = "ab5ef0d4909ef3724cc8cce6ccc8572c5c817592e9285f5464f8e86f8bd3726e",
        strip_prefix = "hashbrown-0.11.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hashbrown-0.11.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__hermit_abi__0_1_19",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.19/download",
        type = "tar.gz",
        sha256 = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33",
        strip_prefix = "hermit-abi-0.1.19",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hermit-abi-0.1.19.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__humantime__2_1_0",
        url = "https://crates.io/api/v1/crates/humantime/2.1.0/download",
        type = "tar.gz",
        sha256 = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4",
        strip_prefix = "humantime-2.1.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.humantime-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__indexmap__1_8_0",
        url = "https://crates.io/api/v1/crates/indexmap/1.8.0/download",
        type = "tar.gz",
        sha256 = "282a6247722caba404c065016bbfa522806e51714c34f5dfc3e4a3a46fcb4223",
        strip_prefix = "indexmap-1.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.indexmap-1.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__io_lifetimes__0_4_4",
        url = "https://crates.io/api/v1/crates/io-lifetimes/0.4.4/download",
        type = "tar.gz",
        sha256 = "f6ef6787e7f0faedc040f95716bdd0e62bcfcf4ba93da053b62dea2691c13864",
        strip_prefix = "io-lifetimes-0.4.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.io-lifetimes-0.4.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__itertools__0_10_3",
        url = "https://crates.io/api/v1/crates/itertools/0.10.3/download",
        type = "tar.gz",
        sha256 = "a9a9d19fa1e79b6215ff29b9d6880b706147f16e9b1dbb1e4e5947b5b02bc5e3",
        strip_prefix = "itertools-0.10.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.itertools-0.10.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__libc__0_2_114",
        url = "https://crates.io/api/v1/crates/libc/0.2.114/download",
        type = "tar.gz",
        sha256 = "b0005d08a8f7b65fb8073cb697aa0b12b631ed251ce73d862ce50eeb52ce3b50",
        strip_prefix = "libc-0.2.114",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.114.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__linux_raw_sys__0_0_36",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.0.36/download",
        type = "tar.gz",
        sha256 = "a261afc61b7a5e323933b402ca6a1765183687c614789b1e4db7762ed4230bca",
        strip_prefix = "linux-raw-sys-0.0.36",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.linux-raw-sys-0.0.36.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__log__0_4_14",
        url = "https://crates.io/api/v1/crates/log/0.4.14/download",
        type = "tar.gz",
        sha256 = "51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710",
        strip_prefix = "log-0.4.14",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.log-0.4.14.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__mach__0_3_2",
        url = "https://crates.io/api/v1/crates/mach/0.3.2/download",
        type = "tar.gz",
        sha256 = "b823e83b2affd8f40a9ee8c29dbc56404c1e34cd2710921f2801e2cf29527afa",
        strip_prefix = "mach-0.3.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.mach-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__memchr__2_4_1",
        url = "https://crates.io/api/v1/crates/memchr/2.4.1/download",
        type = "tar.gz",
        sha256 = "308cc39be01b73d0d18f82a0e7b2a3df85245f84af96fdddc5d202d27e47b86a",
        strip_prefix = "memchr-2.4.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memchr-2.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__memoffset__0_6_5",
        url = "https://crates.io/api/v1/crates/memoffset/0.6.5/download",
        type = "tar.gz",
        sha256 = "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce",
        strip_prefix = "memoffset-0.6.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memoffset-0.6.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__miniz_oxide__0_4_4",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.4.4/download",
        type = "tar.gz",
        sha256 = "a92518e98c078586bc6c934028adcca4c92a53d6a958196de835170a01d84e4b",
        strip_prefix = "miniz_oxide-0.4.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.miniz_oxide-0.4.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__more_asserts__0_2_2",
        url = "https://crates.io/api/v1/crates/more-asserts/0.2.2/download",
        type = "tar.gz",
        sha256 = "7843ec2de400bcbc6a6328c958dc38e5359da6e93e72e37bc5246bf1ae776389",
        strip_prefix = "more-asserts-0.2.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.more-asserts-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__object__0_27_1",
        url = "https://crates.io/api/v1/crates/object/0.27.1/download",
        type = "tar.gz",
        sha256 = "67ac1d3f9a1d3616fd9a60c8d74296f22406a238b6a72f5cc1e6f314df4ffbf9",
        strip_prefix = "object-0.27.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.object-0.27.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__once_cell__1_9_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.9.0/download",
        type = "tar.gz",
        sha256 = "da32515d9f6e6e489d7bc9d84c71b060db7247dc035bbe44eac88cf87486d8d5",
        strip_prefix = "once_cell-1.9.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.once_cell-1.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__paste__1_0_6",
        url = "https://crates.io/api/v1/crates/paste/1.0.6/download",
        type = "tar.gz",
        sha256 = "0744126afe1a6dd7f394cb50a716dbe086cb06e255e53d8d0185d82828358fb5",
        strip_prefix = "paste-1.0.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.paste-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__ppv_lite86__0_2_16",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.16/download",
        type = "tar.gz",
        sha256 = "eb9f9e6e233e5c4a35559a617bf40a4ec447db2e84c20b55a6f83167b7e57872",
        strip_prefix = "ppv-lite86-0.2.16",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ppv-lite86-0.2.16.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__proc_macro2__1_0_36",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.36/download",
        type = "tar.gz",
        sha256 = "c7342d5883fbccae1cc37a2353b09c87c9b0f3afd73f5fb9bba687a1f733b029",
        strip_prefix = "proc-macro2-1.0.36",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.36.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__psm__0_1_16",
        url = "https://crates.io/api/v1/crates/psm/0.1.16/download",
        type = "tar.gz",
        sha256 = "cd136ff4382c4753fc061cb9e4712ab2af263376b95bbd5bd8cd50c020b78e69",
        strip_prefix = "psm-0.1.16",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.psm-0.1.16.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__quote__1_0_15",
        url = "https://crates.io/api/v1/crates/quote/1.0.15/download",
        type = "tar.gz",
        sha256 = "864d3e96a899863136fc6e99f3d7cae289dafe43bf2c5ac19b70df7210c0a145",
        strip_prefix = "quote-1.0.15",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.15.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rand__0_8_4",
        url = "https://crates.io/api/v1/crates/rand/0.8.4/download",
        type = "tar.gz",
        sha256 = "2e7573632e6454cf6b99d7aac4ccca54be06da05aca2ef7423d22d27d4d4bcd8",
        strip_prefix = "rand-0.8.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rand-0.8.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rand_chacha__0_3_1",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.3.1/download",
        type = "tar.gz",
        sha256 = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88",
        strip_prefix = "rand_chacha-0.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rand_chacha-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rand_core__0_6_3",
        url = "https://crates.io/api/v1/crates/rand_core/0.6.3/download",
        type = "tar.gz",
        sha256 = "d34f1408f55294453790c48b2f1ebbb1c5b4b7563eb1f418bcfcfdbb06ebb4e7",
        strip_prefix = "rand_core-0.6.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rand_core-0.6.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rand_hc__0_3_1",
        url = "https://crates.io/api/v1/crates/rand_hc/0.3.1/download",
        type = "tar.gz",
        sha256 = "d51e9f596de227fda2ea6c84607f5558e196eeaf43c986b724ba4fb8fdf497e7",
        strip_prefix = "rand_hc-0.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rand_hc-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regalloc__0_0_33",
        url = "https://crates.io/api/v1/crates/regalloc/0.0.33/download",
        type = "tar.gz",
        sha256 = "7d808cff91dfca7b239d40b972ba628add94892b1d9e19a842aedc5cfae8ab1a",
        strip_prefix = "regalloc-0.0.33",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc-0.0.33.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex__1_5_4",
        url = "https://crates.io/api/v1/crates/regex/1.5.4/download",
        type = "tar.gz",
        sha256 = "d07a8629359eb56f1e2fb1652bb04212c072a87ba68546a04065d525673ac461",
        strip_prefix = "regex-1.5.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-1.5.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex_syntax__0_6_25",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.25/download",
        type = "tar.gz",
        sha256 = "f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f6153e3cc89b",
        strip_prefix = "regex-syntax-0.6.25",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-syntax-0.6.25.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__region__2_2_0",
        url = "https://crates.io/api/v1/crates/region/2.2.0/download",
        type = "tar.gz",
        sha256 = "877e54ea2adcd70d80e9179344c97f93ef0dffd6b03e1f4529e6e83ab2fa9ae0",
        strip_prefix = "region-2.2.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.region-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rustc_demangle__0_1_21",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.21/download",
        type = "tar.gz",
        sha256 = "7ef03e0a2b150c7a90d01faf6254c9c48a41e95fb2a8c2ac1c6f0d2b9aefc342",
        strip_prefix = "rustc-demangle-0.1.21",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustc-demangle-0.1.21.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rustc_hash__1_1_0",
        url = "https://crates.io/api/v1/crates/rustc-hash/1.1.0/download",
        type = "tar.gz",
        sha256 = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2",
        strip_prefix = "rustc-hash-1.1.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustc-hash-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rustix__0_31_3",
        url = "https://crates.io/api/v1/crates/rustix/0.31.3/download",
        type = "tar.gz",
        sha256 = "b2dcfc2778a90e38f56a708bfc90572422e11d6c7ee233d053d1f782cf9df6d2",
        strip_prefix = "rustix-0.31.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.31.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_136",
        url = "https://crates.io/api/v1/crates/serde/1.0.136/download",
        type = "tar.gz",
        sha256 = "ce31e24b01e1e524df96f1c2fdd054405f8d7376249a5110886fb4b658484789",
        strip_prefix = "serde-1.0.136",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.136.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_136",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.136/download",
        type = "tar.gz",
        sha256 = "08597e7152fcd306f41838ed3e37be9eaeed2b61c42e2117266a554fab4662f9",
        strip_prefix = "serde_derive-1.0.136",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.136.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__smallvec__1_8_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.8.0/download",
        type = "tar.gz",
        sha256 = "f2dd574626839106c320a323308629dcb1acfc96e32a8cba364ddc61ac23ee83",
        strip_prefix = "smallvec-1.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.smallvec-1.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__stable_deref_trait__1_2_0",
        url = "https://crates.io/api/v1/crates/stable_deref_trait/1.2.0/download",
        type = "tar.gz",
        sha256 = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3",
        strip_prefix = "stable_deref_trait-1.2.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.stable_deref_trait-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__syn__1_0_86",
        url = "https://crates.io/api/v1/crates/syn/1.0.86/download",
        type = "tar.gz",
        sha256 = "8a65b3f4ffa0092e9887669db0eae07941f023991ab58ea44da8fe8e2d511c6b",
        strip_prefix = "syn-1.0.86",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-1.0.86.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__target_lexicon__0_12_2",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.2/download",
        type = "tar.gz",
        sha256 = "d9bffcddbc2458fa3e6058414599e3c838a022abae82e5c67b4f7f80298d5bff",
        strip_prefix = "target-lexicon-0.12.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.target-lexicon-0.12.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__termcolor__1_1_2",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.2/download",
        type = "tar.gz",
        sha256 = "2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e26d88c5f4",
        strip_prefix = "termcolor-1.1.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.termcolor-1.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror__1_0_30",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.30/download",
        type = "tar.gz",
        sha256 = "854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9644e5c417",
        strip_prefix = "thiserror-1.0.30",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-1.0.30.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror_impl__1_0_30",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.30/download",
        type = "tar.gz",
        sha256 = "aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d377e5714b",
        strip_prefix = "thiserror-impl-1.0.30",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-impl-1.0.30.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_xid__0_2_2",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.2/download",
        type = "tar.gz",
        sha256 = "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3",
        strip_prefix = "unicode-xid-0.2.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-xid-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasi__0_10_2_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.10.2+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "fd6fbd9a79829dd1ad0cc20627bf1ed606756a7f77edff7b66b7064f9cb327c6",
        strip_prefix = "wasi-0.10.2+wasi-snapshot-preview1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasi-0.10.2+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmparser__0_81_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.81.0/download",
        type = "tar.gz",
        sha256 = "98930446519f63d00a836efdc22f67766ceae8dbcc1571379f2bcabc6b2b9abc",
        strip_prefix = "wasmparser-0.81.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.81.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__0_33_0",
        url = "https://crates.io/api/v1/crates/wasmtime/0.33.0/download",
        type = "tar.gz",
        sha256 = "414be1bc5ca12e755ffd3ff7acc3a6d1979922f8237fc34068b2156cebcc3270",
        strip_prefix = "wasmtime-0.33.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-0.33.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "8043c1f919a77905255eded33e4e51a6fbfd1de1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__0_33_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.33.0/download",
        type = "tar.gz",
        sha256 = "a4693d33725773615a4c9957e4aa731af57b27dca579702d1d8ed5750760f1a9",
        strip_prefix = "wasmtime-cranelift-0.33.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__0_33_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.33.0/download",
        type = "tar.gz",
        sha256 = "5b17e47116a078b9770e6fb86cff8b9a660826623cebcfff251b047c8d8993ef",
        strip_prefix = "wasmtime-environ-0.33.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__0_33_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.33.0/download",
        type = "tar.gz",
        sha256 = "60ea5b380bdf92e32911400375aeefb900ac9d3f8e350bb6ba555a39315f2ee7",
        strip_prefix = "wasmtime-jit-0.33.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__0_33_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.33.0/download",
        type = "tar.gz",
        sha256 = "abc7cd79937edd6e238b337608ebbcaf9c086a8457f01dfd598324f7fa56d81a",
        strip_prefix = "wasmtime-runtime-0.33.0",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:wasmtime-runtime.patch",
        ],
        patch_args = [
            "-p3",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__0_33_0",
        url = "https://crates.io/api/v1/crates/wasmtime-types/0.33.0/download",
        type = "tar.gz",
        sha256 = "d9e5e51a461a2cf2b69e1fc48f325b17d78a8582816e18479e8ead58844b23f8",
        strip_prefix = "wasmtime-types-0.33.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-0.33.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )
