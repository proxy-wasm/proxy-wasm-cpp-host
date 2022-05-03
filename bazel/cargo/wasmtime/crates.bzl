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
        name = "wasmtime__aho_corasick__0_7_18",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.18/download",
        type = "tar.gz",
        sha256 = "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f",
        strip_prefix = "aho-corasick-0.7.18",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.aho-corasick-0.7.18.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__anyhow__1_0_57",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.57/download",
        type = "tar.gz",
        sha256 = "08f9b8508dccb7687a1d6c4ce66b2b0ecef467c94667de27d8d7fe1f8d2a9cdc",
        strip_prefix = "anyhow-1.0.57",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.57.bazel"),
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
        name = "wasmtime__cranelift_bforest__0_83_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.83.0/download",
        type = "tar.gz",
        sha256 = "ed44413e7e2fe3260d0ed73e6956ab188b69c10ee92b892e401e0f4f6808c68b",
        strip_prefix = "cranelift-bforest-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_83_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.83.0/download",
        type = "tar.gz",
        sha256 = "0b5d83f0f26bf213f971f45589d17e5b65e4861f9ed22392b0cbb6eaa5bd329c",
        strip_prefix = "cranelift-codegen-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_83_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.83.0/download",
        type = "tar.gz",
        sha256 = "6800dc386177df6ecc5a32680607ed8ba1fa0d31a2a59c8c61fbf44826b8191d",
        strip_prefix = "cranelift-codegen-meta-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_83_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.83.0/download",
        type = "tar.gz",
        sha256 = "c961f85070985ebc8fcdb81b838a5cf842294d1e6ed4852446161c7e246fd455",
        strip_prefix = "cranelift-codegen-shared-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_83_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.83.0/download",
        type = "tar.gz",
        sha256 = "2347b2b8d1d5429213668f2a8e36c85ee3c73984a2f6a79007e365d3e575e7ed",
        strip_prefix = "cranelift-entity-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_83_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.83.0/download",
        type = "tar.gz",
        sha256 = "4cbcdbf7bed29e363568b778649b69dabc3d727256d5d25236096ef693757654",
        strip_prefix = "cranelift-frontend-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_83_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.83.0/download",
        type = "tar.gz",
        sha256 = "8f4cdf93552e5ceb2e3c042829ebb4de4378492705f769eadc6a7c6c5251624c",
        strip_prefix = "cranelift-native-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_83_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.83.0/download",
        type = "tar.gz",
        sha256 = "d8b859d8cb1806f9ad0f59fdc25cbff576345abfad84c1aba483dd2f8e580e5c",
        strip_prefix = "cranelift-wasm-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.83.0.bazel"),
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
        name = "wasmtime__getrandom__0_2_6",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.6/download",
        type = "tar.gz",
        sha256 = "9be70c98951c83b8d2f8f60d7065fa6d5146873094452a1008da8c2f1e4205ad",
        strip_prefix = "getrandom-0.2.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.getrandom-0.2.6.bazel"),
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
        name = "wasmtime__indexmap__1_8_1",
        url = "https://crates.io/api/v1/crates/indexmap/1.8.1/download",
        type = "tar.gz",
        sha256 = "0f647032dfaa1f8b6dc29bd3edb7bbef4861b8b8007ebb118d6db284fd59f6ee",
        strip_prefix = "indexmap-1.8.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.indexmap-1.8.1.bazel"),
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
        name = "wasmtime__libc__0_2_125",
        url = "https://crates.io/api/v1/crates/libc/0.2.125/download",
        type = "tar.gz",
        sha256 = "5916d2ae698f6de9bfb891ad7a8d65c09d232dc58cc4ac433c7da3b2fd84bc2b",
        strip_prefix = "libc-0.2.125",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.125.bazel"),
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
        name = "wasmtime__once_cell__1_10_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.10.0/download",
        type = "tar.gz",
        sha256 = "87f3e037eac156d1775da914196f0f37741a274155e34a0b7e427c35d2a2ecb9",
        strip_prefix = "once_cell-1.10.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.once_cell-1.10.0.bazel"),
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
        name = "wasmtime__proc_macro2__1_0_37",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.37/download",
        type = "tar.gz",
        sha256 = "ec757218438d5fda206afc041538b2f6d889286160d649a86a24d37e1235afd1",
        strip_prefix = "proc-macro2-1.0.37",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.37.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__psm__0_1_18",
        url = "https://crates.io/api/v1/crates/psm/0.1.18/download",
        type = "tar.gz",
        sha256 = "871372391786ccec00d3c5d3d6608905b3d4db263639cfe075d3b60a736d115a",
        strip_prefix = "psm-0.1.18",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.psm-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__quote__1_0_18",
        url = "https://crates.io/api/v1/crates/quote/1.0.18/download",
        type = "tar.gz",
        sha256 = "a1feb54ed693b93a84e14094943b84b7c4eae204c512b7ccb95ab0c66d278ad1",
        strip_prefix = "quote-1.0.18",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.18.bazel"),
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
        name = "wasmtime__regalloc__0_0_34",
        url = "https://crates.io/api/v1/crates/regalloc/0.0.34/download",
        type = "tar.gz",
        sha256 = "62446b1d3ebf980bdc68837700af1d77b37bc430e524bf95319c6eada2a4cc02",
        strip_prefix = "regalloc-0.0.34",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc-0.0.34.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex__1_5_5",
        url = "https://crates.io/api/v1/crates/regex/1.5.5/download",
        type = "tar.gz",
        sha256 = "1a11647b6b25ff05a515cb92c365cec08801e83423a235b51e231e1808747286",
        strip_prefix = "regex-1.5.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-1.5.5.bazel"),
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
        name = "wasmtime__rustix__0_33_7",
        url = "https://crates.io/api/v1/crates/rustix/0.33.7/download",
        type = "tar.gz",
        sha256 = "938a344304321a9da4973b9ff4f9f8db9caf4597dfd9dda6a60b523340a0fff0",
        strip_prefix = "rustix-0.33.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.33.7.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_137",
        url = "https://crates.io/api/v1/crates/serde/1.0.137/download",
        type = "tar.gz",
        sha256 = "61ea8d54c77f8315140a05f4c7237403bf38b72704d031543aa1d16abbf517d1",
        strip_prefix = "serde-1.0.137",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.137.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_137",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.137/download",
        type = "tar.gz",
        sha256 = "1f26faba0c3959972377d3b2d306ee9f71faee9714294e41bb777f83f88578be",
        strip_prefix = "serde_derive-1.0.137",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.137.bazel"),
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
        name = "wasmtime__syn__1_0_92",
        url = "https://crates.io/api/v1/crates/syn/1.0.92/download",
        type = "tar.gz",
        sha256 = "7ff7c592601f11445996a06f8ad0c27f094a58857c2f89e97974ab9235b92c52",
        strip_prefix = "syn-1.0.92",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-1.0.92.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__target_lexicon__0_12_3",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.3/download",
        type = "tar.gz",
        sha256 = "d7fa7e55043acb85fca6b3c01485a2eeb6b69c5d21002e273c79e465f43b7ac1",
        strip_prefix = "target-lexicon-0.12.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.target-lexicon-0.12.3.bazel"),
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
        name = "wasmtime__unicode_xid__0_2_3",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.3/download",
        type = "tar.gz",
        sha256 = "957e51f3646910546462e67d5f7599b9e4fb8acdd304b087a6494730f9eebf04",
        strip_prefix = "unicode-xid-0.2.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-xid-0.2.3.bazel"),
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
        name = "wasmtime__wasmparser__0_83_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.83.0/download",
        type = "tar.gz",
        sha256 = "718ed7c55c2add6548cca3ddd6383d738cd73b892df400e96b9aa876f0141d7a",
        strip_prefix = "wasmparser-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__0_36_0",
        url = "https://crates.io/api/v1/crates/wasmtime/0.36.0/download",
        type = "tar.gz",
        sha256 = "4beb256f8514dd3eb85b03bceb422abfff5f07bf564519cbe0abf80462120bc0",
        strip_prefix = "wasmtime-0.36.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-0.36.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "c0e58a1e1c22b53e0330829057da6125da89bef1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__0_36_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.36.0/download",
        type = "tar.gz",
        sha256 = "0e8f126b9c55e9550391617049f468878cb9f4af75f33009be72f0c692e1d2ed",
        strip_prefix = "wasmtime-cranelift-0.36.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-0.36.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__0_36_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.36.0/download",
        type = "tar.gz",
        sha256 = "343cfc7e7604b063ef0429e043a06e077a39bcb1ce3e731abe0414431f2610de",
        strip_prefix = "wasmtime-environ-0.36.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-0.36.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__0_36_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.36.0/download",
        type = "tar.gz",
        sha256 = "81f3a31bf04f02ec7497ddeda20e14b640b1e4d9e1c55c1ebdb268bf30800e2d",
        strip_prefix = "wasmtime-jit-0.36.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-0.36.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__0_36_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/0.36.0/download",
        type = "tar.gz",
        sha256 = "4e725c3a37e49bd95d2d350c9f1b6641ac6e75bc357204e857ac058d0c64b720",
        strip_prefix = "wasmtime-jit-debug-0.36.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-0.36.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__0_36_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.36.0/download",
        type = "tar.gz",
        sha256 = "2ed30d50ffd763873f49df0c94efa20c17749f375518117d6677cc29b631a1fc",
        strip_prefix = "wasmtime-runtime-0.36.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-0.36.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__0_36_0",
        url = "https://crates.io/api/v1/crates/wasmtime-types/0.36.0/download",
        type = "tar.gz",
        sha256 = "72080d5bdd54af03de7f5ca8b67dcd8ea36f4dfec75fc89a976ebc847ee1516e",
        strip_prefix = "wasmtime-types-0.36.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-0.36.0.bazel"),
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
