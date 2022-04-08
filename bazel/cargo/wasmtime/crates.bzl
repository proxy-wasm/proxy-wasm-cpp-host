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
        name = "wasmtime__anyhow__1_0_56",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.56/download",
        type = "tar.gz",
        sha256 = "4361135be9122e0870de935d7c439aef945b9f9ddd4199a553b5270b49c82a27",
        strip_prefix = "anyhow-1.0.56",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.56.bazel"),
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
        name = "wasmtime__backtrace__0_3_64",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.64/download",
        type = "tar.gz",
        sha256 = "5e121dee8023ce33ab248d9ce1493df03c3b38a659b240096fcbd7048ff9c31f",
        strip_prefix = "backtrace-0.3.64",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.backtrace-0.3.64.bazel"),
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
        name = "wasmtime__cranelift_bforest__0_82_2",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.82.2/download",
        type = "tar.gz",
        sha256 = "5b9956ad3efeb062596e0b25a1091730080cb6483b500bd106b92c7a55e9e0b1",
        strip_prefix = "cranelift-bforest-0.82.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.82.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_82_2",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.82.2/download",
        type = "tar.gz",
        sha256 = "efc67870c31cae7d03808dfa430ee9ccda9bd82c61b49b939d925d9155cfc42d",
        strip_prefix = "cranelift-codegen-0.82.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.82.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_82_2",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.82.2/download",
        type = "tar.gz",
        sha256 = "b0f0172d25539fcc64f581d3dce0df00e2065b00e1c750e18832d2cf1e0d27e0",
        strip_prefix = "cranelift-codegen-meta-0.82.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.82.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_82_2",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.82.2/download",
        type = "tar.gz",
        sha256 = "8f6cc5717ae2ea849e5c819eb70c95792c2843294d9503700ac55d8d159e2160",
        strip_prefix = "cranelift-codegen-shared-0.82.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.82.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_82_2",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.82.2/download",
        type = "tar.gz",
        sha256 = "e822e0169d7a078cbc7ed19bca6636752c093e25d994a4febd9914d1118f3945",
        strip_prefix = "cranelift-entity-0.82.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.82.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_82_2",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.82.2/download",
        type = "tar.gz",
        sha256 = "bf3bc8bd3bb8932e70b71c0de6cba277ae112d4e51dadde2e318f60f2fbe97bc",
        strip_prefix = "cranelift-frontend-0.82.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.82.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_82_2",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.82.2/download",
        type = "tar.gz",
        sha256 = "a8090cade0761622fcb1c805c8ce2c2f085a2467bdee7e21cd9ba399026cf7ac",
        strip_prefix = "cranelift-native-0.82.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.82.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_82_2",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.82.2/download",
        type = "tar.gz",
        sha256 = "be110a4560fa997ba8bc8376a459ec4d8707074f88058a17b29f43c27e983ad0",
        strip_prefix = "cranelift-wasm-0.82.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.82.2.bazel"),
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
        name = "wasmtime__libc__0_2_122",
        url = "https://crates.io/api/v1/crates/libc/0.2.122/download",
        type = "tar.gz",
        sha256 = "ec647867e2bf0772e28c8bcde4f0d19a9216916e890543b5a03ed8ef27b8f259",
        strip_prefix = "libc-0.2.122",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.122.bazel"),
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
        name = "wasmtime__log__0_4_16",
        url = "https://crates.io/api/v1/crates/log/0.4.16/download",
        type = "tar.gz",
        sha256 = "6389c490849ff5bc16be905ae24bc913a9c8892e19b2341dbc175e14c341c2b8",
        strip_prefix = "log-0.4.16",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.log-0.4.16.bazel"),
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
        name = "wasmtime__quote__1_0_17",
        url = "https://crates.io/api/v1/crates/quote/1.0.17/download",
        type = "tar.gz",
        sha256 = "632d02bff7f874a36f33ea8bb416cd484b90cc66c1194b1a1110d067a7013f58",
        strip_prefix = "quote-1.0.17",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.17.bazel"),
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
        name = "wasmtime__rustix__0_33_5",
        url = "https://crates.io/api/v1/crates/rustix/0.33.5/download",
        type = "tar.gz",
        sha256 = "03627528abcc4a365554d32a9f3bbf67f7694c102cfeda792dc86a2d6057cc85",
        strip_prefix = "rustix-0.33.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.33.5.bazel"),
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
        name = "wasmtime__syn__1_0_91",
        url = "https://crates.io/api/v1/crates/syn/1.0.91/download",
        type = "tar.gz",
        sha256 = "b683b2b825c8eef438b77c36a06dc262294da3d5a5813fac20da149241dcd44d",
        strip_prefix = "syn-1.0.91",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-1.0.91.bazel"),
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
        name = "wasmtime__wasmparser__0_83_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.83.0/download",
        type = "tar.gz",
        sha256 = "718ed7c55c2add6548cca3ddd6383d738cd73b892df400e96b9aa876f0141d7a",
        strip_prefix = "wasmparser-0.83.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.83.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__0_35_2",
        url = "https://crates.io/api/v1/crates/wasmtime/0.35.2/download",
        type = "tar.gz",
        sha256 = "637f73fff13248d13882246b67a8208d466c36d7b836b783a62903cb96f11b61",
        strip_prefix = "wasmtime-0.35.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-0.35.2.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "59bfe50acaffd69f267946d35abe9f87a3b07e29",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__0_35_2",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.35.2/download",
        type = "tar.gz",
        sha256 = "a2d233418e5f560e8010fe13e60943df8be0685c68cbdf9f588dd846a727f2e4",
        strip_prefix = "wasmtime-cranelift-0.35.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-0.35.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__0_35_2",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.35.2/download",
        type = "tar.gz",
        sha256 = "0f38f25934156bb5496b3fd30be10c8ef41936330d9c936654ebf4eac02e352e",
        strip_prefix = "wasmtime-environ-0.35.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-0.35.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__0_35_2",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.35.2/download",
        type = "tar.gz",
        sha256 = "bf7d3293e643c3b397012a579b025116e5818118a7982373551df8f8b0a4c524",
        strip_prefix = "wasmtime-jit-0.35.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-0.35.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__0_35_2",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/0.35.2/download",
        type = "tar.gz",
        sha256 = "f8b4b40b84a96da6fcd7f2460747564091b9b8dedcc7bd66c0cb741adf451de8",
        strip_prefix = "wasmtime-jit-debug-0.35.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-0.35.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__0_35_2",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.35.2/download",
        type = "tar.gz",
        sha256 = "b60eb01e3413a54e791a397d556962876902d7481be496b4b9eb1dc68de14fce",
        strip_prefix = "wasmtime-runtime-0.35.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-0.35.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__0_35_2",
        url = "https://crates.io/api/v1/crates/wasmtime-types/0.35.2/download",
        type = "tar.gz",
        sha256 = "86cd8d51aa648f2ba5a25bd11a74c08ce2b66796a5bbd5c099ab5db672a2e68f",
        strip_prefix = "wasmtime-types-0.35.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-0.35.2.bazel"),
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
