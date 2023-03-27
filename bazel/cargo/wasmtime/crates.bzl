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
        name = "wasmtime__ahash__0_7_6",
        url = "https://crates.io/api/v1/crates/ahash/0.7.6/download",
        type = "tar.gz",
        sha256 = "fcb51a0695d8f838b1ee009b3fbf66bda078cd64590202a864a8f3e8c4315c47",
        strip_prefix = "ahash-0.7.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ahash-0.7.6.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__aho_corasick__0_7_20",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.20/download",
        type = "tar.gz",
        sha256 = "cc936419f96fa211c1b9166887b38e5e40b19958e5b895be7c1f93adec7071ac",
        strip_prefix = "aho-corasick-0.7.20",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.aho-corasick-0.7.20.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__anyhow__1_0_70",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.70/download",
        type = "tar.gz",
        sha256 = "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4",
        strip_prefix = "anyhow-1.0.70",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.70.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__arrayvec__0_7_2",
        url = "https://crates.io/api/v1/crates/arrayvec/0.7.2/download",
        type = "tar.gz",
        sha256 = "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6",
        strip_prefix = "arrayvec-0.7.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.arrayvec-0.7.2.bazel"),
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
        name = "wasmtime__bumpalo__3_12_0",
        url = "https://crates.io/api/v1/crates/bumpalo/3.12.0/download",
        type = "tar.gz",
        sha256 = "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535",
        strip_prefix = "bumpalo-3.12.0",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:bumpalo.patch",
        ],
        patch_args = [
            "-p1",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bumpalo-3.12.0.bazel"),
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
        name = "wasmtime__cc__1_0_79",
        url = "https://crates.io/api/v1/crates/cc/1.0.79/download",
        type = "tar.gz",
        sha256 = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f",
        strip_prefix = "cc-1.0.79",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cc-1.0.79.bazel"),
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
        name = "wasmtime__cranelift_bforest__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.93.1/download",
        type = "tar.gz",
        sha256 = "a7379abaacee0f14abf3204a7606118f0465785252169d186337bcb75030815a",
        strip_prefix = "cranelift-bforest-0.93.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.93.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.93.1/download",
        type = "tar.gz",
        sha256 = "9489fa336927df749631f1008007ced2871068544f40a202ce6d93fbf2366a7b",
        strip_prefix = "cranelift-codegen-0.93.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.93.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.93.1/download",
        type = "tar.gz",
        sha256 = "05bbb67da91ec721ed57cef2f7c5ef7728e1cd9bde9ffd3ef8601022e73e3239",
        strip_prefix = "cranelift-codegen-meta-0.93.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.93.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.93.1/download",
        type = "tar.gz",
        sha256 = "418ecb2f36032f6665dc1a5e2060a143dbab41d83b784882e97710e890a7a16d",
        strip_prefix = "cranelift-codegen-shared-0.93.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.93.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.93.1/download",
        type = "tar.gz",
        sha256 = "7cf583f7b093f291005f9fb1323e2c37f6ee4c7909e39ce016b2e8360d461705",
        strip_prefix = "cranelift-entity-0.93.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.93.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.93.1/download",
        type = "tar.gz",
        sha256 = "0b66bf9e916f57fbbd0f7703ec6286f4624866bf45000111627c70d272c8dda1",
        strip_prefix = "cranelift-frontend-0.93.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.93.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_isle__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.93.1/download",
        type = "tar.gz",
        sha256 = "649782a39ce99798dd6b4029e2bb318a2fbeaade1b4fa25330763c10c65bc358",
        strip_prefix = "cranelift-isle-0.93.1",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:cranelift-isle.patch",
        ],
        patch_args = [
            "-p4",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-isle-0.93.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.93.1/download",
        type = "tar.gz",
        sha256 = "937e021e089c51f9749d09e7ad1c4f255c2f8686cb8c3df63a34b3ec9921bc41",
        strip_prefix = "cranelift-native-0.93.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.93.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_93_1",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.93.1/download",
        type = "tar.gz",
        sha256 = "d850cf6775477747c9dfda9ae23355dd70512ffebc70cf82b85a5b111ae668b5",
        strip_prefix = "cranelift-wasm-0.93.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.93.1.bazel"),
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
        name = "wasmtime__either__1_8_1",
        url = "https://crates.io/api/v1/crates/either/1.8.1/download",
        type = "tar.gz",
        sha256 = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91",
        strip_prefix = "either-1.8.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.either-1.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__env_logger__0_9_3",
        url = "https://crates.io/api/v1/crates/env_logger/0.9.3/download",
        type = "tar.gz",
        sha256 = "a12e6657c4c97ebab115a42dcee77225f7f482cdd841cf7088c657a42e9e00e7",
        strip_prefix = "env_logger-0.9.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.env_logger-0.9.3.bazel"),
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
        name = "wasmtime__form_urlencoded__1_1_0",
        url = "https://crates.io/api/v1/crates/form_urlencoded/1.1.0/download",
        type = "tar.gz",
        sha256 = "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8",
        strip_prefix = "form_urlencoded-1.1.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.form_urlencoded-1.1.0.bazel"),
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
        name = "wasmtime__getrandom__0_2_8",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.8/download",
        type = "tar.gz",
        sha256 = "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31",
        strip_prefix = "getrandom-0.2.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.getrandom-0.2.8.bazel"),
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
        name = "wasmtime__hermit_abi__0_3_1",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.3.1/download",
        type = "tar.gz",
        sha256 = "fed44880c466736ef9a5c5b5facefb5ed0785676d0c02d612db14e54f0d84286",
        strip_prefix = "hermit-abi-0.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hermit-abi-0.3.1.bazel"),
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
        name = "wasmtime__idna__0_3_0",
        url = "https://crates.io/api/v1/crates/idna/0.3.0/download",
        type = "tar.gz",
        sha256 = "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6",
        strip_prefix = "idna-0.3.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.idna-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__indexmap__1_9_2",
        url = "https://crates.io/api/v1/crates/indexmap/1.9.2/download",
        type = "tar.gz",
        sha256 = "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399",
        strip_prefix = "indexmap-1.9.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.indexmap-1.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__io_lifetimes__1_0_8",
        url = "https://crates.io/api/v1/crates/io-lifetimes/1.0.8/download",
        type = "tar.gz",
        sha256 = "0dd6da19f25979c7270e70fa95ab371ec3b701cd0eefc47667a09785b3c59155",
        strip_prefix = "io-lifetimes-1.0.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.io-lifetimes-1.0.8.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__itertools__0_10_5",
        url = "https://crates.io/api/v1/crates/itertools/0.10.5/download",
        type = "tar.gz",
        sha256 = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473",
        strip_prefix = "itertools-0.10.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.itertools-0.10.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__libc__0_2_140",
        url = "https://crates.io/api/v1/crates/libc/0.2.140/download",
        type = "tar.gz",
        sha256 = "99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c",
        strip_prefix = "libc-0.2.140",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.140.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__linux_raw_sys__0_1_4",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.1.4/download",
        type = "tar.gz",
        sha256 = "f051f77a7c8e6957c0696eac88f26b0117e54f52d3fc682ab19397a8812846a4",
        strip_prefix = "linux-raw-sys-0.1.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.linux-raw-sys-0.1.4.bazel"),
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
        name = "wasmtime__memfd__0_6_2",
        url = "https://crates.io/api/v1/crates/memfd/0.6.2/download",
        type = "tar.gz",
        sha256 = "b20a59d985586e4a5aef64564ac77299f8586d8be6cf9106a5a40207e8908efb",
        strip_prefix = "memfd-0.6.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memfd-0.6.2.bazel"),
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
        name = "wasmtime__object__0_29_0",
        url = "https://crates.io/api/v1/crates/object/0.29.0/download",
        type = "tar.gz",
        sha256 = "21158b2c33aa6d4561f1c0a6ea283ca92bc54802a93b263e910746d679a7eb53",
        strip_prefix = "object-0.29.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.object-0.29.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__once_cell__1_17_1",
        url = "https://crates.io/api/v1/crates/once_cell/1.17.1/download",
        type = "tar.gz",
        sha256 = "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3",
        strip_prefix = "once_cell-1.17.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.once_cell-1.17.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__paste__1_0_12",
        url = "https://crates.io/api/v1/crates/paste/1.0.12/download",
        type = "tar.gz",
        sha256 = "9f746c4065a8fa3fe23974dd82f15431cc8d40779821001404d10d2e79ca7d79",
        strip_prefix = "paste-1.0.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.paste-1.0.12.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__percent_encoding__2_2_0",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.2.0/download",
        type = "tar.gz",
        sha256 = "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e",
        strip_prefix = "percent-encoding-2.2.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.percent-encoding-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__ppv_lite86__0_2_17",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.17/download",
        type = "tar.gz",
        sha256 = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de",
        strip_prefix = "ppv-lite86-0.2.17",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ppv-lite86-0.2.17.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__proc_macro2__1_0_52",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.52/download",
        type = "tar.gz",
        sha256 = "1d0e1ae9e836cc3beddd63db0df682593d7e2d3d891ae8c9083d2113e1744224",
        strip_prefix = "proc-macro2-1.0.52",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.52.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__psm__0_1_21",
        url = "https://crates.io/api/v1/crates/psm/0.1.21/download",
        type = "tar.gz",
        sha256 = "5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874",
        strip_prefix = "psm-0.1.21",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.psm-0.1.21.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__quote__1_0_26",
        url = "https://crates.io/api/v1/crates/quote/1.0.26/download",
        type = "tar.gz",
        sha256 = "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc",
        strip_prefix = "quote-1.0.26",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.26.bazel"),
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
        name = "wasmtime__rand_core__0_6_4",
        url = "https://crates.io/api/v1/crates/rand_core/0.6.4/download",
        type = "tar.gz",
        sha256 = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c",
        strip_prefix = "rand_core-0.6.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rand_core-0.6.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regalloc2__0_5_1",
        url = "https://crates.io/api/v1/crates/regalloc2/0.5.1/download",
        type = "tar.gz",
        sha256 = "300d4fbfb40c1c66a78ba3ddd41c1110247cf52f97b87d0f2fc9209bd49b030c",
        strip_prefix = "regalloc2-0.5.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc2-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex__1_7_1",
        url = "https://crates.io/api/v1/crates/regex/1.7.1/download",
        type = "tar.gz",
        sha256 = "48aaa5748ba571fb95cd2c85c09f629215d3a6ece942baa100950af03a34f733",
        strip_prefix = "regex-1.7.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-1.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex_syntax__0_6_28",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.28/download",
        type = "tar.gz",
        sha256 = "456c603be3e8d448b072f410900c09faf164fbce2d480456f50eea6e25f9c848",
        strip_prefix = "regex-syntax-0.6.28",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-syntax-0.6.28.bazel"),
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
        name = "wasmtime__rustix__0_36_10",
        url = "https://crates.io/api/v1/crates/rustix/0.36.10/download",
        type = "tar.gz",
        sha256 = "2fe885c3a125aa45213b68cc1472a49880cb5923dc23f522ad2791b882228778",
        strip_prefix = "rustix-0.36.10",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.36.10.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_157",
        url = "https://crates.io/api/v1/crates/serde/1.0.157/download",
        type = "tar.gz",
        sha256 = "707de5fcf5df2b5788fca98dd7eab490bc2fd9b7ef1404defc462833b83f25ca",
        strip_prefix = "serde-1.0.157",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.157.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_157",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.157/download",
        type = "tar.gz",
        sha256 = "78997f4555c22a7971214540c4a661291970619afd56de19f77e0de86296e1e5",
        strip_prefix = "serde_derive-1.0.157",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.157.bazel"),
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
        name = "wasmtime__smallvec__1_10_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.10.0/download",
        type = "tar.gz",
        sha256 = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0",
        strip_prefix = "smallvec-1.10.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.smallvec-1.10.0.bazel"),
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
        name = "wasmtime__syn__2_0_2",
        url = "https://crates.io/api/v1/crates/syn/2.0.2/download",
        type = "tar.gz",
        sha256 = "59d3276aee1fa0c33612917969b5172b5be2db051232a6e4826f1a1a9191b045",
        strip_prefix = "syn-2.0.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-2.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__target_lexicon__0_12_6",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.6/download",
        type = "tar.gz",
        sha256 = "8ae9980cab1db3fceee2f6c6f643d5d8de2997c58ee8d25fb0cc8a9e9e7348e5",
        strip_prefix = "target-lexicon-0.12.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.target-lexicon-0.12.6.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__termcolor__1_2_0",
        url = "https://crates.io/api/v1/crates/termcolor/1.2.0/download",
        type = "tar.gz",
        sha256 = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6",
        strip_prefix = "termcolor-1.2.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.termcolor-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror__1_0_40",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.40/download",
        type = "tar.gz",
        sha256 = "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac",
        strip_prefix = "thiserror-1.0.40",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-1.0.40.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror_impl__1_0_40",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.40/download",
        type = "tar.gz",
        sha256 = "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f",
        strip_prefix = "thiserror-impl-1.0.40",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-impl-1.0.40.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__tinyvec__1_6_0",
        url = "https://crates.io/api/v1/crates/tinyvec/1.6.0/download",
        type = "tar.gz",
        sha256 = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50",
        strip_prefix = "tinyvec-1.6.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.tinyvec-1.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__tinyvec_macros__0_1_1",
        url = "https://crates.io/api/v1/crates/tinyvec_macros/0.1.1/download",
        type = "tar.gz",
        sha256 = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20",
        strip_prefix = "tinyvec_macros-0.1.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.tinyvec_macros-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_bidi__0_3_12",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.12/download",
        type = "tar.gz",
        sha256 = "7d502c968c6a838ead8e69b2ee18ec708802f99db92a0d156705ec9ef801993b",
        strip_prefix = "unicode-bidi-0.3.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-bidi-0.3.12.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_ident__1_0_8",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.8/download",
        type = "tar.gz",
        sha256 = "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4",
        strip_prefix = "unicode-ident-1.0.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-ident-1.0.8.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_normalization__0_1_22",
        url = "https://crates.io/api/v1/crates/unicode-normalization/0.1.22/download",
        type = "tar.gz",
        sha256 = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921",
        strip_prefix = "unicode-normalization-0.1.22",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-normalization-0.1.22.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__url__2_3_1",
        url = "https://crates.io/api/v1/crates/url/2.3.1/download",
        type = "tar.gz",
        sha256 = "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643",
        strip_prefix = "url-2.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.url-2.3.1.bazel"),
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
        name = "wasmtime__wasmparser__0_100_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.100.0/download",
        type = "tar.gz",
        sha256 = "64b20236ab624147dfbb62cf12a19aaf66af0e41b8398838b66e997d07d269d4",
        strip_prefix = "wasmparser-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime/6.0.1/download",
        type = "tar.gz",
        sha256 = "f6e89f9819523447330ffd70367ef4a18d8c832e24e8150fe054d1d912841632",
        strip_prefix = "wasmtime-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-6.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_asm_macros__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime-asm-macros/6.0.1/download",
        type = "tar.gz",
        sha256 = "9bd3a5e46c198032da934469f3a6e48649d1f9142438e4fd4617b68a35644b8a",
        strip_prefix = "wasmtime-asm-macros-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-asm-macros-6.0.1.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_0_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "b6bc33da2bcb466d377fb02f5aa764a667d08e0a",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.0.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/6.0.1/download",
        type = "tar.gz",
        sha256 = "59b2c92a08c0db6efffd88fdc97d7aa9c7c63b03edb0971dbca745469f820e8c",
        strip_prefix = "wasmtime-cranelift-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-6.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/6.0.1/download",
        type = "tar.gz",
        sha256 = "9a6db9fc52985ba06ca601f2ff0ff1f526c5d724c7ac267b47326304b0c97883",
        strip_prefix = "wasmtime-environ-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-6.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/6.0.1/download",
        type = "tar.gz",
        sha256 = "b77e3a52cd84d0f7f18554afa8060cfe564ccac61e3b0802d3fd4084772fa5f6",
        strip_prefix = "wasmtime-jit-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-6.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/6.0.1/download",
        type = "tar.gz",
        sha256 = "d0245e8a9347017c7185a72e215218a802ff561545c242953c11ba00fccc930f",
        strip_prefix = "wasmtime-jit-debug-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-6.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_icache_coherence__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-icache-coherence/6.0.1/download",
        type = "tar.gz",
        sha256 = "67d412e9340ab1c83867051d8d1d7c90aa8c9afc91da086088068e2734e25064",
        strip_prefix = "wasmtime-jit-icache-coherence-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-icache-coherence-6.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/6.0.1/download",
        type = "tar.gz",
        sha256 = "d594e791b5fdd4dbaf8cf7ae62f2e4ff85018ce90f483ca6f42947688e48827d",
        strip_prefix = "wasmtime-runtime-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-6.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__6_0_1",
        url = "https://crates.io/api/v1/crates/wasmtime-types/6.0.1/download",
        type = "tar.gz",
        sha256 = "a6688d6f96d4dbc1f89fab626c56c1778936d122b5f4ae7a57c2eb42b8d982e2",
        strip_prefix = "wasmtime-types-6.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-6.0.1.bazel"),
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
        name = "wasmtime__windows_sys__0_42_0",
        url = "https://crates.io/api/v1/crates/windows-sys/0.42.0/download",
        type = "tar.gz",
        sha256 = "5a3e1820f08b8513f676f7ab6c1f99ff312fb97b553d30ff4dd86f9f15728aa7",
        strip_prefix = "windows-sys-0.42.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-sys-0.42.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_sys__0_45_0",
        url = "https://crates.io/api/v1/crates/windows-sys/0.45.0/download",
        type = "tar.gz",
        sha256 = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0",
        strip_prefix = "windows-sys-0.45.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-sys-0.45.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_targets__0_42_2",
        url = "https://crates.io/api/v1/crates/windows-targets/0.42.2/download",
        type = "tar.gz",
        sha256 = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071",
        strip_prefix = "windows-targets-0.42.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-targets-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_gnullvm__0_42_2",
        url = "https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.42.2/download",
        type = "tar.gz",
        sha256 = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8",
        strip_prefix = "windows_aarch64_gnullvm-0.42.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_gnullvm-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_msvc__0_42_2",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.42.2/download",
        type = "tar.gz",
        sha256 = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43",
        strip_prefix = "windows_aarch64_msvc-0.42.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_msvc-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_gnu__0_42_2",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.42.2/download",
        type = "tar.gz",
        sha256 = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f",
        strip_prefix = "windows_i686_gnu-0.42.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_gnu-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_msvc__0_42_2",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.42.2/download",
        type = "tar.gz",
        sha256 = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060",
        strip_prefix = "windows_i686_msvc-0.42.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_msvc-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnu__0_42_2",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.42.2/download",
        type = "tar.gz",
        sha256 = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36",
        strip_prefix = "windows_x86_64_gnu-0.42.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnu-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnullvm__0_42_2",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.42.2/download",
        type = "tar.gz",
        sha256 = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3",
        strip_prefix = "windows_x86_64_gnullvm-0.42.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnullvm-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_msvc__0_42_2",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.42.2/download",
        type = "tar.gz",
        sha256 = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0",
        strip_prefix = "windows_x86_64_msvc-0.42.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_msvc-0.42.2.bazel"),
    )
