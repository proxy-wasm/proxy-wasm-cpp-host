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
        name = "wasmtime__aho_corasick__0_7_19",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.19/download",
        type = "tar.gz",
        sha256 = "b4f55bd91a0978cbfd91c457a164bab8b4001c833b7f323132c0a4e1922dd44e",
        strip_prefix = "aho-corasick-0.7.19",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.aho-corasick-0.7.19.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__anyhow__1_0_66",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.66/download",
        type = "tar.gz",
        sha256 = "216261ddc8289130e551ddcd5ce8a064710c0d064a4d2895c67151c92b5443f6",
        strip_prefix = "anyhow-1.0.66",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.66.bazel"),
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
        name = "wasmtime__bumpalo__3_11_1",
        url = "https://crates.io/api/v1/crates/bumpalo/3.11.1/download",
        type = "tar.gz",
        sha256 = "572f695136211188308f16ad2ca5c851a712c464060ae6974944458eb83880ba",
        strip_prefix = "bumpalo-3.11.1",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:bumpalo.patch",
        ],
        patch_args = [
            "-p1",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bumpalo-3.11.1.bazel"),
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
        name = "wasmtime__cranelift_bforest__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.89.0/download",
        type = "tar.gz",
        sha256 = "be5e1ee4c22871d24a95196ea7047d58c1d978e46c88037d3d397b3b3e0af360",
        strip_prefix = "cranelift-bforest-0.89.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.89.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.89.0/download",
        type = "tar.gz",
        sha256 = "70f600a52d59eed56a85f33750873b3b42d61e35ca777cd792369893f9e1f9dd",
        strip_prefix = "cranelift-codegen-0.89.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.89.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.89.0/download",
        type = "tar.gz",
        sha256 = "e8418218d0953d73e9b96e9d9ffec56145efa4f18988251530b5872ae4410563",
        strip_prefix = "cranelift-codegen-meta-0.89.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.89.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.89.0/download",
        type = "tar.gz",
        sha256 = "f01be0cfd40aba59153236ab4b99062131b5bbe6f9f3d4bcb238bd2f96ff5262",
        strip_prefix = "cranelift-codegen-shared-0.89.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.89.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.89.0/download",
        type = "tar.gz",
        sha256 = "ddae4fec5d6859233ffa175b61d269443c473b3971a2c3e69008c8d3e83d5825",
        strip_prefix = "cranelift-entity-0.89.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.89.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.89.0/download",
        type = "tar.gz",
        sha256 = "f2cc3deb0df97748434cf9f7e404f1f5134f6a253fc9a6bca25c5cd6804c08d3",
        strip_prefix = "cranelift-frontend-0.89.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.89.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_isle__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.89.0/download",
        type = "tar.gz",
        sha256 = "fc3bb54287de9c36ba354eb849fefb77b5e73955058745fd08f12cfdfa181866",
        strip_prefix = "cranelift-isle-0.89.0",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:cranelift-isle.patch",
        ],
        patch_args = [
            "-p4",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-isle-0.89.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.89.0/download",
        type = "tar.gz",
        sha256 = "d8c2a4f2efdce1de1f94e74f12b3b4144e3bcafa6011338b87388325d72d2120",
        strip_prefix = "cranelift-native-0.89.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.89.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_89_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.89.0/download",
        type = "tar.gz",
        sha256 = "f918c37eb01f5b5ccc632e0ef3b4bf9ee03b5d4c267d3d2d3b62720a6bce0180",
        strip_prefix = "cranelift-wasm-0.89.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.89.0.bazel"),
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
        name = "wasmtime__crossbeam_channel__0_5_6",
        url = "https://crates.io/api/v1/crates/crossbeam-channel/0.5.6/download",
        type = "tar.gz",
        sha256 = "c2dd04ddaf88237dc3b8d8f9a3c1004b506b54b3313403944054d23c0870c521",
        strip_prefix = "crossbeam-channel-0.5.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crossbeam-channel-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crossbeam_deque__0_8_2",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.8.2/download",
        type = "tar.gz",
        sha256 = "715e8152b692bba2d374b53d4875445368fdf21a94751410af607a5ac677d1fc",
        strip_prefix = "crossbeam-deque-0.8.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crossbeam-deque-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crossbeam_epoch__0_9_11",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.9.11/download",
        type = "tar.gz",
        sha256 = "f916dfc5d356b0ed9dae65f1db9fc9770aa2851d2662b988ccf4fe3516e86348",
        strip_prefix = "crossbeam-epoch-0.9.11",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crossbeam-epoch-0.9.11.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crossbeam_utils__0_8_12",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.8.12/download",
        type = "tar.gz",
        sha256 = "edbafec5fa1f196ca66527c1b12c2ec4745ca14b50f1ad8f9f6f720b55d11fac",
        strip_prefix = "crossbeam-utils-0.8.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crossbeam-utils-0.8.12.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__either__1_8_0",
        url = "https://crates.io/api/v1/crates/either/1.8.0/download",
        type = "tar.gz",
        sha256 = "90e5c1c8368803113bf0c9584fc495a58b86dc8a29edbf8fe877d21d9507e797",
        strip_prefix = "either-1.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.either-1.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__env_logger__0_9_1",
        url = "https://crates.io/api/v1/crates/env_logger/0.9.1/download",
        type = "tar.gz",
        sha256 = "c90bf5f19754d10198ccb95b70664fc925bd1fc090a0fd9a6ebc54acc8cd6272",
        strip_prefix = "env_logger-0.9.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.env_logger-0.9.1.bazel"),
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
        name = "wasmtime__indexmap__1_9_1",
        url = "https://crates.io/api/v1/crates/indexmap/1.9.1/download",
        type = "tar.gz",
        sha256 = "10a35a97730320ffe8e2d410b5d3b69279b98d2c14bdb8b70ea89ecf7888d41e",
        strip_prefix = "indexmap-1.9.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.indexmap-1.9.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__io_lifetimes__0_7_4",
        url = "https://crates.io/api/v1/crates/io-lifetimes/0.7.4/download",
        type = "tar.gz",
        sha256 = "e6e481ccbe3dea62107216d0d1138bb8ad8e5e5c43009a098bd1990272c497b0",
        strip_prefix = "io-lifetimes-0.7.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.io-lifetimes-0.7.4.bazel"),
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
        name = "wasmtime__libc__0_2_137",
        url = "https://crates.io/api/v1/crates/libc/0.2.137/download",
        type = "tar.gz",
        sha256 = "fc7fcc620a3bff7cdd7a365be3376c97191aeaccc2a603e600951e452615bf89",
        strip_prefix = "libc-0.2.137",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.137.bazel"),
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
        name = "wasmtime__num_cpus__1_13_1",
        url = "https://crates.io/api/v1/crates/num_cpus/1.13.1/download",
        type = "tar.gz",
        sha256 = "19e64526ebdee182341572e50e9ad03965aa510cd94427a4549448f285e957a1",
        strip_prefix = "num_cpus-1.13.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.num_cpus-1.13.1.bazel"),
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
        name = "wasmtime__once_cell__1_15_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.15.0/download",
        type = "tar.gz",
        sha256 = "e82dad04139b71a90c080c8463fe0dc7902db5192d939bd0950f074d014339e1",
        strip_prefix = "once_cell-1.15.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.once_cell-1.15.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__paste__1_0_9",
        url = "https://crates.io/api/v1/crates/paste/1.0.9/download",
        type = "tar.gz",
        sha256 = "b1de2e551fb905ac83f73f7aedf2f0cb4a0da7e35efa24a202a936269f1f18e1",
        strip_prefix = "paste-1.0.9",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.paste-1.0.9.bazel"),
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
        name = "wasmtime__proc_macro2__1_0_47",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.47/download",
        type = "tar.gz",
        sha256 = "5ea3d908b0e36316caf9e9e2c4625cdde190a7e6f440d794667ed17a1855e725",
        strip_prefix = "proc-macro2-1.0.47",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.47.bazel"),
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
        name = "wasmtime__quote__1_0_21",
        url = "https://crates.io/api/v1/crates/quote/1.0.21/download",
        type = "tar.gz",
        sha256 = "bbe448f377a7d6961e30f5955f9b8d106c3f5e449d493ee1b125c1d43c2b5179",
        strip_prefix = "quote-1.0.21",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.21.bazel"),
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
        name = "wasmtime__rayon__1_5_3",
        url = "https://crates.io/api/v1/crates/rayon/1.5.3/download",
        type = "tar.gz",
        sha256 = "bd99e5772ead8baa5215278c9b15bf92087709e9c1b2d1f97cdb5a183c933a7d",
        strip_prefix = "rayon-1.5.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rayon-1.5.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rayon_core__1_9_3",
        url = "https://crates.io/api/v1/crates/rayon-core/1.9.3/download",
        type = "tar.gz",
        sha256 = "258bcdb5ac6dad48491bb2992db6b7cf74878b0384908af124823d118c99683f",
        strip_prefix = "rayon-core-1.9.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rayon-core-1.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regalloc2__0_4_1",
        url = "https://crates.io/api/v1/crates/regalloc2/0.4.1/download",
        type = "tar.gz",
        sha256 = "69025b4a161879ba90719837c06621c3d73cffa147a000aeacf458f6a9572485",
        strip_prefix = "regalloc2-0.4.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc2-0.4.1.bazel"),
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
        name = "wasmtime__rustc_demangle__0_1_21",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.21/download",
        type = "tar.gz",
        sha256 = "7ef03e0a2b150c7a90d01faf6254c9c48a41e95fb2a8c2ac1c6f0d2b9aefc342",
        strip_prefix = "rustc-demangle-0.1.21",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustc-demangle-0.1.21.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rustix__0_35_12",
        url = "https://crates.io/api/v1/crates/rustix/0.35.12/download",
        type = "tar.gz",
        sha256 = "985947f9b6423159c4726323f373be0a21bdb514c5af06a849cb3d2dce2d01e8",
        strip_prefix = "rustix-0.35.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.35.12.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_147",
        url = "https://crates.io/api/v1/crates/serde/1.0.147/download",
        type = "tar.gz",
        sha256 = "d193d69bae983fc11a79df82342761dfbf28a99fc8d203dca4c3c1b590948965",
        strip_prefix = "serde-1.0.147",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.147.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_147",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.147/download",
        type = "tar.gz",
        sha256 = "4f1d362ca8fc9c3e3a7484440752472d68a6caa98f1ab81d99b5dfe517cec852",
        strip_prefix = "serde_derive-1.0.147",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.147.bazel"),
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
        name = "wasmtime__syn__1_0_103",
        url = "https://crates.io/api/v1/crates/syn/1.0.103/download",
        type = "tar.gz",
        sha256 = "a864042229133ada95abf3b54fdc62ef5ccabe9515b64717bcb9a1919e59445d",
        strip_prefix = "syn-1.0.103",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-1.0.103.bazel"),
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
        name = "wasmtime__thiserror__1_0_37",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.37/download",
        type = "tar.gz",
        sha256 = "10deb33631e3c9018b9baf9dcbbc4f737320d2b576bac10f6aefa048fa407e3e",
        strip_prefix = "thiserror-1.0.37",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-1.0.37.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror_impl__1_0_37",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.37/download",
        type = "tar.gz",
        sha256 = "982d17546b47146b28f7c22e3d08465f6b8903d0ea13c1660d9d84a6e7adcdbb",
        strip_prefix = "thiserror-impl-1.0.37",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-impl-1.0.37.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_ident__1_0_5",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.5/download",
        type = "tar.gz",
        sha256 = "6ceab39d59e4c9499d4e5a8ee0e2735b891bb7308ac83dfb4e80cad195c9f6f3",
        strip_prefix = "unicode-ident-1.0.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-ident-1.0.5.bazel"),
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
        name = "wasmtime__wasmparser__0_92_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.92.0/download",
        type = "tar.gz",
        sha256 = "7da34cec2a8c23db906cdf8b26e988d7a7f0d549eb5d51299129647af61a1b37",
        strip_prefix = "wasmparser-0.92.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.92.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__2_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime/2.0.0/download",
        type = "tar.gz",
        sha256 = "f5fc5bb3329415030796cfa5530b2481ccef5c4f1e5150733ba94318ab004fe1",
        strip_prefix = "wasmtime-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_asm_macros__2_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-asm-macros/2.0.0/download",
        type = "tar.gz",
        sha256 = "db36545ff0940ad9bf4e9ab0ec2a4e1eaa5ebe2aa9227bcbc4af905375d9e482",
        strip_prefix = "wasmtime-asm-macros-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-asm-macros-2.0.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "ff8c568eeed3918a5d591295e9384e2b1e462aae",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__2_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/2.0.0/download",
        type = "tar.gz",
        sha256 = "0409e93b5eceaa4e5f498a4bce1cffc7ebe071d14582b5437c10af4aecc23f54",
        strip_prefix = "wasmtime-cranelift-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__2_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/2.0.0/download",
        type = "tar.gz",
        sha256 = "55240389c604f68d2e1d2573d7d3740246ab9ea2fa4fe79e10ccd51faf9b9500",
        strip_prefix = "wasmtime-environ-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__2_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/2.0.0/download",
        type = "tar.gz",
        sha256 = "bc15e285b7073ee566e62ea4b6dd38b80465ade0ea8cd4cee13c7ac2e295cfca",
        strip_prefix = "wasmtime-jit-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__2_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/2.0.0/download",
        type = "tar.gz",
        sha256 = "bee06d206bcf7a875eacd1e1e957c2a63f64a92934d2535dd8e15cde6d3a9ffe",
        strip_prefix = "wasmtime-jit-debug-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__2_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/2.0.0/download",
        type = "tar.gz",
        sha256 = "9969ff36cbf57f18c2d24679db57d0857ea7cc7d839534afc26ecc8003e9914b",
        strip_prefix = "wasmtime-runtime-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__2_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-types/2.0.0/download",
        type = "tar.gz",
        sha256 = "df64c737fc9b3cdf7617bcc65e8b97cb713ceb9c9c58530b20788a8a3482b5d1",
        strip_prefix = "wasmtime-types-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-2.0.0.bazel"),
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
