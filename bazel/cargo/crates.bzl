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
        name = "proxy_wasm_cpp_host__adler__0_2_3",
        url = "https://crates.io/api/v1/crates/adler/0.2.3/download",
        type = "tar.gz",
        sha256 = "ee2a4ec343196209d6594e19543ae87a39f96d5534d7174822a3ad825dd6ed7e",
        strip_prefix = "adler-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.adler-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__aho_corasick__0_7_15",
        url = "https://crates.io/api/v1/crates/aho-corasick/0.7.15/download",
        type = "tar.gz",
        sha256 = "7404febffaa47dac81aa44dba71523c9d069b1bdc50a77db41195149e17f68e5",
        strip_prefix = "aho-corasick-0.7.15",
        build_file = Label("//bazel/cargo/remote:BUILD.aho-corasick-0.7.15.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__anyhow__1_0_38",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.38/download",
        type = "tar.gz",
        sha256 = "afddf7f520a80dbf76e6f50a35bca42a2331ef227a28b3b6dc5c2e2338d114b1",
        strip_prefix = "anyhow-1.0.38",
        build_file = Label("//bazel/cargo/remote:BUILD.anyhow-1.0.38.bazel"),
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
        name = "proxy_wasm_cpp_host__backtrace__0_3_56",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.56/download",
        type = "tar.gz",
        sha256 = "9d117600f438b1707d4e4ae15d3595657288f8235a0eb593e80ecc98ab34e1bc",
        strip_prefix = "backtrace-0.3.56",
        build_file = Label("//bazel/cargo/remote:BUILD.backtrace-0.3.56.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__bincode__1_3_1",
        url = "https://crates.io/api/v1/crates/bincode/1.3.1/download",
        type = "tar.gz",
        sha256 = "f30d3a39baa26f9651f17b375061f3233dde33424a8b72b0dbe93a68a0bc896d",
        strip_prefix = "bincode-1.3.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bincode-1.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__byteorder__1_4_2",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.2/download",
        type = "tar.gz",
        sha256 = "ae44d1a3d5a19df61dd0c8beb138458ac2a53a7ac09eba97d55592540004306b",
        strip_prefix = "byteorder-1.4.2",
        build_file = Label("//bazel/cargo/remote:BUILD.byteorder-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cc__1_0_66",
        url = "https://crates.io/api/v1/crates/cc/1.0.66/download",
        type = "tar.gz",
        sha256 = "4c0496836a84f8d0495758516b8621a622beb77c0fed418570e50764093ced48",
        strip_prefix = "cc-1.0.66",
        build_file = Label("//bazel/cargo/remote:BUILD.cc-1.0.66.bazel"),
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
        name = "proxy_wasm_cpp_host__cranelift_bforest__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.68.0/download",
        type = "tar.gz",
        sha256 = "9221545c0507dc08a62b2d8b5ffe8e17ac580b0a74d1813b496b8d70b070fbd0",
        strip_prefix = "cranelift-bforest-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-bforest-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.68.0/download",
        type = "tar.gz",
        sha256 = "7e9936ea608b6cd176f107037f6adbb4deac933466fc7231154f96598b2d3ab1",
        strip_prefix = "cranelift-codegen-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen_meta__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.68.0/download",
        type = "tar.gz",
        sha256 = "4ef2b2768568306540f4c8db3acce9105534d34c4a1e440529c1e702d7f8c8d7",
        strip_prefix = "cranelift-codegen-meta-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-meta-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen_shared__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.68.0/download",
        type = "tar.gz",
        sha256 = "6759012d6d19c4caec95793f052613e9d4113e925e7f14154defbac0f1d4c938",
        strip_prefix = "cranelift-codegen-shared-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-shared-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_entity__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.68.0/download",
        type = "tar.gz",
        sha256 = "86badbce14e15f52a45b666b38abe47b204969dd7f8fb7488cb55dd46b361fa6",
        strip_prefix = "cranelift-entity-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-entity-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_frontend__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.68.0/download",
        type = "tar.gz",
        sha256 = "b608bb7656c554d0a4cf8f50c7a10b857e80306f6ff829ad6d468a7e2323c8d8",
        strip_prefix = "cranelift-frontend-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-frontend-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_native__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.68.0/download",
        type = "tar.gz",
        sha256 = "5246a1af14b7812ee4d94a3f0c4b295ec02c370c08b0ecc3dec512890fdad175",
        strip_prefix = "cranelift-native-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-native-0.68.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_wasm__0_68_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.68.0/download",
        type = "tar.gz",
        sha256 = "8ef491714e82f9fb910547e2047a3b1c47c03861eca67540c5abd0416371a2ac",
        strip_prefix = "cranelift-wasm-0.68.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-wasm-0.68.0.bazel"),
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
        name = "proxy_wasm_cpp_host__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//bazel/cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__env_logger__0_8_3",
        url = "https://crates.io/api/v1/crates/env_logger/0.8.3/download",
        type = "tar.gz",
        sha256 = "17392a012ea30ef05a610aa97dfb49496e71c9f676b27879922ea5bdf60d9d3f",
        strip_prefix = "env_logger-0.8.3",
        build_file = Label("//bazel/cargo/remote:BUILD.env_logger-0.8.3.bazel"),
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
        name = "proxy_wasm_cpp_host__gimli__0_22_0",
        url = "https://crates.io/api/v1/crates/gimli/0.22.0/download",
        type = "tar.gz",
        sha256 = "aaf91faf136cb47367fa430cd46e37a788775e7fa104f8b4bcb3861dc389b724",
        strip_prefix = "gimli-0.22.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.22.0.bazel"),
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
        name = "proxy_wasm_cpp_host__hermit_abi__0_1_18",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.18/download",
        type = "tar.gz",
        sha256 = "322f4de77956e22ed0e5032c359a0f1273f1f7f0d79bfa3b8ffbc730d7fbcc5c",
        strip_prefix = "hermit-abi-0.1.18",
        build_file = Label("//bazel/cargo/remote:BUILD.hermit-abi-0.1.18.bazel"),
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
        name = "proxy_wasm_cpp_host__indexmap__1_1_0",
        url = "https://crates.io/api/v1/crates/indexmap/1.1.0/download",
        type = "tar.gz",
        sha256 = "a4d6d89e0948bf10c08b9ecc8ac5b83f07f857ebe2c0cbe38de15b4e4f510356",
        strip_prefix = "indexmap-1.1.0",
        build_file = Label("//bazel/cargo/remote:BUILD.indexmap-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__itertools__0_9_0",
        url = "https://crates.io/api/v1/crates/itertools/0.9.0/download",
        type = "tar.gz",
        sha256 = "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b",
        strip_prefix = "itertools-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.itertools-0.9.0.bazel"),
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
        name = "proxy_wasm_cpp_host__libc__0_2_86",
        url = "https://crates.io/api/v1/crates/libc/0.2.86/download",
        type = "tar.gz",
        sha256 = "b7282d924be3275cec7f6756ff4121987bc6481325397dde6ba3e7802b1a8b1c",
        strip_prefix = "libc-0.2.86",
        build_file = Label("//bazel/cargo/remote:BUILD.libc-0.2.86.bazel"),
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
        name = "proxy_wasm_cpp_host__memchr__2_3_4",
        url = "https://crates.io/api/v1/crates/memchr/2.3.4/download",
        type = "tar.gz",
        sha256 = "0ee1c47aaa256ecabcaea351eae4a9b01ef39ed810004e298d2511ed284b1525",
        strip_prefix = "memchr-2.3.4",
        build_file = Label("//bazel/cargo/remote:BUILD.memchr-2.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__memoffset__0_5_6",
        url = "https://crates.io/api/v1/crates/memoffset/0.5.6/download",
        type = "tar.gz",
        sha256 = "043175f069eda7b85febe4a74abbaeff828d9f8b448515d3151a14a3542811aa",
        strip_prefix = "memoffset-0.5.6",
        build_file = Label("//bazel/cargo/remote:BUILD.memoffset-0.5.6.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__miniz_oxide__0_4_3",
        url = "https://crates.io/api/v1/crates/miniz_oxide/0.4.3/download",
        type = "tar.gz",
        sha256 = "0f2d26ec3309788e423cfbf68ad1800f061638098d76a83681af979dc4eda19d",
        strip_prefix = "miniz_oxide-0.4.3",
        build_file = Label("//bazel/cargo/remote:BUILD.miniz_oxide-0.4.3.bazel"),
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
        name = "proxy_wasm_cpp_host__object__0_21_1",
        url = "https://crates.io/api/v1/crates/object/0.21.1/download",
        type = "tar.gz",
        sha256 = "37fd5004feb2ce328a52b0b3d01dbf4ffff72583493900ed15f22d4111c51693",
        strip_prefix = "object-0.21.1",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.21.1.bazel"),
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
        name = "proxy_wasm_cpp_host__once_cell__1_5_2",
        url = "https://crates.io/api/v1/crates/once_cell/1.5.2/download",
        type = "tar.gz",
        sha256 = "13bd41f508810a131401606d54ac32a467c97172d74ba7662562ebba5ad07fa0",
        strip_prefix = "once_cell-1.5.2",
        build_file = Label("//bazel/cargo/remote:BUILD.once_cell-1.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__proc_macro2__1_0_24",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.24/download",
        type = "tar.gz",
        sha256 = "1e0704ee1a7e00d7bb417d0770ea303c1bccbabf0ef1667dae92b5967f5f8a71",
        strip_prefix = "proc-macro2-1.0.24",
        build_file = Label("//bazel/cargo/remote:BUILD.proc-macro2-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__psm__0_1_12",
        url = "https://crates.io/api/v1/crates/psm/0.1.12/download",
        type = "tar.gz",
        sha256 = "3abf49e5417290756acfd26501536358560c4a5cc4a0934d390939acb3e7083a",
        strip_prefix = "psm-0.1.12",
        build_file = Label("//bazel/cargo/remote:BUILD.psm-0.1.12.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__quote__1_0_9",
        url = "https://crates.io/api/v1/crates/quote/1.0.9/download",
        type = "tar.gz",
        sha256 = "c3d0b9745dc2debf507c8422de05d7226cc1f0644216dfdfead988f9b1ab32a7",
        strip_prefix = "quote-1.0.9",
        build_file = Label("//bazel/cargo/remote:BUILD.quote-1.0.9.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__raw_cpuid__7_0_4",
        url = "https://crates.io/api/v1/crates/raw-cpuid/7.0.4/download",
        type = "tar.gz",
        sha256 = "beb71f708fe39b2c5e98076204c3cc094ee5a4c12c4cdb119a2b72dc34164f41",
        strip_prefix = "raw-cpuid-7.0.4",
        build_file = Label("//bazel/cargo/remote:BUILD.raw-cpuid-7.0.4.bazel"),
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
        name = "proxy_wasm_cpp_host__regex__1_4_3",
        url = "https://crates.io/api/v1/crates/regex/1.4.3/download",
        type = "tar.gz",
        sha256 = "d9251239e129e16308e70d853559389de218ac275b515068abc96829d05b948a",
        strip_prefix = "regex-1.4.3",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__regex_syntax__0_6_22",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.22/download",
        type = "tar.gz",
        sha256 = "b5eb417147ba9860a96cfe72a0b93bf88fee1744b5636ec99ab20c1aa9376581",
        strip_prefix = "regex-syntax-0.6.22",
        build_file = Label("//bazel/cargo/remote:BUILD.regex-syntax-0.6.22.bazel"),
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
        name = "proxy_wasm_cpp_host__rustc_demangle__0_1_18",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.18/download",
        type = "tar.gz",
        sha256 = "6e3bad0ee36814ca07d7968269dd4b7ec89ec2da10c4bb613928d3077083c232",
        strip_prefix = "rustc-demangle-0.1.18",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-demangle-0.1.18.bazel"),
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
        name = "proxy_wasm_cpp_host__rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        sha256 = "138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//bazel/cargo/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__serde__1_0_123",
        url = "https://crates.io/api/v1/crates/serde/1.0.123/download",
        type = "tar.gz",
        sha256 = "92d5161132722baa40d802cc70b15262b98258453e85e5d1d365c757c73869ae",
        strip_prefix = "serde-1.0.123",
        build_file = Label("//bazel/cargo/remote:BUILD.serde-1.0.123.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__serde_derive__1_0_123",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.123/download",
        type = "tar.gz",
        sha256 = "9391c295d64fc0abb2c556bad848f33cb8296276b1ad2677d1ae1ace4f258f31",
        strip_prefix = "serde_derive-1.0.123",
        build_file = Label("//bazel/cargo/remote:BUILD.serde_derive-1.0.123.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__smallvec__1_6_1",
        url = "https://crates.io/api/v1/crates/smallvec/1.6.1/download",
        type = "tar.gz",
        sha256 = "fe0f37c9e8f3c5a4a66ad655a93c74daac4ad00c441533bf5c6e7990bb42604e",
        strip_prefix = "smallvec-1.6.1",
        build_file = Label("//bazel/cargo/remote:BUILD.smallvec-1.6.1.bazel"),
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
        name = "proxy_wasm_cpp_host__syn__1_0_60",
        url = "https://crates.io/api/v1/crates/syn/1.0.60/download",
        type = "tar.gz",
        sha256 = "c700597eca8a5a762beb35753ef6b94df201c81cca676604f547495a0d7f0081",
        strip_prefix = "syn-1.0.60",
        build_file = Label("//bazel/cargo/remote:BUILD.syn-1.0.60.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__target_lexicon__0_11_2",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.11.2/download",
        type = "tar.gz",
        sha256 = "422045212ea98508ae3d28025bc5aaa2bd4a9cdaecd442a08da2ee620ee9ea95",
        strip_prefix = "target-lexicon-0.11.2",
        build_file = Label("//bazel/cargo/remote:BUILD.target-lexicon-0.11.2.bazel"),
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
        name = "proxy_wasm_cpp_host__thiserror__1_0_23",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.23/download",
        type = "tar.gz",
        sha256 = "76cc616c6abf8c8928e2fdcc0dbfab37175edd8fb49a4641066ad1364fdab146",
        strip_prefix = "thiserror-1.0.23",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-1.0.23.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__thiserror_impl__1_0_23",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.23/download",
        type = "tar.gz",
        sha256 = "9be73a2caec27583d0046ef3796c3794f868a5bc813db689eed00c7631275cd1",
        strip_prefix = "thiserror-impl-1.0.23",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-impl-1.0.23.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__thread_local__1_1_3",
        url = "https://crates.io/api/v1/crates/thread_local/1.1.3/download",
        type = "tar.gz",
        sha256 = "8018d24e04c95ac8790716a5987d0fec4f8b27249ffa0f7d33f1369bdfb88cbd",
        strip_prefix = "thread_local-1.1.3",
        build_file = Label("//bazel/cargo/remote:BUILD.thread_local-1.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__unicode_xid__0_2_1",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.1/download",
        type = "tar.gz",
        sha256 = "f7fe0bb3479651439c9112f72b6c505038574c9fbb575ed1bf3b797fa39dd564",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.unicode-xid-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmparser__0_57_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.57.0/download",
        type = "tar.gz",
        sha256 = "32fddd575d477c6e9702484139cf9f23dcd554b06d185ed0f56c857dd3a47aa6",
        strip_prefix = "wasmparser-0.57.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.57.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmparser__0_65_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.65.0/download",
        type = "tar.gz",
        sha256 = "87cc2fe6350834b4e528ba0901e7aa405d78b89dc1fa3145359eb4de0e323fcf",
        strip_prefix = "wasmparser-0.65.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmparser-0.65.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime/0.21.0/download",
        type = "tar.gz",
        sha256 = "7a4d945221f4d29feecdac80514c1ef1527dfcdcc7715ff1b4a5161fe5c8ebab",
        strip_prefix = "wasmtime-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-0.21.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "proxy_wasm_cpp_host__wasmtime_c_api_macros__0_19_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "ab1958434a2b7a5b07d197e71b88200d9e06e026",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-c-api-macros-0.19.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_cranelift__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.21.0/download",
        type = "tar.gz",
        sha256 = "f1e55c17317922951a9bdd5547b527d2cc7be3cea118dc17ad7c05a4c8e67c7a",
        strip_prefix = "wasmtime-cranelift-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-cranelift-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_debug__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-debug/0.21.0/download",
        type = "tar.gz",
        sha256 = "a576daa6b228f8663c38bede2f7f23d094d578b0061c39fc122cc28eee1e2c18",
        strip_prefix = "wasmtime-debug-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-debug-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_environ__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.21.0/download",
        type = "tar.gz",
        sha256 = "396ceda32fd67205235c098e092a85716942883bfd2c773c250cf5f2457b8307",
        strip_prefix = "wasmtime-environ-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-environ-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_jit__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.21.0/download",
        type = "tar.gz",
        sha256 = "b2a45f6dd5bdf12d41f10100482d58d9cb160a85af5884dfd41a2861af4b0f50",
        strip_prefix = "wasmtime-jit-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-jit-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_obj__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-obj/0.21.0/download",
        type = "tar.gz",
        sha256 = "a84aebe3b4331a603625f069944192fa3f6ffe499802ef91273fd73af9a8087d",
        strip_prefix = "wasmtime-obj-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-obj-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_profiling__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-profiling/0.21.0/download",
        type = "tar.gz",
        sha256 = "25f27fda1b81d701f7ea1da9ae51b5b62d4cdc37ca5b93eae771ca2cde53b70c",
        strip_prefix = "wasmtime-profiling-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-profiling-0.21.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_runtime__0_21_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.21.0/download",
        type = "tar.gz",
        sha256 = "e452b8b3b32dbf1b831f05003a740581cc2c3c2122f5806bae9f167495e1e66c",
        strip_prefix = "wasmtime-runtime-0.21.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-runtime-0.21.0.bazel"),
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
