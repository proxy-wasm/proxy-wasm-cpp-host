"""
@generated
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def proxy_wasm_cpp_host_raze__fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___addr2line__0_14_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.14.0/download",
        type = "tar.gz",
        sha256 = "7c0929d69e78dd9bf5408269919fcbcaeb2e35e5d43e5815517cdc6a8e11a423",
        strip_prefix = "addr2line-0.14.0",
        build_file = Label("//bazel/cargo/remote:BUILD.addr2line-0.14.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___adler__0_2_3",
        url = "https://crates.io/api/v1/crates/adler/0.2.3/download",
        type = "tar.gz",
        sha256 = "ee2a4ec343196209d6594e19543ae87a39f96d5534d7174822a3ad825dd6ed7e",
        strip_prefix = "adler-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.adler-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___aho_corasick__0_7_15",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.15/download",
        type = "tar.gz",
        sha256 = "7404febffaa47dac81aa44dba71523c9d069b1bdc50a77db41195149e17f68e5",
        strip_prefix = "aho-corasick-0.7.15",
        build_file = Label("//bazel/cargo/remote:BUILD.aho-corasick-0.7.15.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___anyhow__1_0_34",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.34/download",
        type = "tar.gz",
        sha256 = "bf8dcb5b4bbaa28653b647d8c77bd4ed40183b48882e130c1f1ffb73de069fd7",
        strip_prefix = "anyhow-1.0.34",
        build_file = Label("//bazel/cargo/remote:BUILD.anyhow-1.0.34.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//bazel/cargo/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___backtrace__0_3_54",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.54/download",
        type = "tar.gz",
        sha256 = "2baad346b2d4e94a24347adeee9c7a93f412ee94b9cc26e5b59dea23848e9f28",
        strip_prefix = "backtrace-0.3.54",
        build_file = Label("//bazel/cargo/remote:BUILD.backtrace-0.3.54.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___bincode__1_3_1",
        url = "https://crates.io/api/v1/crates/bincode/1.3.1/download",
        type = "tar.gz",
        sha256 = "f30d3a39baa26f9651f17b375061f3233dde33424a8b72b0dbe93a68a0bc896d",
        strip_prefix = "bincode-1.3.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bincode-1.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___byteorder__1_3_4",
        url = "https://crates.io/api/v1/crates/byteorder/1.3.4/download",
        type = "tar.gz",
        sha256 = "08c48aae112d48ed9f069b33538ea9e3e90aa263cfa3d1c24309612b1f7472de",
        strip_prefix = "byteorder-1.3.4",
        build_file = Label("//bazel/cargo/remote:BUILD.byteorder-1.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cc__1_0_62",
        url = "https://crates.io/api/v1/crates/cc/1.0.62/download",
        type = "tar.gz",
        sha256 = "f1770ced377336a88a67c473594ccc14eca6f4559217c34f64aac8f83d641b40",
        strip_prefix = "cc-1.0.62",
        build_file = Label("//bazel/cargo/remote:BUILD.cc-1.0.62.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        sha256 = "4785bdd1c96b2a846b2bd7cc02e86b6b3dbf14e7e53446c4f54c92a361040822",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//bazel/cargo/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cranelift_bforest__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.68.0/download",
        type = "tar.gz",
        sha256 = "9221545c0507dc08a62b2d8b5ffe8e17ac580b0a74d1813b496b8d70b070fbd0",
        strip_prefix = "cranelift-bforest-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-bforest-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cranelift_codegen__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.68.0/download",
        type = "tar.gz",
        sha256 = "7e9936ea608b6cd176f107037f6adbb4deac933466fc7231154f96598b2d3ab1",
        strip_prefix = "cranelift-codegen-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cranelift_codegen_meta__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.68.0/download",
        type = "tar.gz",
        sha256 = "4ef2b2768568306540f4c8db3acce9105534d34c4a1e440529c1e702d7f8c8d7",
        strip_prefix = "cranelift-codegen-meta-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-meta-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cranelift_codegen_shared__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.68.0/download",
        type = "tar.gz",
        sha256 = "6759012d6d19c4caec95793f052613e9d4113e925e7f14154defbac0f1d4c938",
        strip_prefix = "cranelift-codegen-shared-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-shared-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cranelift_entity__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.68.0/download",
        type = "tar.gz",
        sha256 = "86badbce14e15f52a45b666b38abe47b204969dd7f8fb7488cb55dd46b361fa6",
        strip_prefix = "cranelift-entity-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-entity-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cranelift_frontend__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.68.0/download",
        type = "tar.gz",
        sha256 = "b608bb7656c554d0a4cf8f50c7a10b857e80306f6ff829ad6d468a7e2323c8d8",
        strip_prefix = "cranelift-frontend-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-frontend-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cranelift_native__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.68.0/download",
        type = "tar.gz",
        sha256 = "5246a1af14b7812ee4d94a3f0c4b295ec02c370c08b0ecc3dec512890fdad175",
        strip_prefix = "cranelift-native-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-native-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___cranelift_wasm__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.68.0/download",
        type = "tar.gz",
        sha256 = "8ef491714e82f9fb910547e2047a3b1c47c03861eca67540c5abd0416371a2ac",
        strip_prefix = "cranelift-wasm-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-wasm-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___crc32fast__1_2_1",
        url = "https://crates.io/api/v1/crates/crc32fast/1.2.1/download",
        type = "tar.gz",
        sha256 = "81156fece84ab6a9f2afdb109ce3ae577e42b1228441eded99bd77f627953b1a",
        strip_prefix = "crc32fast-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.crc32fast-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//bazel/cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___env_logger__0_8_1",
        url = "https://crates.io/api/v1/crates/env_logger/0.8.1/download",
        type = "tar.gz",
        sha256 = "54532e3223c5af90a6a757c90b5c5521564b07e5e7a958681bcd2afad421cdcd",
        strip_prefix = "env_logger-0.8.1",
        build_file = Label("//bazel/cargo/remote:BUILD.env_logger-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___fallible_iterator__0_2_0",
        url = "https://crates.io/api/v1/crates/fallible-iterator/0.2.0/download",
        type = "tar.gz",
        sha256 = "4443176a9f2c162692bd3d352d745ef9413eec5782a80d8fd6f8a1ac692a07f7",
        strip_prefix = "fallible-iterator-0.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.fallible-iterator-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___gimli__0_22_0",
        url = "https://crates.io/api/v1/crates/gimli/0.22.0/download",
        type = "tar.gz",
        sha256 = "aaf91faf136cb47367fa430cd46e37a788775e7fa104f8b4bcb3861dc389b724",
        strip_prefix = "gimli-0.22.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.22.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___gimli__0_23_0",
        url = "https://crates.io/api/v1/crates/gimli/0.23.0/download",
        type = "tar.gz",
        sha256 = "f6503fe142514ca4799d4c26297c4248239fe8838d827db6bd6065c6ed29a6ce",
        strip_prefix = "gimli-0.23.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.23.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___hermit_abi__0_1_17",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.17/download",
        type = "tar.gz",
        sha256 = "5aca5565f760fb5b220e499d72710ed156fdb74e631659e99377d9ebfbd13ae8",
        strip_prefix = "hermit-abi-0.1.17",
        build_file = Label("//bazel/cargo/remote:BUILD.hermit-abi-0.1.17.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___humantime__2_0_1",
        url = "https://crates.io/api/v1/crates/humantime/2.0.1/download",
        type = "tar.gz",
        sha256 = "3c1ad908cc71012b7bea4d0c53ba96a8cba9962f048fa68d143376143d863b7a",
        strip_prefix = "humantime-2.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.humantime-2.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___indexmap__1_1_0",
        url = "https://crates.io/api/v1/crates/indexmap/1.1.0/download",
        type = "tar.gz",
        sha256 = "a4d6d89e0948bf10c08b9ecc8ac5b83f07f857ebe2c0cbe38de15b4e4f510356",
        strip_prefix = "indexmap-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.indexmap-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___itertools__0_9_0",
        url = "https://crates.io/api/v1/crates/itertools/0.9.0/download",
        type = "tar.gz",
        sha256 = "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b",
        strip_prefix = "itertools-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.itertools-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___libc__0_2_80",
        url = "https://crates.io/api/v1/crates/libc/0.2.80/download",
        type = "tar.gz",
        sha256 = "4d58d1b70b004888f764dfbf6a26a3b0342a1632d33968e4a179d8011c760614",
        strip_prefix = "libc-0.2.80",
        build_file = Label("//bazel/cargo/remote:BUILD.libc-0.2.80.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___log__0_4_11",
        url = "https://crates.io/api/v1/crates/log/0.4.11/download",
        type = "tar.gz",
        sha256 = "4fabed175da42fed1fa0746b0ea71f412aa9d35e76e95e59b192c64b9dc2bf8b",
        strip_prefix = "log-0.4.11",
        build_file = Label("//bazel/cargo/remote:BUILD.log-0.4.11.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___mach__0_3_2",
        url = "https://crates.io/api/v1/crates/mach/0.3.2/download",
        type = "tar.gz",
        sha256 = "b823e83b2affd8f40a9ee8c29dbc56404c1e34cd2710921f2801e2cf29527afa",
        strip_prefix = "mach-0.3.2",
        build_file = Label("//bazel/cargo/remote:BUILD.mach-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___memchr__2_3_4",
        url = "https://crates.io/api/v1/crates/memchr/2.3.4/download",
        type = "tar.gz",
        sha256 = "0ee1c47aaa256ecabcaea351eae4a9b01ef39ed810004e298d2511ed284b1525",
        strip_prefix = "memchr-2.3.4",
        build_file = Label("//bazel/cargo/remote:BUILD.memchr-2.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___memoffset__0_5_6",
        url = "https://crates.io/api/v1/crates/memoffset/0.5.6/download",
        type = "tar.gz",
        sha256 = "043175f069eda7b85febe4a74abbaeff828d9f8b448515d3151a14a3542811aa",
        strip_prefix = "memoffset-0.5.6",
        build_file = Label("//bazel/cargo/remote:BUILD.memoffset-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___miniz_oxide__0_4_3",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.4.3/download",
        type = "tar.gz",
        sha256 = "0f2d26ec3309788e423cfbf68ad1800f061638098d76a83681af979dc4eda19d",
        strip_prefix = "miniz_oxide-0.4.3",
        build_file = Label("//bazel/cargo/remote:BUILD.miniz_oxide-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___more_asserts__0_2_1",
        url = "https://crates.io/api/v1/crates/more-asserts/0.2.1/download",
        type = "tar.gz",
        sha256 = "0debeb9fcf88823ea64d64e4a815ab1643f33127d995978e099942ce38f25238",
        strip_prefix = "more-asserts-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.more-asserts-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___object__0_21_1",
        url = "https://crates.io/api/v1/crates/object/0.21.1/download",
        type = "tar.gz",
        sha256 = "37fd5004feb2ce328a52b0b3d01dbf4ffff72583493900ed15f22d4111c51693",
        strip_prefix = "object-0.21.1",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.21.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___object__0_22_0",
        url = "https://crates.io/api/v1/crates/object/0.22.0/download",
        type = "tar.gz",
        sha256 = "8d3b63360ec3cb337817c2dbd47ab4a0f170d285d8e5a2064600f3def1402397",
        strip_prefix = "object-0.22.0",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.22.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___once_cell__1_4_1",
        url = "https://crates.io/api/v1/crates/once_cell/1.4.1/download",
        type = "tar.gz",
        sha256 = "260e51e7efe62b592207e9e13a68e43692a7a279171d6ba57abd208bf23645ad",
        strip_prefix = "once_cell-1.4.1",
        build_file = Label("//bazel/cargo/remote:BUILD.once_cell-1.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___proc_macro2__1_0_24",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.24/download",
        type = "tar.gz",
        sha256 = "1e0704ee1a7e00d7bb417d0770ea303c1bccbabf0ef1667dae92b5967f5f8a71",
        strip_prefix = "proc-macro2-1.0.24",
        build_file = Label("//bazel/cargo/remote:BUILD.proc-macro2-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___psm__0_1_11",
        url = "https://crates.io/api/v1/crates/psm/0.1.11/download",
        type = "tar.gz",
        sha256 = "96e0536f6528466dbbbbe6b986c34175a8d0ff25b794c4bacda22e068cd2f2c5",
        strip_prefix = "psm-0.1.11",
        build_file = Label("//bazel/cargo/remote:BUILD.psm-0.1.11.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___quote__1_0_7",
        url = "https://crates.io/api/v1/crates/quote/1.0.7/download",
        type = "tar.gz",
        sha256 = "aa563d17ecb180e500da1cfd2b028310ac758de548efdd203e18f283af693f37",
        strip_prefix = "quote-1.0.7",
        build_file = Label("//bazel/cargo/remote:BUILD.quote-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___raw_cpuid__7_0_3",
        url = "https://crates.io/api/v1/crates/raw-cpuid/7.0.3/download",
        type = "tar.gz",
        sha256 = "b4a349ca83373cfa5d6dbb66fd76e58b2cca08da71a5f6400de0a0a6a9bceeaf",
        strip_prefix = "raw-cpuid-7.0.3",
        build_file = Label("//bazel/cargo/remote:BUILD.raw-cpuid-7.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___regalloc__0_0_31",
        url = "https://crates.io/api/v1/crates/regalloc/0.0.31/download",
        type = "tar.gz",
        sha256 = "571f7f397d61c4755285cd37853fe8e03271c243424a907415909379659381c5",
        strip_prefix = "regalloc-0.0.31",
        build_file = Label("//bazel/cargo/remote:BUILD.regalloc-0.0.31.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___regex__1_4_2",
        url = "https://crates.io/api/v1/crates/regex/1.4.2/download",
        type = "tar.gz",
        sha256 = "38cf2c13ed4745de91a5eb834e11c00bcc3709e773173b2ce4c56c9fbde04b9c",
        strip_prefix = "regex-1.4.2",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___regex_syntax__0_6_21",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.21/download",
        type = "tar.gz",
        sha256 = "3b181ba2dcf07aaccad5448e8ead58db5b742cf85dfe035e2227f137a539a189",
        strip_prefix = "regex-syntax-0.6.21",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-syntax-0.6.21.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___region__2_2_0",
        url = "https://crates.io/api/v1/crates/region/2.2.0/download",
        type = "tar.gz",
        sha256 = "877e54ea2adcd70d80e9179344c97f93ef0dffd6b03e1f4529e6e83ab2fa9ae0",
        strip_prefix = "region-2.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.region-2.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___rustc_demangle__0_1_18",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.18/download",
        type = "tar.gz",
        sha256 = "6e3bad0ee36814ca07d7968269dd4b7ec89ec2da10c4bb613928d3077083c232",
        strip_prefix = "rustc-demangle-0.1.18",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-demangle-0.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___rustc_hash__1_1_0",
        url = "https://crates.io/api/v1/crates/rustc-hash/1.1.0/download",
        type = "tar.gz",
        sha256 = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2",
        strip_prefix = "rustc-hash-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-hash-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        sha256 = "138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___serde__1_0_117",
        url = "https://crates.io/api/v1/crates/serde/1.0.117/download",
        type = "tar.gz",
        sha256 = "b88fa983de7720629c9387e9f517353ed404164b1e482c970a90c1a4aaf7dc1a",
        strip_prefix = "serde-1.0.117",
        build_file = Label("//bazel/cargo/remote:BUILD.serde-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___serde_derive__1_0_117",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.117/download",
        type = "tar.gz",
        sha256 = "cbd1ae72adb44aab48f325a02444a5fc079349a8d804c1fc922aed3f7454c74e",
        strip_prefix = "serde_derive-1.0.117",
        build_file = Label("//bazel/cargo/remote:BUILD.serde_derive-1.0.117.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___smallvec__1_4_2",
        url = "https://crates.io/api/v1/crates/smallvec/1.4.2/download",
        type = "tar.gz",
        sha256 = "fbee7696b84bbf3d89a1c2eccff0850e3047ed46bfcd2e92c29a2d074d57e252",
        strip_prefix = "smallvec-1.4.2",
        build_file = Label("//bazel/cargo/remote:BUILD.smallvec-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___stable_deref_trait__1_2_0",
        url = "https://crates.io/api/v1/crates/stable_deref_trait/1.2.0/download",
        type = "tar.gz",
        sha256 = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3",
        strip_prefix = "stable_deref_trait-1.2.0",
        build_file = Label("//bazel/cargo/remote:BUILD.stable_deref_trait-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___syn__1_0_48",
        url = "https://crates.io/api/v1/crates/syn/1.0.48/download",
        type = "tar.gz",
        sha256 = "cc371affeffc477f42a221a1e4297aedcea33d47d19b61455588bd9d8f6b19ac",
        strip_prefix = "syn-1.0.48",
        build_file = Label("//bazel/cargo/remote:BUILD.syn-1.0.48.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___target_lexicon__0_11_1",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.11.1/download",
        type = "tar.gz",
        sha256 = "4ee5a98e506fb7231a304c3a1bd7c132a55016cf65001e0282480665870dfcb9",
        strip_prefix = "target-lexicon-0.11.1",
        build_file = Label("//bazel/cargo/remote:BUILD.target-lexicon-0.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___termcolor__1_1_0",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.0/download",
        type = "tar.gz",
        sha256 = "bb6bfa289a4d7c5766392812c0a1f4c1ba45afa1ad47803c11e1f407d846d75f",
        strip_prefix = "termcolor-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.termcolor-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___thiserror__1_0_22",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.22/download",
        type = "tar.gz",
        sha256 = "0e9ae34b84616eedaaf1e9dd6026dbe00dcafa92aa0c8077cb69df1fcfe5e53e",
        strip_prefix = "thiserror-1.0.22",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-1.0.22.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___thiserror_impl__1_0_22",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.22/download",
        type = "tar.gz",
        sha256 = "9ba20f23e85b10754cd195504aebf6a27e2e6cbe28c17778a0c930724628dd56",
        strip_prefix = "thiserror-impl-1.0.22",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-impl-1.0.22.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___thread_local__1_0_1",
        url = "https://crates.io/api/v1/crates/thread_local/1.0.1/download",
        type = "tar.gz",
        sha256 = "d40c6d1b69745a6ec6fb1ca717914848da4b44ae29d9b3080cbee91d72a69b14",
        strip_prefix = "thread_local-1.0.1",
        build_file = Label("//bazel/cargo/remote:BUILD.thread_local-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___unicode_xid__0_2_1",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.1/download",
        type = "tar.gz",
        sha256 = "f7fe0bb3479651439c9112f72b6c505038574c9fbb575ed1bf3b797fa39dd564",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.unicode-xid-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmparser__0_57_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.57.0/download",
        type = "tar.gz",
        sha256 = "32fddd575d477c6e9702484139cf9f23dcd554b06d185ed0f56c857dd3a47aa6",
        strip_prefix = "wasmparser-0.57.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.57.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmparser__0_65_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.65.0/download",
        type = "tar.gz",
        sha256 = "87cc2fe6350834b4e528ba0901e7aa405d78b89dc1fa3145359eb4de0e323fcf",
        strip_prefix = "wasmparser-0.65.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.65.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmtime__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime/0.21.0/download",
        type = "tar.gz",
        sha256 = "7a4d945221f4d29feecdac80514c1ef1527dfcdcc7715ff1b4a5161fe5c8ebab",
        strip_prefix = "wasmtime-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-0.21.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "proxy_wasm_cpp_host_raze___wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "ab1958434a2b7a5b07d197e71b88200d9e06e026",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmtime_cranelift__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.21.0/download",
        type = "tar.gz",
        sha256 = "f1e55c17317922951a9bdd5547b527d2cc7be3cea118dc17ad7c05a4c8e67c7a",
        strip_prefix = "wasmtime-cranelift-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-cranelift-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmtime_debug__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-debug/0.21.0/download",
        type = "tar.gz",
        sha256 = "a576daa6b228f8663c38bede2f7f23d094d578b0061c39fc122cc28eee1e2c18",
        strip_prefix = "wasmtime-debug-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-debug-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmtime_environ__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.21.0/download",
        type = "tar.gz",
        sha256 = "396ceda32fd67205235c098e092a85716942883bfd2c773c250cf5f2457b8307",
        strip_prefix = "wasmtime-environ-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-environ-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmtime_jit__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.21.0/download",
        type = "tar.gz",
        sha256 = "b2a45f6dd5bdf12d41f10100482d58d9cb160a85af5884dfd41a2861af4b0f50",
        strip_prefix = "wasmtime-jit-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-jit-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmtime_obj__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-obj/0.21.0/download",
        type = "tar.gz",
        sha256 = "a84aebe3b4331a603625f069944192fa3f6ffe499802ef91273fd73af9a8087d",
        strip_prefix = "wasmtime-obj-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-obj-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmtime_profiling__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-profiling/0.21.0/download",
        type = "tar.gz",
        sha256 = "25f27fda1b81d701f7ea1da9ae51b5b62d4cdc37ca5b93eae771ca2cde53b70c",
        strip_prefix = "wasmtime-profiling-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-profiling-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___wasmtime_runtime__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.21.0/download",
        type = "tar.gz",
        sha256 = "e452b8b3b32dbf1b831f05003a740581cc2c3c2122f5806bae9f167495e1e66c",
        strip_prefix = "wasmtime-runtime-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-runtime-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host_raze___winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )
