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
        name = "wasmtime__ahash__0_7_6",
        url = "https://crates.io/api/v1/crates/ahash/0.7.6/download",
        type = "tar.gz",
        sha256 = "fcb51a0695d8f838b1ee009b3fbf66bda078cd64590202a864a8f3e8c4315c47",
        strip_prefix = "ahash-0.7.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ahash-0.7.6.bazel"),
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
        name = "wasmtime__anyhow__1_0_58",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.58/download",
        type = "tar.gz",
        sha256 = "bb07d2053ccdbe10e2af2995a2f116c1330396493dc1269f6a91d0ae82e19704",
        strip_prefix = "anyhow-1.0.58",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.58.bazel"),
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
        name = "wasmtime__autocfg__1_1_0",
        url = "https://crates.io/api/v1/crates/autocfg/1.1.0/download",
        type = "tar.gz",
        sha256 = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa",
        strip_prefix = "autocfg-1.1.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.autocfg-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__backtrace__0_3_66",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.66/download",
        type = "tar.gz",
        sha256 = "cab84319d616cfb654d03394f38ab7e6f0919e181b1b57e1fd15e7fb4077d9a7",
        strip_prefix = "backtrace-0.3.66",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.backtrace-0.3.66.bazel"),
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
        name = "wasmtime__byteorder__1_4_3",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.3/download",
        type = "tar.gz",
        sha256 = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610",
        strip_prefix = "byteorder-1.4.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.byteorder-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cc__1_0_73",
        url = "https://crates.io/api/v1/crates/cc/1.0.73/download",
        type = "tar.gz",
        sha256 = "2fff2a6927b3bb87f9595d67196a70493f627687a71d87a0d692242c33f58c11",
        strip_prefix = "cc-1.0.73",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cc-1.0.73.bazel"),
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
        name = "wasmtime__cranelift_bforest__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.86.1/download",
        type = "tar.gz",
        sha256 = "529ffacce2249ac60edba2941672dfedf3d96558b415d0d8083cd007456e0f55",
        strip_prefix = "cranelift-bforest-0.86.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.86.1/download",
        type = "tar.gz",
        sha256 = "427d105f617efc8cb55f8d036a7fded2e227892d8780b4985e5551f8d27c4a92",
        strip_prefix = "cranelift-codegen-0.86.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.86.1/download",
        type = "tar.gz",
        sha256 = "551674bed85b838d45358e3eab4f0ffaa6790c70dc08184204b9a54b41cdb7d1",
        strip_prefix = "cranelift-codegen-meta-0.86.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.86.1/download",
        type = "tar.gz",
        sha256 = "2b3a63ae57498c3eb495360944a33571754241e15e47e3bcae6082f40fec5866",
        strip_prefix = "cranelift-codegen-shared-0.86.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.86.1/download",
        type = "tar.gz",
        sha256 = "11aa8aa624c72cc1c94ea3d0739fa61248260b5b14d3646f51593a88d67f3e6e",
        strip_prefix = "cranelift-entity-0.86.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.86.1/download",
        type = "tar.gz",
        sha256 = "544ee8f4d1c9559c9aa6d46e7aaeac4a13856d620561094f35527356c7d21bd0",
        strip_prefix = "cranelift-frontend-0.86.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_isle__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.86.1/download",
        type = "tar.gz",
        sha256 = "ed16b14363d929b8c37e3c557d0a7396791b383ecc302141643c054343170aad",
        strip_prefix = "cranelift-isle-0.86.1",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:cranelift-isle.patch",
        ],
        patch_args = [
            "-p4",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-isle-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.86.1/download",
        type = "tar.gz",
        sha256 = "51617cf8744634f2ed3c989c3c40cd6444f63377c6d994adab0d85807f3eb682",
        strip_prefix = "cranelift-native-0.86.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_86_1",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.86.1/download",
        type = "tar.gz",
        sha256 = "e5a8073a41efc173fd19bad3f725c170c705df6da999fc47a738ff310225dd63",
        strip_prefix = "cranelift-wasm-0.86.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.86.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crc32fast__1_3_2",
        url = "https://crates.io/api/v1/crates/crc32fast/1.3.2/download",
        type = "tar.gz",
        sha256 = "b540bd8bc810d3885c6ea91e2018302f68baba2129ab3e88f32389ee9370880d",
        strip_prefix = "crc32fast-1.3.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crc32fast-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__either__1_7_0",
        url = "https://crates.io/api/v1/crates/either/1.7.0/download",
        type = "tar.gz",
        sha256 = "3f107b87b6afc2a64fd13cac55fe06d6c8859f12d4b14cbcdd2c67d0976781be",
        strip_prefix = "either-1.7.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.either-1.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__env_logger__0_9_0",
        url = "https://crates.io/api/v1/crates/env_logger/0.9.0/download",
        type = "tar.gz",
        sha256 = "0b2cf0344971ee6c64c31be0d530793fba457d322dfec2810c453d0ef228f9c3",
        strip_prefix = "env_logger-0.9.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.env_logger-0.9.0.bazel"),
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
        name = "wasmtime__fxhash__0_2_1",
        url = "https://crates.io/api/v1/crates/fxhash/0.2.1/download",
        type = "tar.gz",
        sha256 = "c31b6d751ae2c7f11320402d34e41349dd1016f8d5d45e48c4312bc8625af50c",
        strip_prefix = "fxhash-0.2.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.fxhash-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__getrandom__0_2_7",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.7/download",
        type = "tar.gz",
        sha256 = "4eb1a864a501629691edf6c15a593b7a51eebaa1e8468e9ddc623de7c9b58ec6",
        strip_prefix = "getrandom-0.2.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.getrandom-0.2.7.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__gimli__0_26_2",
        url = "https://crates.io/api/v1/crates/gimli/0.26.2/download",
        type = "tar.gz",
        sha256 = "22030e2c5a68ec659fde1e949a745124b48e6fa8b045b7ed5bd1fe4ccc5c4e5d",
        strip_prefix = "gimli-0.26.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.gimli-0.26.2.bazel"),
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
        name = "wasmtime__hashbrown__0_12_3",
        url = "https://crates.io/api/v1/crates/hashbrown/0.12.3/download",
        type = "tar.gz",
        sha256 = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888",
        strip_prefix = "hashbrown-0.12.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hashbrown-0.12.3.bazel"),
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
        name = "wasmtime__indexmap__1_9_1",
        url = "https://crates.io/api/v1/crates/indexmap/1.9.1/download",
        type = "tar.gz",
        sha256 = "10a35a97730320ffe8e2d410b5d3b69279b98d2c14bdb8b70ea89ecf7888d41e",
        strip_prefix = "indexmap-1.9.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.indexmap-1.9.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__io_lifetimes__0_7_2",
        url = "https://crates.io/api/v1/crates/io-lifetimes/0.7.2/download",
        type = "tar.gz",
        sha256 = "24c3f4eff5495aee4c0399d7b6a0dc2b6e81be84242ffbfcf253ebacccc1d0cb",
        strip_prefix = "io-lifetimes-0.7.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.io-lifetimes-0.7.2.bazel"),
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
        name = "wasmtime__libc__0_2_126",
        url = "https://crates.io/api/v1/crates/libc/0.2.126/download",
        type = "tar.gz",
        sha256 = "349d5a591cd28b49e1d1037471617a32ddcda5731b99419008085f72d5a53836",
        strip_prefix = "libc-0.2.126",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.126.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__linux_raw_sys__0_0_46",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.0.46/download",
        type = "tar.gz",
        sha256 = "d4d2456c373231a208ad294c33dc5bff30051eafd954cd4caae83a712b12854d",
        strip_prefix = "linux-raw-sys-0.0.46",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.linux-raw-sys-0.0.46.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__log__0_4_17",
        url = "https://crates.io/api/v1/crates/log/0.4.17/download",
        type = "tar.gz",
        sha256 = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e",
        strip_prefix = "log-0.4.17",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.log-0.4.17.bazel"),
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
        name = "wasmtime__memchr__2_5_0",
        url = "https://crates.io/api/v1/crates/memchr/2.5.0/download",
        type = "tar.gz",
        sha256 = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d",
        strip_prefix = "memchr-2.5.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memchr-2.5.0.bazel"),
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
        name = "wasmtime__miniz_oxide__0_5_3",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.5.3/download",
        type = "tar.gz",
        sha256 = "6f5c75688da582b8ffc1f1799e9db273f32133c49e048f614d22ec3256773ccc",
        strip_prefix = "miniz_oxide-0.5.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.miniz_oxide-0.5.3.bazel"),
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
        name = "wasmtime__object__0_28_4",
        url = "https://crates.io/api/v1/crates/object/0.28.4/download",
        type = "tar.gz",
        sha256 = "e42c982f2d955fac81dd7e1d0e1426a7d702acd9c98d19ab01083a6a0328c424",
        strip_prefix = "object-0.28.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.object-0.28.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__object__0_29_0",
        url = "https://crates.io/api/v1/crates/object/0.29.0/download",
        type = "tar.gz",
        sha256 = "21158b2c33aa6d4561f1c0a6ea283ca92bc54802a93b263e910746d679a7eb53",
        strip_prefix = "object-0.29.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.object-0.29.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__once_cell__1_13_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.13.0/download",
        type = "tar.gz",
        sha256 = "18a6dbe30758c9f83eb00cbea4ac95966305f5a7772f3f42ebfc7fc7eddbd8e1",
        strip_prefix = "once_cell-1.13.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.once_cell-1.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__paste__1_0_7",
        url = "https://crates.io/api/v1/crates/paste/1.0.7/download",
        type = "tar.gz",
        sha256 = "0c520e05135d6e763148b6426a837e239041653ba7becd2e538c076c738025fc",
        strip_prefix = "paste-1.0.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.paste-1.0.7.bazel"),
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
        name = "wasmtime__proc_macro2__1_0_42",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.42/download",
        type = "tar.gz",
        sha256 = "c278e965f1d8cf32d6e0e96de3d3e79712178ae67986d9cf9151f51e95aac89b",
        strip_prefix = "proc-macro2-1.0.42",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.42.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__psm__0_1_20",
        url = "https://crates.io/api/v1/crates/psm/0.1.20/download",
        type = "tar.gz",
        sha256 = "f446d0a6efba22928558c4fb4ce0b3fd6c89b0061343e390bf01a703742b8125",
        strip_prefix = "psm-0.1.20",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.psm-0.1.20.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__quote__1_0_20",
        url = "https://crates.io/api/v1/crates/quote/1.0.20/download",
        type = "tar.gz",
        sha256 = "3bcdf212e9776fbcb2d23ab029360416bb1706b1aea2d1a5ba002727cbcab804",
        strip_prefix = "quote-1.0.20",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.20.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rand__0_8_5",
        url = "https://crates.io/api/v1/crates/rand/0.8.5/download",
        type = "tar.gz",
        sha256 = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404",
        strip_prefix = "rand-0.8.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rand-0.8.5.bazel"),
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
        name = "wasmtime__regalloc2__0_3_1",
        url = "https://crates.io/api/v1/crates/regalloc2/0.3.1/download",
        type = "tar.gz",
        sha256 = "76ff2e57a7d050308b3fde0f707aa240b491b190e3855f212860f11bb3af4205",
        strip_prefix = "regalloc2-0.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc2-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex__1_6_0",
        url = "https://crates.io/api/v1/crates/regex/1.6.0/download",
        type = "tar.gz",
        sha256 = "4c4eb3267174b8c6c2f654116623910a0fef09c4753f8dd83db29c48a0df988b",
        strip_prefix = "regex-1.6.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-1.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex_syntax__0_6_27",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.27/download",
        type = "tar.gz",
        sha256 = "a3f87b73ce11b1619a3c6332f45341e0047173771e8b8b73f87bfeefb7b56244",
        strip_prefix = "regex-syntax-0.6.27",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-syntax-0.6.27.bazel"),
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
        name = "wasmtime__rustix__0_35_7",
        url = "https://crates.io/api/v1/crates/rustix/0.35.7/download",
        type = "tar.gz",
        sha256 = "d51cc38aa10f6bbb377ed28197aa052aa4e2b762c22be9d3153d01822587e787",
        strip_prefix = "rustix-0.35.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.35.7.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_140",
        url = "https://crates.io/api/v1/crates/serde/1.0.140/download",
        type = "tar.gz",
        sha256 = "fc855a42c7967b7c369eb5860f7164ef1f6f81c20c7cc1141f2a604e18723b03",
        strip_prefix = "serde-1.0.140",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.140.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_140",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.140/download",
        type = "tar.gz",
        sha256 = "6f2122636b9fe3b81f1cb25099fcf2d3f542cdb1d45940d56c713158884a05da",
        strip_prefix = "serde_derive-1.0.140",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.140.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__slice_group_by__0_3_0",
        url = "https://crates.io/api/v1/crates/slice-group-by/0.3.0/download",
        type = "tar.gz",
        sha256 = "03b634d87b960ab1a38c4fe143b508576f075e7c978bfad18217645ebfdfa2ec",
        strip_prefix = "slice-group-by-0.3.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.slice-group-by-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__smallvec__1_9_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.9.0/download",
        type = "tar.gz",
        sha256 = "2fd0db749597d91ff862fd1d55ea87f7855a744a8425a64695b6fca237d1dad1",
        strip_prefix = "smallvec-1.9.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.smallvec-1.9.0.bazel"),
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
        name = "wasmtime__syn__1_0_98",
        url = "https://crates.io/api/v1/crates/syn/1.0.98/download",
        type = "tar.gz",
        sha256 = "c50aef8a904de4c23c788f104b7dddc7d6f79c647c7c8ce4cc8f73eb0ca773dd",
        strip_prefix = "syn-1.0.98",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-1.0.98.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__target_lexicon__0_12_4",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.4/download",
        type = "tar.gz",
        sha256 = "c02424087780c9b71cc96799eaeddff35af2bc513278cda5c99fc1f5d026d3c1",
        strip_prefix = "target-lexicon-0.12.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.target-lexicon-0.12.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__termcolor__1_1_3",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.3/download",
        type = "tar.gz",
        sha256 = "bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755",
        strip_prefix = "termcolor-1.1.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.termcolor-1.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror__1_0_31",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.31/download",
        type = "tar.gz",
        sha256 = "bd829fe32373d27f76265620b5309d0340cb8550f523c1dda251d6298069069a",
        strip_prefix = "thiserror-1.0.31",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-1.0.31.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror_impl__1_0_31",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.31/download",
        type = "tar.gz",
        sha256 = "0396bc89e626244658bef819e22d0cc459e795a5ebe878e6ec336d1674a8d79a",
        strip_prefix = "thiserror-impl-1.0.31",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-impl-1.0.31.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_ident__1_0_2",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.2/download",
        type = "tar.gz",
        sha256 = "15c61ba63f9235225a22310255a29b806b907c9b8c964bcbd0a2c70f3f2deea7",
        strip_prefix = "unicode-ident-1.0.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-ident-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__version_check__0_9_4",
        url = "https://crates.io/api/v1/crates/version_check/0.9.4/download",
        type = "tar.gz",
        sha256 = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f",
        strip_prefix = "version_check-0.9.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.version_check-0.9.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasi__0_11_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.11.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423",
        strip_prefix = "wasi-0.11.0+wasi-snapshot-preview1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasi-0.11.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmparser__0_86_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.86.0/download",
        type = "tar.gz",
        sha256 = "4bcbfe95447da2aa7ff171857fc8427513eb57c75a729bb190e974dc695e8f5c",
        strip_prefix = "wasmparser-0.86.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.86.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__0_39_1",
        url = "https://crates.io/api/v1/crates/wasmtime/0.39.1/download",
        type = "tar.gz",
        sha256 = "0d10a6853d64e99fffdae80f93a45080475c9267f87743060814dc1186d74618",
        strip_prefix = "wasmtime-0.39.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-0.39.1.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "19b5436ac346b8e61230baeaf18e802db6f0b858",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__0_39_1",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.39.1/download",
        type = "tar.gz",
        sha256 = "3302b33d919e8e33f1717d592c10c3cddccb318d0e1e0bef75178f579686ba94",
        strip_prefix = "wasmtime-cranelift-0.39.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-0.39.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__0_39_1",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.39.1/download",
        type = "tar.gz",
        sha256 = "7c50fb925e8eaa9f8431f9b784ea89a13c703cb445ddfe51cb437596fc34e734",
        strip_prefix = "wasmtime-environ-0.39.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-0.39.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__0_39_1",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.39.1/download",
        type = "tar.gz",
        sha256 = "cad81635f33ab69aa04b386c9d954aef9f6230059f66caf67e55fb65bfd2f3e0",
        strip_prefix = "wasmtime-jit-0.39.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-0.39.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__0_39_1",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/0.39.1/download",
        type = "tar.gz",
        sha256 = "55e23273fddce8cab149a0743c46932bf4910268641397ed86b46854b089f38f",
        strip_prefix = "wasmtime-jit-debug-0.39.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-0.39.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__0_39_1",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.39.1/download",
        type = "tar.gz",
        sha256 = "36b8aafb292502d28dc2d25f44d4a81e229bb2e0cc14ca847dde4448a1a62ae4",
        strip_prefix = "wasmtime-runtime-0.39.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-0.39.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__0_39_1",
        url = "https://crates.io/api/v1/crates/wasmtime-types/0.39.1/download",
        type = "tar.gz",
        sha256 = "dd7edc34f358fc290d12e326de81884422cb94cf74cc305b27979569875332d6",
        strip_prefix = "wasmtime-types-0.39.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-0.39.1.bazel"),
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

    maybe(
        http_archive,
        name = "wasmtime__windows_sys__0_36_1",
        url = "https://crates.io/api/v1/crates/windows-sys/0.36.1/download",
        type = "tar.gz",
        sha256 = "ea04155a16a59f9eab786fe12a4a450e75cdb175f9e0d80da1e17db09f55b8d2",
        strip_prefix = "windows-sys-0.36.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-sys-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_msvc__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.36.1/download",
        type = "tar.gz",
        sha256 = "9bb8c3fd39ade2d67e9874ac4f3db21f0d710bee00fe7cab16949ec184eeaa47",
        strip_prefix = "windows_aarch64_msvc-0.36.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_msvc-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_gnu__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.36.1/download",
        type = "tar.gz",
        sha256 = "180e6ccf01daf4c426b846dfc66db1fc518f074baa793aa7d9b9aaeffad6a3b6",
        strip_prefix = "windows_i686_gnu-0.36.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_gnu-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_msvc__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.36.1/download",
        type = "tar.gz",
        sha256 = "e2e7917148b2812d1eeafaeb22a97e4813dfa60a3f8f78ebe204bcc88f12f024",
        strip_prefix = "windows_i686_msvc-0.36.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_msvc-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnu__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.36.1/download",
        type = "tar.gz",
        sha256 = "4dcd171b8776c41b97521e5da127a2d86ad280114807d0b2ab1e462bc764d9e1",
        strip_prefix = "windows_x86_64_gnu-0.36.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnu-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_msvc__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.36.1/download",
        type = "tar.gz",
        sha256 = "c811ca4a8c853ef420abd8592ba53ddbbac90410fab6903b3e79972a631f7680",
        strip_prefix = "windows_x86_64_msvc-0.36.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_msvc-0.36.1.bazel"),
    )
