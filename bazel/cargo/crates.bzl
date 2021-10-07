"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def proxy_wasm_cpp_host_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__addr2line__0_14_1",
        url = "https://crates.io/api/v1/crates/addr2line/0.14.1/download",
        type = "tar.gz",
        sha256 = "a55f82cfe485775d02112886f4169bde0c5894d75e79ead7eafe7e40a25e45f7",
        strip_prefix = "addr2line-0.14.1",
        build_file = Label("//bazel/cargo/remote:BUILD.addr2line-0.14.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__addr2line__0_16_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.16.0/download",
        type = "tar.gz",
        sha256 = "3e61f2b7f93d2c7d2b08263acaa4a363b3e276806c68af6134c44f523bf1aacd",
        strip_prefix = "addr2line-0.16.0",
        build_file = Label("//bazel/cargo/remote:BUILD.addr2line-0.16.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__adler__1_0_2",
        url = "https://crates.io/api/v1/crates/adler/1.0.2/download",
        type = "tar.gz",
        sha256 = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe",
        strip_prefix = "adler-1.0.2",
        build_file = Label("//bazel/cargo/remote:BUILD.adler-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__aho_corasick__0_7_18",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.18/download",
        type = "tar.gz",
        sha256 = "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f",
        strip_prefix = "aho-corasick-0.7.18",
        build_file = Label("//bazel/cargo/remote:BUILD.aho-corasick-0.7.18.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__ansi_term__0_11_0",
        url = "https://crates.io/api/v1/crates/ansi_term/0.11.0/download",
        type = "tar.gz",
        sha256 = "ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b",
        strip_prefix = "ansi_term-0.11.0",
        build_file = Label("//bazel/cargo/remote:BUILD.ansi_term-0.11.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__anyhow__1_0_44",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.44/download",
        type = "tar.gz",
        sha256 = "61604a8f862e1d5c3229fdd78f8b02c68dcf73a4c4b05fd636d12240aaa242c1",
        strip_prefix = "anyhow-1.0.44",
        build_file = Label("//bazel/cargo/remote:BUILD.anyhow-1.0.44.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//bazel/cargo/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__backtrace__0_3_61",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.61/download",
        type = "tar.gz",
        sha256 = "e7a905d892734eea339e896738c14b9afce22b5318f64b951e70bf3844419b01",
        strip_prefix = "backtrace-0.3.61",
        build_file = Label("//bazel/cargo/remote:BUILD.backtrace-0.3.61.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__bincode__1_3_3",
        url = "https://crates.io/api/v1/crates/bincode/1.3.3/download",
        type = "tar.gz",
        sha256 = "b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad",
        strip_prefix = "bincode-1.3.3",
        build_file = Label("//bazel/cargo/remote:BUILD.bincode-1.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__bitflags__1_3_2",
        url = "https://crates.io/api/v1/crates/bitflags/1.3.2/download",
        type = "tar.gz",
        sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a",
        strip_prefix = "bitflags-1.3.2",
        build_file = Label("//bazel/cargo/remote:BUILD.bitflags-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__byteorder__1_4_3",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.3/download",
        type = "tar.gz",
        sha256 = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610",
        strip_prefix = "byteorder-1.4.3",
        build_file = Label("//bazel/cargo/remote:BUILD.byteorder-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cc__1_0_71",
        url = "https://crates.io/api/v1/crates/cc/1.0.71/download",
        type = "tar.gz",
        sha256 = "79c2681d6594606957bbb8631c4b90a7fcaaa72cdb714743a437b156d6a7eedd",
        strip_prefix = "cc-1.0.71",
        build_file = Label("//bazel/cargo/remote:BUILD.cc-1.0.71.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__clap__2_33_3",
        url = "https://crates.io/api/v1/crates/clap/2.33.3/download",
        type = "tar.gz",
        sha256 = "37e58ac78573c40708d45522f0d80fa2f01cc4f9b4e2bf749807255454312002",
        strip_prefix = "clap-2.33.3",
        build_file = Label("//bazel/cargo/remote:BUILD.clap-2.33.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cpp_demangle__0_3_3",
        url = "https://crates.io/api/v1/crates/cpp_demangle/0.3.3/download",
        type = "tar.gz",
        sha256 = "8ea47428dc9d2237f3c6bc134472edfd63ebba0af932e783506dcfd66f10d18a",
        strip_prefix = "cpp_demangle-0.3.3",
        build_file = Label("//bazel/cargo/remote:BUILD.cpp_demangle-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_bforest__0_73_1",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.73.1/download",
        type = "tar.gz",
        sha256 = "8b92a3c47b9782066c0e977dfbc444fc2ffde3572135737154034aa5fc926ecd",
        strip_prefix = "cranelift-bforest-0.73.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-bforest-0.73.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen__0_73_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.73.1/download",
        type = "tar.gz",
        sha256 = "9356227436c0948fe0227ea48d1e6cbfbd6f196a87428d55fd3f910d32e4dc9e",
        strip_prefix = "cranelift-codegen-0.73.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-0.73.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen_meta__0_73_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.73.1/download",
        type = "tar.gz",
        sha256 = "9c94789e0a32de783a741775bc87616d589cb1daa95b6d8a46b687ddfba179ff",
        strip_prefix = "cranelift-codegen-meta-0.73.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-meta-0.73.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen_shared__0_73_1",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.73.1/download",
        type = "tar.gz",
        sha256 = "06fd3d31bf5988acb52647ec5e491eaf29755e57022dcdffc78297b8940fbec5",
        strip_prefix = "cranelift-codegen-shared-0.73.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-shared-0.73.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_entity__0_73_1",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.73.1/download",
        type = "tar.gz",
        sha256 = "8ad4c7a77e1aec97f9c164b4a3b78b7b817b1fc6ae0aa719a959abe871db25e3",
        strip_prefix = "cranelift-entity-0.73.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-entity-0.73.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_frontend__0_73_1",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.73.1/download",
        type = "tar.gz",
        sha256 = "fd956fa7f5a30c2d045af28f1653e6fc4197a53121225114179887fe62dc65b1",
        strip_prefix = "cranelift-frontend-0.73.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-frontend-0.73.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_native__0_73_1",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.73.1/download",
        type = "tar.gz",
        sha256 = "7eb979e286564d616628814058a7a5ec160534e5d3cca6ad48ec7584c59ead0c",
        strip_prefix = "cranelift-native-0.73.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-native-0.73.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_wasm__0_73_1",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.73.1/download",
        type = "tar.gz",
        sha256 = "dc542a08be884ac7af861d9772f658f1ab6baf741a7fa09d26f2517bcded0ad5",
        strip_prefix = "cranelift-wasm-0.73.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-wasm-0.73.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__crc32fast__1_2_1",
        url = "https://crates.io/api/v1/crates/crc32fast/1.2.1/download",
        type = "tar.gz",
        sha256 = "81156fece84ab6a9f2afdb109ce3ae577e42b1228441eded99bd77f627953b1a",
        strip_prefix = "crc32fast-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.crc32fast-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__ed25519_compact__0_1_11",
        url = "https://crates.io/api/v1/crates/ed25519-compact/0.1.11/download",
        type = "tar.gz",
        sha256 = "f1f45ef578ef75efffba301628066d951042f6e988f21f8b548928468ba5877b",
        strip_prefix = "ed25519-compact-0.1.11",
        build_file = Label("//bazel/cargo/remote:BUILD.ed25519-compact-0.1.11.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//bazel/cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__env_logger__0_8_4",
        url = "https://crates.io/api/v1/crates/env_logger/0.8.4/download",
        type = "tar.gz",
        sha256 = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3",
        strip_prefix = "env_logger-0.8.4",
        build_file = Label("//bazel/cargo/remote:BUILD.env_logger-0.8.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__fallible_iterator__0_2_0",
        url = "https://crates.io/api/v1/crates/fallible-iterator/0.2.0/download",
        type = "tar.gz",
        sha256 = "4443176a9f2c162692bd3d352d745ef9413eec5782a80d8fd6f8a1ac692a07f7",
        strip_prefix = "fallible-iterator-0.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.fallible-iterator-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__getrandom__0_2_3",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.3/download",
        type = "tar.gz",
        sha256 = "7fcd999463524c52659517fe2cea98493cfe485d10565e7b0fb07dbba7ad2753",
        strip_prefix = "getrandom-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.getrandom-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__gimli__0_23_0",
        url = "https://crates.io/api/v1/crates/gimli/0.23.0/download",
        type = "tar.gz",
        sha256 = "f6503fe142514ca4799d4c26297c4248239fe8838d827db6bd6065c6ed29a6ce",
        strip_prefix = "gimli-0.23.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.23.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__gimli__0_25_0",
        url = "https://crates.io/api/v1/crates/gimli/0.25.0/download",
        type = "tar.gz",
        sha256 = "f0a01e0497841a3b2db4f8afa483cce65f7e96a3498bd6c541734792aeac8fe7",
        strip_prefix = "gimli-0.25.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.25.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__hashbrown__0_11_2",
        url = "https://crates.io/api/v1/crates/hashbrown/0.11.2/download",
        type = "tar.gz",
        sha256 = "ab5ef0d4909ef3724cc8cce6ccc8572c5c817592e9285f5464f8e86f8bd3726e",
        strip_prefix = "hashbrown-0.11.2",
        build_file = Label("//bazel/cargo/remote:BUILD.hashbrown-0.11.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__hermit_abi__0_1_19",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.19/download",
        type = "tar.gz",
        sha256 = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33",
        strip_prefix = "hermit-abi-0.1.19",
        build_file = Label("//bazel/cargo/remote:BUILD.hermit-abi-0.1.19.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__hmac_sha512__0_1_9",
        url = "https://crates.io/api/v1/crates/hmac-sha512/0.1.9/download",
        type = "tar.gz",
        sha256 = "77e806677ce663d0a199541030c816847b36e8dc095f70dae4a4f4ad63da5383",
        strip_prefix = "hmac-sha512-0.1.9",
        build_file = Label("//bazel/cargo/remote:BUILD.hmac-sha512-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__humantime__2_1_0",
        url = "https://crates.io/api/v1/crates/humantime/2.1.0/download",
        type = "tar.gz",
        sha256 = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4",
        strip_prefix = "humantime-2.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.humantime-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__indexmap__1_7_0",
        url = "https://crates.io/api/v1/crates/indexmap/1.7.0/download",
        type = "tar.gz",
        sha256 = "bc633605454125dec4b66843673f01c7df2b89479b32e0ed634e43a91cff62a5",
        strip_prefix = "indexmap-1.7.0",
        build_file = Label("//bazel/cargo/remote:BUILD.indexmap-1.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__itertools__0_10_1",
        url = "https://crates.io/api/v1/crates/itertools/0.10.1/download",
        type = "tar.gz",
        sha256 = "69ddb889f9d0d08a67338271fa9b62996bc788c7796a5c18cf057420aaed5eaf",
        strip_prefix = "itertools-0.10.1",
        build_file = Label("//bazel/cargo/remote:BUILD.itertools-0.10.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__libc__0_2_103",
        url = "https://crates.io/api/v1/crates/libc/0.2.103/download",
        type = "tar.gz",
        sha256 = "dd8f7255a17a627354f321ef0055d63b898c6fb27eff628af4d1b66b7331edf6",
        strip_prefix = "libc-0.2.103",
        build_file = Label("//bazel/cargo/remote:BUILD.libc-0.2.103.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__log__0_4_14",
        url = "https://crates.io/api/v1/crates/log/0.4.14/download",
        type = "tar.gz",
        sha256 = "51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710",
        strip_prefix = "log-0.4.14",
        build_file = Label("//bazel/cargo/remote:BUILD.log-0.4.14.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__mach__0_3_2",
        url = "https://crates.io/api/v1/crates/mach/0.3.2/download",
        type = "tar.gz",
        sha256 = "b823e83b2affd8f40a9ee8c29dbc56404c1e34cd2710921f2801e2cf29527afa",
        strip_prefix = "mach-0.3.2",
        build_file = Label("//bazel/cargo/remote:BUILD.mach-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__memchr__2_4_1",
        url = "https://crates.io/api/v1/crates/memchr/2.4.1/download",
        type = "tar.gz",
        sha256 = "308cc39be01b73d0d18f82a0e7b2a3df85245f84af96fdddc5d202d27e47b86a",
        strip_prefix = "memchr-2.4.1",
        build_file = Label("//bazel/cargo/remote:BUILD.memchr-2.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__memoffset__0_6_4",
        url = "https://crates.io/api/v1/crates/memoffset/0.6.4/download",
        type = "tar.gz",
        sha256 = "59accc507f1338036a0477ef61afdae33cde60840f4dfe481319ce3ad116ddf9",
        strip_prefix = "memoffset-0.6.4",
        build_file = Label("//bazel/cargo/remote:BUILD.memoffset-0.6.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__miniz_oxide__0_4_4",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.4.4/download",
        type = "tar.gz",
        sha256 = "a92518e98c078586bc6c934028adcca4c92a53d6a958196de835170a01d84e4b",
        strip_prefix = "miniz_oxide-0.4.4",
        build_file = Label("//bazel/cargo/remote:BUILD.miniz_oxide-0.4.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__more_asserts__0_2_1",
        url = "https://crates.io/api/v1/crates/more-asserts/0.2.1/download",
        type = "tar.gz",
        sha256 = "0debeb9fcf88823ea64d64e4a815ab1643f33127d995978e099942ce38f25238",
        strip_prefix = "more-asserts-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.more-asserts-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__object__0_23_0",
        url = "https://crates.io/api/v1/crates/object/0.23.0/download",
        type = "tar.gz",
        sha256 = "a9a7ab5d64814df0fe4a4b5ead45ed6c5f181ee3ff04ba344313a6c80446c5d4",
        strip_prefix = "object-0.23.0",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.23.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__object__0_26_2",
        url = "https://crates.io/api/v1/crates/object/0.26.2/download",
        type = "tar.gz",
        sha256 = "39f37e50073ccad23b6d09bcb5b263f4e76d3bb6038e4a3c08e52162ffa8abc2",
        strip_prefix = "object-0.26.2",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.26.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__once_cell__1_8_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.8.0/download",
        type = "tar.gz",
        sha256 = "692fcb63b64b1758029e0a96ee63e049ce8c5948587f2f7208df04625e5f6b56",
        strip_prefix = "once_cell-1.8.0",
        build_file = Label("//bazel/cargo/remote:BUILD.once_cell-1.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__parity_wasm__0_42_2",
        url = "https://crates.io/api/v1/crates/parity-wasm/0.42.2/download",
        type = "tar.gz",
        sha256 = "be5e13c266502aadf83426d87d81a0f5d1ef45b8027f5a471c360abfe4bfae92",
        strip_prefix = "parity-wasm-0.42.2",
        build_file = Label("//bazel/cargo/remote:BUILD.parity-wasm-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__paste__1_0_5",
        url = "https://crates.io/api/v1/crates/paste/1.0.5/download",
        type = "tar.gz",
        sha256 = "acbf547ad0c65e31259204bd90935776d1c693cec2f4ff7abb7a1bbbd40dfe58",
        strip_prefix = "paste-1.0.5",
        build_file = Label("//bazel/cargo/remote:BUILD.paste-1.0.5.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__ppv_lite86__0_2_10",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.10/download",
        type = "tar.gz",
        sha256 = "ac74c624d6b2d21f425f752262f42188365d7b8ff1aff74c82e45136510a4857",
        strip_prefix = "ppv-lite86-0.2.10",
        build_file = Label("//bazel/cargo/remote:BUILD.ppv-lite86-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__proc_macro2__1_0_29",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.29/download",
        type = "tar.gz",
        sha256 = "b9f5105d4fdaab20335ca9565e106a5d9b82b6219b5ba735731124ac6711d23d",
        strip_prefix = "proc-macro2-1.0.29",
        build_file = Label("//bazel/cargo/remote:BUILD.proc-macro2-1.0.29.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__psm__0_1_16",
        url = "https://crates.io/api/v1/crates/psm/0.1.16/download",
        type = "tar.gz",
        sha256 = "cd136ff4382c4753fc061cb9e4712ab2af263376b95bbd5bd8cd50c020b78e69",
        strip_prefix = "psm-0.1.16",
        build_file = Label("//bazel/cargo/remote:BUILD.psm-0.1.16.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__quote__1_0_10",
        url = "https://crates.io/api/v1/crates/quote/1.0.10/download",
        type = "tar.gz",
        sha256 = "38bc8cc6a5f2e3655e0899c1b848643b2562f853f114bfec7be120678e3ace05",
        strip_prefix = "quote-1.0.10",
        build_file = Label("//bazel/cargo/remote:BUILD.quote-1.0.10.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rand__0_8_4",
        url = "https://crates.io/api/v1/crates/rand/0.8.4/download",
        type = "tar.gz",
        sha256 = "2e7573632e6454cf6b99d7aac4ccca54be06da05aca2ef7423d22d27d4d4bcd8",
        strip_prefix = "rand-0.8.4",
        build_file = Label("//bazel/cargo/remote:BUILD.rand-0.8.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rand_chacha__0_3_1",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.3.1/download",
        type = "tar.gz",
        sha256 = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88",
        strip_prefix = "rand_chacha-0.3.1",
        build_file = Label("//bazel/cargo/remote:BUILD.rand_chacha-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rand_core__0_6_3",
        url = "https://crates.io/api/v1/crates/rand_core/0.6.3/download",
        type = "tar.gz",
        sha256 = "d34f1408f55294453790c48b2f1ebbb1c5b4b7563eb1f418bcfcfdbb06ebb4e7",
        strip_prefix = "rand_core-0.6.3",
        build_file = Label("//bazel/cargo/remote:BUILD.rand_core-0.6.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rand_hc__0_3_1",
        url = "https://crates.io/api/v1/crates/rand_hc/0.3.1/download",
        type = "tar.gz",
        sha256 = "d51e9f596de227fda2ea6c84607f5558e196eeaf43c986b724ba4fb8fdf497e7",
        strip_prefix = "rand_hc-0.3.1",
        build_file = Label("//bazel/cargo/remote:BUILD.rand_hc-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__regalloc__0_0_31",
        url = "https://crates.io/api/v1/crates/regalloc/0.0.31/download",
        type = "tar.gz",
        sha256 = "571f7f397d61c4755285cd37853fe8e03271c243424a907415909379659381c5",
        strip_prefix = "regalloc-0.0.31",
        build_file = Label("//bazel/cargo/remote:BUILD.regalloc-0.0.31.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__regex__1_5_4",
        url = "https://crates.io/api/v1/crates/regex/1.5.4/download",
        type = "tar.gz",
        sha256 = "d07a8629359eb56f1e2fb1652bb04212c072a87ba68546a04065d525673ac461",
        strip_prefix = "regex-1.5.4",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-1.5.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__regex_syntax__0_6_25",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.25/download",
        type = "tar.gz",
        sha256 = "f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f6153e3cc89b",
        strip_prefix = "regex-syntax-0.6.25",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-syntax-0.6.25.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__region__2_2_0",
        url = "https://crates.io/api/v1/crates/region/2.2.0/download",
        type = "tar.gz",
        sha256 = "877e54ea2adcd70d80e9179344c97f93ef0dffd6b03e1f4529e6e83ab2fa9ae0",
        strip_prefix = "region-2.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.region-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rustc_demangle__0_1_21",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.21/download",
        type = "tar.gz",
        sha256 = "7ef03e0a2b150c7a90d01faf6254c9c48a41e95fb2a8c2ac1c6f0d2b9aefc342",
        strip_prefix = "rustc-demangle-0.1.21",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-demangle-0.1.21.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rustc_hash__1_1_0",
        url = "https://crates.io/api/v1/crates/rustc-hash/1.1.0/download",
        type = "tar.gz",
        sha256 = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2",
        strip_prefix = "rustc-hash-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-hash-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__serde__1_0_130",
        url = "https://crates.io/api/v1/crates/serde/1.0.130/download",
        type = "tar.gz",
        sha256 = "f12d06de37cf59146fbdecab66aa99f9fe4f78722e3607577a5375d66bd0c913",
        strip_prefix = "serde-1.0.130",
        build_file = Label("//bazel/cargo/remote:BUILD.serde-1.0.130.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__serde_derive__1_0_130",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.130/download",
        type = "tar.gz",
        sha256 = "d7bc1a1ab1961464eae040d96713baa5a724a8152c1222492465b54322ec508b",
        strip_prefix = "serde_derive-1.0.130",
        build_file = Label("//bazel/cargo/remote:BUILD.serde_derive-1.0.130.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__smallvec__1_7_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.7.0/download",
        type = "tar.gz",
        sha256 = "1ecab6c735a6bb4139c0caafd0cc3635748bbb3acf4550e8138122099251f309",
        strip_prefix = "smallvec-1.7.0",
        build_file = Label("//bazel/cargo/remote:BUILD.smallvec-1.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__stable_deref_trait__1_2_0",
        url = "https://crates.io/api/v1/crates/stable_deref_trait/1.2.0/download",
        type = "tar.gz",
        sha256 = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3",
        strip_prefix = "stable_deref_trait-1.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.stable_deref_trait-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__strsim__0_8_0",
        url = "https://crates.io/api/v1/crates/strsim/0.8.0/download",
        type = "tar.gz",
        sha256 = "8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a",
        strip_prefix = "strsim-0.8.0",
        build_file = Label("//bazel/cargo/remote:BUILD.strsim-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__syn__1_0_80",
        url = "https://crates.io/api/v1/crates/syn/1.0.80/download",
        type = "tar.gz",
        sha256 = "d010a1623fbd906d51d650a9916aaefc05ffa0e4053ff7fe601167f3e715d194",
        strip_prefix = "syn-1.0.80",
        build_file = Label("//bazel/cargo/remote:BUILD.syn-1.0.80.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__target_lexicon__0_12_2",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.2/download",
        type = "tar.gz",
        sha256 = "d9bffcddbc2458fa3e6058414599e3c838a022abae82e5c67b4f7f80298d5bff",
        strip_prefix = "target-lexicon-0.12.2",
        build_file = Label("//bazel/cargo/remote:BUILD.target-lexicon-0.12.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__termcolor__1_1_2",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.2/download",
        type = "tar.gz",
        sha256 = "2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e26d88c5f4",
        strip_prefix = "termcolor-1.1.2",
        build_file = Label("//bazel/cargo/remote:BUILD.termcolor-1.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__textwrap__0_11_0",
        url = "https://crates.io/api/v1/crates/textwrap/0.11.0/download",
        type = "tar.gz",
        sha256 = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060",
        strip_prefix = "textwrap-0.11.0",
        build_file = Label("//bazel/cargo/remote:BUILD.textwrap-0.11.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__thiserror__1_0_29",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.29/download",
        type = "tar.gz",
        sha256 = "602eca064b2d83369e2b2f34b09c70b605402801927c65c11071ac911d299b88",
        strip_prefix = "thiserror-1.0.29",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-1.0.29.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__thiserror_impl__1_0_29",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.29/download",
        type = "tar.gz",
        sha256 = "bad553cc2c78e8de258400763a647e80e6d1b31ee237275d756f6836d204494c",
        strip_prefix = "thiserror-impl-1.0.29",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-impl-1.0.29.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__unicode_width__0_1_9",
        url = "https://crates.io/api/v1/crates/unicode-width/0.1.9/download",
        type = "tar.gz",
        sha256 = "3ed742d4ea2bd1176e236172c8429aaf54486e7ac098db29ffe6529e0ce50973",
        strip_prefix = "unicode-width-0.1.9",
        build_file = Label("//bazel/cargo/remote:BUILD.unicode-width-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__unicode_xid__0_2_2",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.2/download",
        type = "tar.gz",
        sha256 = "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3",
        strip_prefix = "unicode-xid-0.2.2",
        build_file = Label("//bazel/cargo/remote:BUILD.unicode-xid-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__vec_map__0_8_2",
        url = "https://crates.io/api/v1/crates/vec_map/0.8.2/download",
        type = "tar.gz",
        sha256 = "f1bddf1187be692e79c5ffeab891132dfb0f236ed36a43c7ed39f1165ee20191",
        strip_prefix = "vec_map-0.8.2",
        build_file = Label("//bazel/cargo/remote:BUILD.vec_map-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasi__0_10_2_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.10.2+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "fd6fbd9a79829dd1ad0cc20627bf1ed606756a7f77edff7b66b7064f9cb327c6",
        strip_prefix = "wasi-0.10.2+wasi-snapshot-preview1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasi-0.10.2+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmparser__0_77_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.77.0/download",
        type = "tar.gz",
        sha256 = "b35c86d22e720a07d954ebbed772d01180501afe7d03d464f413bb5f8914a8d6",
        strip_prefix = "wasmparser-0.77.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.77.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "proxy_wasm_cpp_host__wasmsign__0_1_2",
        remote = "https://github.com/jedisct1/wasmsign",
        commit = "fa4d5598f778390df09be94232972b5b865a56b8",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmsign-0.1.2.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime__0_26_1",
        url = "https://crates.io/api/v1/crates/wasmtime/0.26.1/download",
        type = "tar.gz",
        sha256 = "88cc3ec55eacb4818ebed477a1bfedf52b26617bbe63f85e3acc4257d07dfa0d",
        strip_prefix = "wasmtime-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-0.26.1.bazel"),
    )

    maybe(
        new_git_repository,
        name = "proxy_wasm_cpp_host__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "6b77786a6e758e91da9484a1c80b6fa5f88e1b3d",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_cranelift__0_26_1",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.26.1/download",
        type = "tar.gz",
        sha256 = "5baeb65c1cef8379533d25cab05f8a395fbe608d326a7ef7f036cf834ea6406a",
        strip_prefix = "wasmtime-cranelift-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-cranelift-0.26.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_debug__0_26_1",
        url = "https://crates.io/api/v1/crates/wasmtime-debug/0.26.1/download",
        type = "tar.gz",
        sha256 = "77898f4545b684cc6e5fb939365673d1018ee7f1514b8e20b432b8c2efb28cab",
        strip_prefix = "wasmtime-debug-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-debug-0.26.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_environ__0_26_1",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.26.1/download",
        type = "tar.gz",
        sha256 = "ca65c36c6bafc707faaaa78b18a37aa30aae3badbd598d4ab47114f8672522e7",
        strip_prefix = "wasmtime-environ-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-environ-0.26.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_jit__0_26_1",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.26.1/download",
        type = "tar.gz",
        sha256 = "f88bbc7a54f41a85cab6bc21bcde829d93121cddae61eda5b75cc908766555e4",
        strip_prefix = "wasmtime-jit-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-jit-0.26.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_obj__0_26_1",
        url = "https://crates.io/api/v1/crates/wasmtime-obj/0.26.1/download",
        type = "tar.gz",
        sha256 = "85378fd7f1198d1a42aaa3585bb51bfb0214f870ffef7537be91a0f7932c3327",
        strip_prefix = "wasmtime-obj-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-obj-0.26.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_profiling__0_26_1",
        url = "https://crates.io/api/v1/crates/wasmtime-profiling/0.26.1/download",
        type = "tar.gz",
        sha256 = "e5e4bc4ecad91e0ab7e255b03baed6c4e169c8c5e0f479dc56f3d49d28d70b92",
        strip_prefix = "wasmtime-profiling-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-profiling-0.26.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_runtime__0_26_1",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.26.1/download",
        type = "tar.gz",
        sha256 = "908c8f9159eb16c1bdb9b06850b8a46a0063276245409186bcdeaf6e3076427c",
        strip_prefix = "wasmtime-runtime-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-runtime-0.26.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )
