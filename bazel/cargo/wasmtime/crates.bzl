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
        name = "wasmtime__anyhow__1_0_69",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.69/download",
        type = "tar.gz",
        sha256 = "224afbd727c3d6e4b90103ece64b8d1b67fbb1973b1046c2281eed3f3803f800",
        strip_prefix = "anyhow-1.0.69",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.69.bazel"),
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
        name = "wasmtime__cranelift_bforest__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.93.0/download",
        type = "tar.gz",
        sha256 = "91b18cf92869a6ae85cde3af4bc4beb6154efa8adef03b18db2ad413d5bce3a2",
        strip_prefix = "cranelift-bforest-0.93.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.93.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.93.0/download",
        type = "tar.gz",
        sha256 = "567d9f6e919bac076f39b902a072686eaf9e6d015baa34d10a61b85105b7af59",
        strip_prefix = "cranelift-codegen-0.93.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.93.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.93.0/download",
        type = "tar.gz",
        sha256 = "1e72b2d5ec8917b2971fe83850187373d0a186db4748a7c23a5f48691b8d92bb",
        strip_prefix = "cranelift-codegen-meta-0.93.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.93.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.93.0/download",
        type = "tar.gz",
        sha256 = "3461c0e0c2ebbeb92533aacb27e219289f60dc84134ef34fbf2d77c9eddf07ef",
        strip_prefix = "cranelift-codegen-shared-0.93.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.93.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.93.0/download",
        type = "tar.gz",
        sha256 = "af684f7f7b01427b1942c7102673322a51b9d6f261e9663dc5e5595786775531",
        strip_prefix = "cranelift-entity-0.93.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.93.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.93.0/download",
        type = "tar.gz",
        sha256 = "7d361ed0373cf5f086b49c499aa72227b646a64f899f32e34312f97c0fadff75",
        strip_prefix = "cranelift-frontend-0.93.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.93.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_isle__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.93.0/download",
        type = "tar.gz",
        sha256 = "cef4f8f3984d772c199a48896d2fb766f96301bf71b371e03a2b99f4f3b7b931",
        strip_prefix = "cranelift-isle-0.93.0",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:cranelift-isle.patch",
        ],
        patch_args = [
            "-p4",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-isle-0.93.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.93.0/download",
        type = "tar.gz",
        sha256 = "f98e4e99a353703475d5acb402b9c13482d41d8a4008b352559bd560afb90363",
        strip_prefix = "cranelift-native-0.93.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.93.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_93_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.93.0/download",
        type = "tar.gz",
        sha256 = "a1e3f4f0779a1b0f286a6ef19835d8665f88326e656a6d7d84fa9a39fa38ca32",
        strip_prefix = "cranelift-wasm-0.93.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.93.0.bazel"),
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
        name = "wasmtime__io_lifetimes__1_0_5",
        url = "https://crates.io/api/v1/crates/io-lifetimes/1.0.5/download",
        type = "tar.gz",
        sha256 = "1abeb7a0dd0f8181267ff8adc397075586500b81b28a73e8a0208b00fc170fb3",
        strip_prefix = "io-lifetimes-1.0.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.io-lifetimes-1.0.5.bazel"),
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
        name = "wasmtime__libc__0_2_139",
        url = "https://crates.io/api/v1/crates/libc/0.2.139/download",
        type = "tar.gz",
        sha256 = "201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c66ca1f5f79",
        strip_prefix = "libc-0.2.139",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.139.bazel"),
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
        name = "wasmtime__paste__1_0_11",
        url = "https://crates.io/api/v1/crates/paste/1.0.11/download",
        type = "tar.gz",
        sha256 = "d01a5bd0424d00070b0098dd17ebca6f961a959dead1dbcbbbc1d1cd8d3deeba",
        strip_prefix = "paste-1.0.11",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.paste-1.0.11.bazel"),
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
        name = "wasmtime__proc_macro2__1_0_51",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.51/download",
        type = "tar.gz",
        sha256 = "5d727cae5b39d21da60fa540906919ad737832fe0b1c165da3a34d6548c849d6",
        strip_prefix = "proc-macro2-1.0.51",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.51.bazel"),
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
        name = "wasmtime__quote__1_0_23",
        url = "https://crates.io/api/v1/crates/quote/1.0.23/download",
        type = "tar.gz",
        sha256 = "8856d8364d252a14d474036ea1358d63c9e6965c8e5c1885c18f73d70bff9c7b",
        strip_prefix = "quote-1.0.23",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.23.bazel"),
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
        name = "wasmtime__rustix__0_36_8",
        url = "https://crates.io/api/v1/crates/rustix/0.36.8/download",
        type = "tar.gz",
        sha256 = "f43abb88211988493c1abb44a70efa56ff0ce98f233b7b276146f1f3f7ba9644",
        strip_prefix = "rustix-0.36.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.36.8.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_152",
        url = "https://crates.io/api/v1/crates/serde/1.0.152/download",
        type = "tar.gz",
        sha256 = "bb7d1f0d3021d347a83e556fc4683dea2ea09d87bccdf88ff5c12545d89d5efb",
        strip_prefix = "serde-1.0.152",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.152.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_152",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.152/download",
        type = "tar.gz",
        sha256 = "af487d118eecd09402d70a5d72551860e788df87b464af30e5ea6a38c75c541e",
        strip_prefix = "serde_derive-1.0.152",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.152.bazel"),
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
        name = "wasmtime__syn__1_0_109",
        url = "https://crates.io/api/v1/crates/syn/1.0.109/download",
        type = "tar.gz",
        sha256 = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237",
        strip_prefix = "syn-1.0.109",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-1.0.109.bazel"),
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
        name = "wasmtime__thiserror__1_0_38",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.38/download",
        type = "tar.gz",
        sha256 = "6a9cd18aa97d5c45c6603caea1da6628790b37f7a34b6ca89522331c5180fed0",
        strip_prefix = "thiserror-1.0.38",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-1.0.38.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror_impl__1_0_38",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.38/download",
        type = "tar.gz",
        sha256 = "1fb327af4685e4d03fa8cbcf1716380da910eeb2bb8be417e7f9fd3fb164f36f",
        strip_prefix = "thiserror-impl-1.0.38",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-impl-1.0.38.bazel"),
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
        name = "wasmtime__unicode_bidi__0_3_10",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.10/download",
        type = "tar.gz",
        sha256 = "d54675592c1dbefd78cbd98db9bacd89886e1ca50692a0692baefffdeb92dd58",
        strip_prefix = "unicode-bidi-0.3.10",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-bidi-0.3.10.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_ident__1_0_6",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.6/download",
        type = "tar.gz",
        sha256 = "84a22b9f218b40614adcb3f4ff08b703773ad44fa9423e4e0d346d5db86e4ebc",
        strip_prefix = "unicode-ident-1.0.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-ident-1.0.6.bazel"),
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
        name = "wasmtime__wasmtime__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime/6.0.0/download",
        type = "tar.gz",
        sha256 = "9010891d0b8e367c3be94ca35d7bc25c1de3240463bb1d61bcfc8c2233c4e0d0",
        strip_prefix = "wasmtime-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-6.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_asm_macros__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-asm-macros/6.0.0/download",
        type = "tar.gz",
        sha256 = "65805c663eaa8257b910666f6d4b056b5c7329750da754ba5df54f3af7dbf35c",
        strip_prefix = "wasmtime-asm-macros-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-asm-macros-6.0.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_0_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "c00d3f0542855a13adffffd5f4ff0177dfbdcb34",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.0.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/6.0.0/download",
        type = "tar.gz",
        sha256 = "3f9065cad6a724fa838ec8497567e0b23acc26417bb2449f8d9d2021925c72f2",
        strip_prefix = "wasmtime-cranelift-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-6.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/6.0.0/download",
        type = "tar.gz",
        sha256 = "4f964bb0b91fa021b8d1b488c62cc77b346c1dae6e3ebd010050b57c1f2ca657",
        strip_prefix = "wasmtime-environ-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-6.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/6.0.0/download",
        type = "tar.gz",
        sha256 = "b7a1d06f5d109539e0168fc74fa65e3948ac8dac3bb8cdbd08b62b36a0ae27b8",
        strip_prefix = "wasmtime-jit-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-6.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/6.0.0/download",
        type = "tar.gz",
        sha256 = "f76ef2e410329aaf8555ac6571d6fe07711be0646dcdf7ff3ab750a42ed2e583",
        strip_prefix = "wasmtime-jit-debug-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-6.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_icache_coherence__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-icache-coherence/6.0.0/download",
        type = "tar.gz",
        sha256 = "ec1fd0f0dd79e7cc0f55b102e320d7c77ab76cd272008a8fd98e25b5777e2636",
        strip_prefix = "wasmtime-jit-icache-coherence-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-icache-coherence-6.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/6.0.0/download",
        type = "tar.gz",
        sha256 = "271aef9b4ca2e953a866293683f2db33cda46f6933c5e431e68d8373723d4ab6",
        strip_prefix = "wasmtime-runtime-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-6.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__6_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-types/6.0.0/download",
        type = "tar.gz",
        sha256 = "b18144b0e45479a830ac9fcebfc71a16d90dc72d8ebd5679700eb3bfe974d7df",
        strip_prefix = "wasmtime-types-6.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-6.0.0.bazel"),
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
        name = "wasmtime__windows_targets__0_42_1",
        url = "https://crates.io/api/v1/crates/windows-targets/0.42.1/download",
        type = "tar.gz",
        sha256 = "8e2522491fbfcd58cc84d47aeb2958948c4b8982e9a2d8a2a35bbaed431390e7",
        strip_prefix = "windows-targets-0.42.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-targets-0.42.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_gnullvm__0_42_1",
        url = "https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.42.1/download",
        type = "tar.gz",
        sha256 = "8c9864e83243fdec7fc9c5444389dcbbfd258f745e7853198f365e3c4968a608",
        strip_prefix = "windows_aarch64_gnullvm-0.42.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_gnullvm-0.42.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_msvc__0_42_1",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.42.1/download",
        type = "tar.gz",
        sha256 = "4c8b1b673ffc16c47a9ff48570a9d85e25d265735c503681332589af6253c6c7",
        strip_prefix = "windows_aarch64_msvc-0.42.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_msvc-0.42.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_gnu__0_42_1",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.42.1/download",
        type = "tar.gz",
        sha256 = "de3887528ad530ba7bdbb1faa8275ec7a1155a45ffa57c37993960277145d640",
        strip_prefix = "windows_i686_gnu-0.42.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_gnu-0.42.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_msvc__0_42_1",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.42.1/download",
        type = "tar.gz",
        sha256 = "bf4d1122317eddd6ff351aa852118a2418ad4214e6613a50e0191f7004372605",
        strip_prefix = "windows_i686_msvc-0.42.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_msvc-0.42.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnu__0_42_1",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.42.1/download",
        type = "tar.gz",
        sha256 = "c1040f221285e17ebccbc2591ffdc2d44ee1f9186324dd3e84e99ac68d699c45",
        strip_prefix = "windows_x86_64_gnu-0.42.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnu-0.42.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnullvm__0_42_1",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.42.1/download",
        type = "tar.gz",
        sha256 = "628bfdf232daa22b0d64fdb62b09fcc36bb01f05a3939e20ab73aaf9470d0463",
        strip_prefix = "windows_x86_64_gnullvm-0.42.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnullvm-0.42.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_msvc__0_42_1",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.42.1/download",
        type = "tar.gz",
        sha256 = "447660ad36a13288b1db4d4248e857b510e8c3a225c822ba4fb748c0aafecffd",
        strip_prefix = "windows_x86_64_msvc-0.42.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_msvc-0.42.1.bazel"),
    )
