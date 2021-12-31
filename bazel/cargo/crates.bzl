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
        name = "proxy_wasm_cpp_host__addr2line__0_17_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.17.0/download",
        type = "tar.gz",
        sha256 = "b9ecd88a8c8378ca913a680cd98f0f13ac67383d35993f86c90a70e3f137816b",
        strip_prefix = "addr2line-0.17.0",
        build_file = Label("//bazel/cargo/remote:BUILD.addr2line-0.17.0.bazel"),
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
        name = "proxy_wasm_cpp_host__ansi_term__0_12_1",
        url = "https://crates.io/api/v1/crates/ansi_term/0.12.1/download",
        type = "tar.gz",
        sha256 = "d52a9bb7ec0cf484c551830a7ce27bd20d67eac647e1befb56b0be4ee39a55d2",
        strip_prefix = "ansi_term-0.12.1",
        build_file = Label("//bazel/cargo/remote:BUILD.ansi_term-0.12.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__anyhow__1_0_52",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.52/download",
        type = "tar.gz",
        sha256 = "84450d0b4a8bd1ba4144ce8ce718fbc5d071358b1e5384bace6536b3d1f2d5b3",
        strip_prefix = "anyhow-1.0.52",
        build_file = Label("//bazel/cargo/remote:BUILD.anyhow-1.0.52.bazel"),
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
        name = "proxy_wasm_cpp_host__backtrace__0_3_63",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.63/download",
        type = "tar.gz",
        sha256 = "321629d8ba6513061f26707241fa9bc89524ff1cd7a915a97ef0c62c666ce1b6",
        strip_prefix = "backtrace-0.3.63",
        build_file = Label("//bazel/cargo/remote:BUILD.backtrace-0.3.63.bazel"),
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
        name = "proxy_wasm_cpp_host__block_buffer__0_9_0",
        url = "https://crates.io/api/v1/crates/block-buffer/0.9.0/download",
        type = "tar.gz",
        sha256 = "4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a3417297e4",
        strip_prefix = "block-buffer-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.block-buffer-0.9.0.bazel"),
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
        name = "proxy_wasm_cpp_host__cc__1_0_72",
        url = "https://crates.io/api/v1/crates/cc/1.0.72/download",
        type = "tar.gz",
        sha256 = "22a9137b95ea06864e018375b72adfb7db6e6f68cfc8df5a04d00288050485ee",
        strip_prefix = "cc-1.0.72",
        build_file = Label("//bazel/cargo/remote:BUILD.cc-1.0.72.bazel"),
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
        name = "proxy_wasm_cpp_host__clap__2_34_0",
        url = "https://crates.io/api/v1/crates/clap/2.34.0/download",
        type = "tar.gz",
        sha256 = "a0610544180c38b88101fecf2dd634b174a62eef6946f84dfc6a7127512b381c",
        strip_prefix = "clap-2.34.0",
        build_file = Label("//bazel/cargo/remote:BUILD.clap-2.34.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cpp_demangle__0_3_5",
        url = "https://crates.io/api/v1/crates/cpp_demangle/0.3.5/download",
        type = "tar.gz",
        sha256 = "eeaa953eaad386a53111e47172c2fedba671e5684c8dd601a5f474f4f118710f",
        strip_prefix = "cpp_demangle-0.3.5",
        build_file = Label("//bazel/cargo/remote:BUILD.cpp_demangle-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cpufeatures__0_2_1",
        url = "https://crates.io/api/v1/crates/cpufeatures/0.2.1/download",
        type = "tar.gz",
        sha256 = "95059428f66df56b63431fdb4e1947ed2190586af5c5a8a8b71122bdf5a7f469",
        strip_prefix = "cpufeatures-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.cpufeatures-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_bforest__0_79_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.79.0/download",
        type = "tar.gz",
        sha256 = "f0fb5e025141af5b9cbfff4351dc393596d017725f126c954bf472ce78dbba6b",
        strip_prefix = "cranelift-bforest-0.79.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-bforest-0.79.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen__0_79_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.79.0/download",
        type = "tar.gz",
        sha256 = "a278c67cc48d0e8ff2275fb6fc31527def4be8f3d81640ecc8cd005a3aa45ded",
        strip_prefix = "cranelift-codegen-0.79.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-0.79.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen_meta__0_79_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.79.0/download",
        type = "tar.gz",
        sha256 = "28274c1916c931c5603d94c5479d2ddacaaa574d298814ac1c99964ce92cbe85",
        strip_prefix = "cranelift-codegen-meta-0.79.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-meta-0.79.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen_shared__0_79_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.79.0/download",
        type = "tar.gz",
        sha256 = "5411cf49ab440b749d4da5129dfc45caf6e5fb7b2742b1fe1a421964fda2ee88",
        strip_prefix = "cranelift-codegen-shared-0.79.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-shared-0.79.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_entity__0_79_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.79.0/download",
        type = "tar.gz",
        sha256 = "64dde596f98462a37b029d81c8567c23cc68b8356b017f12945c545ac0a83203",
        strip_prefix = "cranelift-entity-0.79.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-entity-0.79.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_frontend__0_79_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.79.0/download",
        type = "tar.gz",
        sha256 = "544605d400710bd9c89924050b30c2e0222a387a5a8b5f04da9a9fdcbd8656a5",
        strip_prefix = "cranelift-frontend-0.79.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-frontend-0.79.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_native__0_79_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.79.0/download",
        type = "tar.gz",
        sha256 = "b7f8839befb64f7a39cb855241ae2c8eb74cea27c97fff2a007075fdb8a7f7d4",
        strip_prefix = "cranelift-native-0.79.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-native-0.79.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_wasm__0_79_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.79.0/download",
        type = "tar.gz",
        sha256 = "80c9e14062c6a1cd2367dd30ea8945976639d5fe2062da8bdd40ada9ce3cb82e",
        strip_prefix = "cranelift-wasm-0.79.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-wasm-0.79.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__crc32fast__1_3_0",
        url = "https://crates.io/api/v1/crates/crc32fast/1.3.0/download",
        type = "tar.gz",
        sha256 = "738c290dfaea84fc1ca15ad9c168d083b05a714e1efddd8edaab678dc28d2836",
        strip_prefix = "crc32fast-1.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.crc32fast-1.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__digest__0_9_0",
        url = "https://crates.io/api/v1/crates/digest/0.9.0/download",
        type = "tar.gz",
        sha256 = "d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3cc6dcb066",
        strip_prefix = "digest-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.digest-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__ed25519_compact__1_0_1",
        url = "https://crates.io/api/v1/crates/ed25519-compact/1.0.1/download",
        type = "tar.gz",
        sha256 = "85424599b04c7251cd887b95b13c2bb853f3050a2619f40fbf9c23d0baf47223",
        strip_prefix = "ed25519-compact-1.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.ed25519-compact-1.0.1.bazel"),
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
        name = "proxy_wasm_cpp_host__errno__0_2_8",
        url = "https://crates.io/api/v1/crates/errno/0.2.8/download",
        type = "tar.gz",
        sha256 = "f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8ce6c396a1",
        strip_prefix = "errno-0.2.8",
        build_file = Label("//bazel/cargo/remote:BUILD.errno-0.2.8.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__errno_dragonfly__0_1_2",
        url = "https://crates.io/api/v1/crates/errno-dragonfly/0.1.2/download",
        type = "tar.gz",
        sha256 = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf",
        strip_prefix = "errno-dragonfly-0.1.2",
        build_file = Label("//bazel/cargo/remote:BUILD.errno-dragonfly-0.1.2.bazel"),
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
        name = "proxy_wasm_cpp_host__generic_array__0_14_4",
        url = "https://crates.io/api/v1/crates/generic-array/0.14.4/download",
        type = "tar.gz",
        sha256 = "501466ecc8a30d1d3b7fc9229b122b2ce8ed6e9d9223f1138d4babb253e51817",
        strip_prefix = "generic-array-0.14.4",
        build_file = Label("//bazel/cargo/remote:BUILD.generic-array-0.14.4.bazel"),
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
        name = "proxy_wasm_cpp_host__gimli__0_26_1",
        url = "https://crates.io/api/v1/crates/gimli/0.26.1/download",
        type = "tar.gz",
        sha256 = "78cc372d058dcf6d5ecd98510e7fbc9e5aec4d21de70f65fea8fecebcd881bd4",
        strip_prefix = "gimli-0.26.1",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.26.1.bazel"),
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
        name = "proxy_wasm_cpp_host__hmac_sha512__1_1_1",
        url = "https://crates.io/api/v1/crates/hmac-sha512/1.1.1/download",
        type = "tar.gz",
        sha256 = "6b2ce076d8070f292037093a825343f6341fe0ce873268c2477e2f49abd57b10",
        strip_prefix = "hmac-sha512-1.1.1",
        build_file = Label("//bazel/cargo/remote:BUILD.hmac-sha512-1.1.1.bazel"),
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
        name = "proxy_wasm_cpp_host__io_lifetimes__0_3_3",
        url = "https://crates.io/api/v1/crates/io-lifetimes/0.3.3/download",
        type = "tar.gz",
        sha256 = "278e90d6f8a6c76a8334b336e306efa3c5f2b604048cbfd486d6f49878e3af14",
        strip_prefix = "io-lifetimes-0.3.3",
        build_file = Label("//bazel/cargo/remote:BUILD.io-lifetimes-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__itertools__0_10_3",
        url = "https://crates.io/api/v1/crates/itertools/0.10.3/download",
        type = "tar.gz",
        sha256 = "a9a9d19fa1e79b6215ff29b9d6880b706147f16e9b1dbb1e4e5947b5b02bc5e3",
        strip_prefix = "itertools-0.10.3",
        build_file = Label("//bazel/cargo/remote:BUILD.itertools-0.10.3.bazel"),
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
        name = "proxy_wasm_cpp_host__libc__0_2_112",
        url = "https://crates.io/api/v1/crates/libc/0.2.112/download",
        type = "tar.gz",
        sha256 = "1b03d17f364a3a042d5e5d46b053bbbf82c92c9430c592dd4c064dc6ee997125",
        strip_prefix = "libc-0.2.112",
        build_file = Label("//bazel/cargo/remote:BUILD.libc-0.2.112.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__linux_raw_sys__0_0_36",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.0.36/download",
        type = "tar.gz",
        sha256 = "a261afc61b7a5e323933b402ca6a1765183687c614789b1e4db7762ed4230bca",
        strip_prefix = "linux-raw-sys-0.0.36",
        build_file = Label("//bazel/cargo/remote:BUILD.linux-raw-sys-0.0.36.bazel"),
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
        name = "proxy_wasm_cpp_host__memoffset__0_6_5",
        url = "https://crates.io/api/v1/crates/memoffset/0.6.5/download",
        type = "tar.gz",
        sha256 = "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce",
        strip_prefix = "memoffset-0.6.5",
        build_file = Label("//bazel/cargo/remote:BUILD.memoffset-0.6.5.bazel"),
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
        name = "proxy_wasm_cpp_host__more_asserts__0_2_2",
        url = "https://crates.io/api/v1/crates/more-asserts/0.2.2/download",
        type = "tar.gz",
        sha256 = "7843ec2de400bcbc6a6328c958dc38e5359da6e93e72e37bc5246bf1ae776389",
        strip_prefix = "more-asserts-0.2.2",
        build_file = Label("//bazel/cargo/remote:BUILD.more-asserts-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__object__0_27_1",
        url = "https://crates.io/api/v1/crates/object/0.27.1/download",
        type = "tar.gz",
        sha256 = "67ac1d3f9a1d3616fd9a60c8d74296f22406a238b6a72f5cc1e6f314df4ffbf9",
        strip_prefix = "object-0.27.1",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.27.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__once_cell__1_9_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.9.0/download",
        type = "tar.gz",
        sha256 = "da32515d9f6e6e489d7bc9d84c71b060db7247dc035bbe44eac88cf87486d8d5",
        strip_prefix = "once_cell-1.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.once_cell-1.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__opaque_debug__0_3_0",
        url = "https://crates.io/api/v1/crates/opaque-debug/0.3.0/download",
        type = "tar.gz",
        sha256 = "624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6649fc13d5",
        strip_prefix = "opaque-debug-0.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.opaque-debug-0.3.0.bazel"),
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
        name = "proxy_wasm_cpp_host__paste__1_0_6",
        url = "https://crates.io/api/v1/crates/paste/1.0.6/download",
        type = "tar.gz",
        sha256 = "0744126afe1a6dd7f394cb50a716dbe086cb06e255e53d8d0185d82828358fb5",
        strip_prefix = "paste-1.0.6",
        build_file = Label("//bazel/cargo/remote:BUILD.paste-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__ppv_lite86__0_2_15",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.15/download",
        type = "tar.gz",
        sha256 = "ed0cfbc8191465bed66e1718596ee0b0b35d5ee1f41c5df2189d0fe8bde535ba",
        strip_prefix = "ppv-lite86-0.2.15",
        build_file = Label("//bazel/cargo/remote:BUILD.ppv-lite86-0.2.15.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__proc_macro2__1_0_36",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.36/download",
        type = "tar.gz",
        sha256 = "c7342d5883fbccae1cc37a2353b09c87c9b0f3afd73f5fb9bba687a1f733b029",
        strip_prefix = "proc-macro2-1.0.36",
        build_file = Label("//bazel/cargo/remote:BUILD.proc-macro2-1.0.36.bazel"),
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
        name = "proxy_wasm_cpp_host__quote__1_0_14",
        url = "https://crates.io/api/v1/crates/quote/1.0.14/download",
        type = "tar.gz",
        sha256 = "47aa80447ce4daf1717500037052af176af5d38cc3e571d9ec1c7353fc10c87d",
        strip_prefix = "quote-1.0.14",
        build_file = Label("//bazel/cargo/remote:BUILD.quote-1.0.14.bazel"),
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
        name = "proxy_wasm_cpp_host__regalloc__0_0_33",
        url = "https://crates.io/api/v1/crates/regalloc/0.0.33/download",
        type = "tar.gz",
        sha256 = "7d808cff91dfca7b239d40b972ba628add94892b1d9e19a842aedc5cfae8ab1a",
        strip_prefix = "regalloc-0.0.33",
        build_file = Label("//bazel/cargo/remote:BUILD.regalloc-0.0.33.bazel"),
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
        name = "proxy_wasm_cpp_host__rustc_version__0_4_0",
        url = "https://crates.io/api/v1/crates/rustc_version/0.4.0/download",
        type = "tar.gz",
        sha256 = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366",
        strip_prefix = "rustc_version-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc_version-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rustix__0_26_2",
        url = "https://crates.io/api/v1/crates/rustix/0.26.2/download",
        type = "tar.gz",
        sha256 = "18c44018277ec7195538f5631b90def7ad975bb46370cb0f4eff4012de9333f8",
        strip_prefix = "rustix-0.26.2",
        build_file = Label("//bazel/cargo/remote:BUILD.rustix-0.26.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__semver__1_0_4",
        url = "https://crates.io/api/v1/crates/semver/1.0.4/download",
        type = "tar.gz",
        sha256 = "568a8e6258aa33c13358f81fd834adb854c6f7c9468520910a9b1e8fac068012",
        strip_prefix = "semver-1.0.4",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-1.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__serde__1_0_132",
        url = "https://crates.io/api/v1/crates/serde/1.0.132/download",
        type = "tar.gz",
        sha256 = "8b9875c23cf305cd1fd7eb77234cbb705f21ea6a72c637a5c6db5fe4b8e7f008",
        strip_prefix = "serde-1.0.132",
        build_file = Label("//bazel/cargo/remote:BUILD.serde-1.0.132.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__serde_derive__1_0_132",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.132/download",
        type = "tar.gz",
        sha256 = "ecc0db5cb2556c0e558887d9bbdcf6ac4471e83ff66cf696e5419024d1606276",
        strip_prefix = "serde_derive-1.0.132",
        build_file = Label("//bazel/cargo/remote:BUILD.serde_derive-1.0.132.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__sha2__0_9_8",
        url = "https://crates.io/api/v1/crates/sha2/0.9.8/download",
        type = "tar.gz",
        sha256 = "b69f9a4c9740d74c5baa3fd2e547f9525fa8088a8a958e0ca2409a514e33f5fa",
        strip_prefix = "sha2-0.9.8",
        build_file = Label("//bazel/cargo/remote:BUILD.sha2-0.9.8.bazel"),
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
        name = "proxy_wasm_cpp_host__syn__1_0_84",
        url = "https://crates.io/api/v1/crates/syn/1.0.84/download",
        type = "tar.gz",
        sha256 = "ecb2e6da8ee5eb9a61068762a32fa9619cc591ceb055b3687f4cd4051ec2e06b",
        strip_prefix = "syn-1.0.84",
        build_file = Label("//bazel/cargo/remote:BUILD.syn-1.0.84.bazel"),
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
        name = "proxy_wasm_cpp_host__thiserror__1_0_30",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.30/download",
        type = "tar.gz",
        sha256 = "854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9644e5c417",
        strip_prefix = "thiserror-1.0.30",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-1.0.30.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__thiserror_impl__1_0_30",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.30/download",
        type = "tar.gz",
        sha256 = "aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d377e5714b",
        strip_prefix = "thiserror-impl-1.0.30",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-impl-1.0.30.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__typenum__1_15_0",
        url = "https://crates.io/api/v1/crates/typenum/1.15.0/download",
        type = "tar.gz",
        sha256 = "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987",
        strip_prefix = "typenum-1.15.0",
        build_file = Label("//bazel/cargo/remote:BUILD.typenum-1.15.0.bazel"),
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
        name = "proxy_wasm_cpp_host__version_check__0_9_4",
        url = "https://crates.io/api/v1/crates/version_check/0.9.4/download",
        type = "tar.gz",
        sha256 = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f",
        strip_prefix = "version_check-0.9.4",
        build_file = Label("//bazel/cargo/remote:BUILD.version_check-0.9.4.bazel"),
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
        name = "proxy_wasm_cpp_host__wasmparser__0_81_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.81.0/download",
        type = "tar.gz",
        sha256 = "98930446519f63d00a836efdc22f67766ceae8dbcc1571379f2bcabc6b2b9abc",
        strip_prefix = "wasmparser-0.81.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.81.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "proxy_wasm_cpp_host__wasmsign__0_1_2",
        remote = "https://github.com/jedisct1/wasmsign",
        commit = "dfbc0aabe81885d59e88e667aa9c1e6a62dfe9cc",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmsign-0.1.2.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime__0_32_0",
        url = "https://crates.io/api/v1/crates/wasmtime/0.32.0/download",
        type = "tar.gz",
        sha256 = "5d59b4bcc681f894d018e7032ba3149ab8e5f86828fab0b6ff31999c5691f20b",
        strip_prefix = "wasmtime-0.32.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-0.32.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "proxy_wasm_cpp_host__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "c1c4c59670f45a35ac73910662ab26201e9b6b07",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_cranelift__0_32_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.32.0/download",
        type = "tar.gz",
        sha256 = "30d079ceda53d15a5d29e8f4f8d3fcf9a9bb589c05e29b49ea10d129b5ff8e09",
        strip_prefix = "wasmtime-cranelift-0.32.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-cranelift-0.32.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_environ__0_32_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.32.0/download",
        type = "tar.gz",
        sha256 = "c39e4ba1fb154cca6a0f2350acc83248e22defb0cc647ae78879fe246a49dd61",
        strip_prefix = "wasmtime-environ-0.32.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-environ-0.32.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_jit__0_32_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.32.0/download",
        type = "tar.gz",
        sha256 = "3dd538de9501eb0f2c4c7b3d8acc7f918276ca28591a67d4ebe0672ebd558b65",
        strip_prefix = "wasmtime-jit-0.32.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-jit-0.32.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_runtime__0_32_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.32.0/download",
        type = "tar.gz",
        sha256 = "910ccbd8cc18a02f626a1b2c7a7ddb57808db3c1780fd0af0aa5a5dae86c610b",
        strip_prefix = "wasmtime-runtime-0.32.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-runtime-0.32.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_types__0_32_0",
        url = "https://crates.io/api/v1/crates/wasmtime-types/0.32.0/download",
        type = "tar.gz",
        sha256 = "115bfe5c6eb6aba7e4eaa931ce225871c40280fb2cfb4ce4d3ab98d082e52fc4",
        strip_prefix = "wasmtime-types-0.32.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-types-0.32.0.bazel"),
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
