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
        name = "wasmtime__cranelift_bforest__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.85.1/download",
        type = "tar.gz",
        sha256 = "7901fbba05decc537080b07cb3f1cadf53be7b7602ca8255786288a8692ae29a",
        strip_prefix = "cranelift-bforest-0.85.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.85.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.85.1/download",
        type = "tar.gz",
        sha256 = "37ba1b45d243a4a28e12d26cd5f2507da74e77c45927d40de8b6ffbf088b46b5",
        strip_prefix = "cranelift-codegen-0.85.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.85.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.85.1/download",
        type = "tar.gz",
        sha256 = "54cc30032171bf230ce22b99c07c3a1de1221cb5375bd6dbe6dbe77d0eed743c",
        strip_prefix = "cranelift-codegen-meta-0.85.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.85.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.85.1/download",
        type = "tar.gz",
        sha256 = "a23f2672426d2bb4c9c3ef53e023076cfc4d8922f0eeaebaf372c92fae8b5c69",
        strip_prefix = "cranelift-codegen-shared-0.85.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.85.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.85.1/download",
        type = "tar.gz",
        sha256 = "886c59a5e0de1f06dbb7da80db149c75de10d5e2caca07cdd9fef8a5918a6336",
        strip_prefix = "cranelift-entity-0.85.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.85.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.85.1/download",
        type = "tar.gz",
        sha256 = "ace74eeca11c439a9d4ed1a5cb9df31a54cd0f7fbddf82c8ce4ea8e9ad2a8fe0",
        strip_prefix = "cranelift-frontend-0.85.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.85.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_isle__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.85.1/download",
        type = "tar.gz",
        sha256 = "db1ae52a5cc2cad0d86fdd3dcb16b7217d2f1e65ab4f5814aa4f014ad335fa43",
        strip_prefix = "cranelift-isle-0.85.1",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:cranelift-isle.patch",
        ],
        patch_args = [
            "-p4",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-isle-0.85.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.85.1/download",
        type = "tar.gz",
        sha256 = "dadcfb7852900780d37102bce5698bcd401736403f07b52e714ff7a180e0e22f",
        strip_prefix = "cranelift-native-0.85.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.85.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_85_1",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.85.1/download",
        type = "tar.gz",
        sha256 = "c84e3410960389110b88f97776f39f6d2c8becdaa4cd59e390e6b76d9d0e7190",
        strip_prefix = "cranelift-wasm-0.85.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.85.1.bazel"),
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
        name = "wasmtime__hashbrown__0_12_2",
        url = "https://crates.io/api/v1/crates/hashbrown/0.12.2/download",
        type = "tar.gz",
        sha256 = "607c8a29735385251a339424dd462993c0fed8fa09d378f259377df08c126022",
        strip_prefix = "hashbrown-0.12.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hashbrown-0.12.2.bazel"),
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
        name = "wasmtime__io_lifetimes__0_5_3",
        url = "https://crates.io/api/v1/crates/io-lifetimes/0.5.3/download",
        type = "tar.gz",
        sha256 = "ec58677acfea8a15352d42fc87d11d63596ade9239e0a7c9352914417515dbe6",
        strip_prefix = "io-lifetimes-0.5.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.io-lifetimes-0.5.3.bazel"),
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
        name = "wasmtime__linux_raw_sys__0_0_42",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.0.42/download",
        type = "tar.gz",
        sha256 = "5284f00d480e1c39af34e72f8ad60b94f47007e3481cd3b731c1d67190ddc7b7",
        strip_prefix = "linux-raw-sys-0.0.42",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.linux-raw-sys-0.0.42.bazel"),
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
        name = "wasmtime__proc_macro2__1_0_40",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.40/download",
        type = "tar.gz",
        sha256 = "dd96a1e8ed2596c337f8eae5f24924ec83f5ad5ab21ea8e455d3566c69fbcaf7",
        strip_prefix = "proc-macro2-1.0.40",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.40.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__psm__0_1_19",
        url = "https://crates.io/api/v1/crates/psm/0.1.19/download",
        type = "tar.gz",
        sha256 = "accd89aa18fbf9533a581355a22438101fe9c2ed8c9e2f0dcf520552a3afddf2",
        strip_prefix = "psm-0.1.19",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.psm-0.1.19.bazel"),
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
        name = "wasmtime__regalloc2__0_2_3",
        url = "https://crates.io/api/v1/crates/regalloc2/0.2.3/download",
        type = "tar.gz",
        sha256 = "4a8d23b35d7177df3b9d31ed8a9ab4bf625c668be77a319d4f5efd4a5257701c",
        strip_prefix = "regalloc2-0.2.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc2-0.2.3.bazel"),
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
        name = "wasmtime__rustix__0_33_7",
        url = "https://crates.io/api/v1/crates/rustix/0.33.7/download",
        type = "tar.gz",
        sha256 = "938a344304321a9da4973b9ff4f9f8db9caf4597dfd9dda6a60b523340a0fff0",
        strip_prefix = "rustix-0.33.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.33.7.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_139",
        url = "https://crates.io/api/v1/crates/serde/1.0.139/download",
        type = "tar.gz",
        sha256 = "0171ebb889e45aa68b44aee0859b3eede84c6f5f5c228e6f140c0b2a0a46cad6",
        strip_prefix = "serde-1.0.139",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.139.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_139",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.139/download",
        type = "tar.gz",
        sha256 = "dc1d3230c1de7932af58ad8ffbe1d784bd55efd5a9d84ac24f69c72d83543dfb",
        strip_prefix = "serde_derive-1.0.139",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.139.bazel"),
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
        name = "wasmtime__unicode_ident__1_0_1",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.1/download",
        type = "tar.gz",
        sha256 = "5bd2fe26506023ed7b5e1e315add59d6f584c621d037f9368fea9cfb988f368c",
        strip_prefix = "unicode-ident-1.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-ident-1.0.1.bazel"),
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
        name = "wasmtime__wasmparser__0_85_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.85.0/download",
        type = "tar.gz",
        sha256 = "570460c58b21e9150d2df0eaaedbb7816c34bcec009ae0dcc976e40ba81463e7",
        strip_prefix = "wasmparser-0.85.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.85.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__0_38_1",
        url = "https://crates.io/api/v1/crates/wasmtime/0.38.1/download",
        type = "tar.gz",
        sha256 = "e76e2b2833bb0ece666ccdbed7b71b617d447da11f1bb61f4f2bab2648f745ee",
        strip_prefix = "wasmtime-0.38.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-0.38.1.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "9e2adfb34531610d691f74dd3f559bc5b800eb02",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__0_38_1",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.38.1/download",
        type = "tar.gz",
        sha256 = "5dc0f80afa1ce97083a7168e6b6948d015d6237369e9f4a511d38c9c4ac8fbb9",
        strip_prefix = "wasmtime-cranelift-0.38.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-0.38.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__0_38_1",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.38.1/download",
        type = "tar.gz",
        sha256 = "0816d9365196f1f447060087e0f87239ccded830bd54970a1168b0c9c8e824c9",
        strip_prefix = "wasmtime-environ-0.38.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-0.38.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__0_38_1",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.38.1/download",
        type = "tar.gz",
        sha256 = "5c687f33cfa0f89ec1646929d0ff102087052cf9f0d15533de56526b0da0d1b3",
        strip_prefix = "wasmtime-jit-0.38.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-0.38.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__0_38_1",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/0.38.1/download",
        type = "tar.gz",
        sha256 = "b252d1d025f94f3954ba2111f12f3a22826a0764a11c150c2d46623115a69e27",
        strip_prefix = "wasmtime-jit-debug-0.38.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-0.38.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__0_38_1",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.38.1/download",
        type = "tar.gz",
        sha256 = "ace251693103c9facbbd7df87a29a75e68016e48bc83c09133f2fda6b575e0ab",
        strip_prefix = "wasmtime-runtime-0.38.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-0.38.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__0_38_1",
        url = "https://crates.io/api/v1/crates/wasmtime-types/0.38.1/download",
        type = "tar.gz",
        sha256 = "d129b0487a95986692af8708ffde9c50b0568dcefd79200941d475713b4f40bb",
        strip_prefix = "wasmtime-types-0.38.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-0.38.1.bazel"),
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
