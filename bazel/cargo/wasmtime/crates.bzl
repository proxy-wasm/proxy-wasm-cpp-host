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
        name = "wasmtime__addr2line__0_19_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.19.0/download",
        type = "tar.gz",
        sha256 = "a76fd60b23679b7d19bd066031410fb7e458ccc5e958eb5c325888ce4baedc97",
        strip_prefix = "addr2line-0.19.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.addr2line-0.19.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__ahash__0_8_3",
        url = "https://crates.io/api/v1/crates/ahash/0.8.3/download",
        type = "tar.gz",
        sha256 = "2c99f64d1e06488f620f932677e24bc6e2897582980441ae90a671415bd7ec2f",
        strip_prefix = "ahash-0.8.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ahash-0.8.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__aho_corasick__1_0_5",
        url = "https://crates.io/api/v1/crates/aho-corasick/1.0.5/download",
        type = "tar.gz",
        sha256 = "0c378d78423fdad8089616f827526ee33c19f2fddbd5de1629152c9593ba4783",
        strip_prefix = "aho-corasick-1.0.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.aho-corasick-1.0.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__anyhow__1_0_75",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.75/download",
        type = "tar.gz",
        sha256 = "a4668cab20f66d8d020e1fbc0ebe47217433c1b6c8f2040faf858554e394ace6",
        strip_prefix = "anyhow-1.0.75",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.75.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__arbitrary__1_3_0",
        url = "https://crates.io/api/v1/crates/arbitrary/1.3.0/download",
        type = "tar.gz",
        sha256 = "e2d098ff73c1ca148721f37baad5ea6a465a13f9573aba8641fbbbae8164a54e",
        strip_prefix = "arbitrary-1.3.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.arbitrary-1.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__async_trait__0_1_73",
        url = "https://crates.io/api/v1/crates/async-trait/0.1.73/download",
        type = "tar.gz",
        sha256 = "bc00ceb34980c03614e35a3a4e218276a0a824e911d07651cd0d858a51e8c0f0",
        strip_prefix = "async-trait-0.1.73",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.async-trait-0.1.73.bazel"),
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
        name = "wasmtime__base64__0_21_4",
        url = "https://crates.io/api/v1/crates/base64/0.21.4/download",
        type = "tar.gz",
        sha256 = "9ba43ea6f343b788c8764558649e08df62f86c6ef251fdaeb1ffd010a9ae50a2",
        strip_prefix = "base64-0.21.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.base64-0.21.4.bazel"),
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
        name = "wasmtime__bitflags__2_4_0",
        url = "https://crates.io/api/v1/crates/bitflags/2.4.0/download",
        type = "tar.gz",
        sha256 = "b4682ae6287fcf752ecaabbfcc7b6f9b72aa33933dc23a554d853aea8eea8635",
        strip_prefix = "bitflags-2.4.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bitflags-2.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__block_buffer__0_10_4",
        url = "https://crates.io/api/v1/crates/block-buffer/0.10.4/download",
        type = "tar.gz",
        sha256 = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71",
        strip_prefix = "block-buffer-0.10.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.block-buffer-0.10.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__bumpalo__3_14_0",
        url = "https://crates.io/api/v1/crates/bumpalo/3.14.0/download",
        type = "tar.gz",
        sha256 = "7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec",
        strip_prefix = "bumpalo-3.14.0",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:bumpalo.patch",
        ],
        patch_args = [
            "-p1",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bumpalo-3.14.0.bazel"),
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
        name = "wasmtime__cc__1_0_83",
        url = "https://crates.io/api/v1/crates/cc/1.0.83/download",
        type = "tar.gz",
        sha256 = "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0",
        strip_prefix = "cc-1.0.83",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cc-1.0.83.bazel"),
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
        name = "wasmtime__cpufeatures__0_2_9",
        url = "https://crates.io/api/v1/crates/cpufeatures/0.2.9/download",
        type = "tar.gz",
        sha256 = "a17b76ff3a4162b0b27f354a0c87015ddad39d35f9c0c36607a3bdd175dde1f1",
        strip_prefix = "cpufeatures-0.2.9",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cpufeatures-0.2.9.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_bforest__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.96.4/download",
        type = "tar.gz",
        sha256 = "182b82f78049f54d3aee5a19870d356ef754226665a695ce2fcdd5d55379718e",
        strip_prefix = "cranelift-bforest-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.96.4/download",
        type = "tar.gz",
        sha256 = "e7c027bf04ecae5b048d3554deb888061bc26f426afff47bf06d6ac933dce0a6",
        strip_prefix = "cranelift-codegen-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.96.4/download",
        type = "tar.gz",
        sha256 = "649f70038235e4c81dba5680d7e5ae83e1081f567232425ab98b55b03afd9904",
        strip_prefix = "cranelift-codegen-meta-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.96.4/download",
        type = "tar.gz",
        sha256 = "7a1d1c5ee2611c6a0bdc8d42d5d3dc5ce8bf53a8040561e26e88b9b21f966417",
        strip_prefix = "cranelift-codegen-shared-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_control__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-control/0.96.4/download",
        type = "tar.gz",
        sha256 = "da66a68b1f48da863d1d53209b8ddb1a6236411d2d72a280ffa8c2f734f7219e",
        strip_prefix = "cranelift-control-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-control-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.96.4/download",
        type = "tar.gz",
        sha256 = "9bd897422dbb66621fa558f4d9209875530c53e3c8f4b13b2849fbb667c431a6",
        strip_prefix = "cranelift-entity-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.96.4/download",
        type = "tar.gz",
        sha256 = "05db883114c98cfcd6959f72278d2fec42e01ea6a6982cfe4f20e88eebe86653",
        strip_prefix = "cranelift-frontend-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_isle__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.96.4/download",
        type = "tar.gz",
        sha256 = "84559de86e2564152c87e299c8b2559f9107e9c6d274b24ebeb04fb0a5f4abf8",
        strip_prefix = "cranelift-isle-0.96.4",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:cranelift-isle.patch",
        ],
        patch_args = [
            "-p4",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-isle-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.96.4/download",
        type = "tar.gz",
        sha256 = "3f40b57f187f0fe1ffaf281df4adba2b4bc623a0f6651954da9f3c184be72761",
        strip_prefix = "cranelift-native-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.96.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_96_4",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.96.4/download",
        type = "tar.gz",
        sha256 = "f3eab6084cc789b9dd0b1316241efeb2968199fee709f4bb4fe0fb0923bb468b",
        strip_prefix = "cranelift-wasm-0.96.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.96.4.bazel"),
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
        name = "wasmtime__crossbeam_channel__0_5_8",
        url = "https://crates.io/api/v1/crates/crossbeam-channel/0.5.8/download",
        type = "tar.gz",
        sha256 = "a33c2bf77f2df06183c3aa30d1e96c0695a313d4f9c453cc3762a6db39f99200",
        strip_prefix = "crossbeam-channel-0.5.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crossbeam-channel-0.5.8.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crossbeam_deque__0_8_3",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.8.3/download",
        type = "tar.gz",
        sha256 = "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef",
        strip_prefix = "crossbeam-deque-0.8.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crossbeam-deque-0.8.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crossbeam_epoch__0_9_15",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.9.15/download",
        type = "tar.gz",
        sha256 = "ae211234986c545741a7dc064309f67ee1e5ad243d0e48335adc0484d960bcc7",
        strip_prefix = "crossbeam-epoch-0.9.15",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crossbeam-epoch-0.9.15.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crossbeam_utils__0_8_16",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.8.16/download",
        type = "tar.gz",
        sha256 = "5a22b2d63d4d1dc0b7f1b6b2747dd0088008a9be28b6ddf0b1e7d335e3037294",
        strip_prefix = "crossbeam-utils-0.8.16",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crossbeam-utils-0.8.16.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__crypto_common__0_1_6",
        url = "https://crates.io/api/v1/crates/crypto-common/0.1.6/download",
        type = "tar.gz",
        sha256 = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3",
        strip_prefix = "crypto-common-0.1.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crypto-common-0.1.6.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__debugid__0_8_0",
        url = "https://crates.io/api/v1/crates/debugid/0.8.0/download",
        type = "tar.gz",
        sha256 = "bef552e6f588e446098f6ba40d89ac146c8c7b64aade83c051ee00bb5d2bc18d",
        strip_prefix = "debugid-0.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.debugid-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__digest__0_10_7",
        url = "https://crates.io/api/v1/crates/digest/0.10.7/download",
        type = "tar.gz",
        sha256 = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292",
        strip_prefix = "digest-0.10.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.digest-0.10.7.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__directories_next__2_0_0",
        url = "https://crates.io/api/v1/crates/directories-next/2.0.0/download",
        type = "tar.gz",
        sha256 = "339ee130d97a610ea5a5872d2bbb130fdf68884ff09d3028b81bec8a1ac23bbc",
        strip_prefix = "directories-next-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.directories-next-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__dirs_sys_next__0_1_2",
        url = "https://crates.io/api/v1/crates/dirs-sys-next/0.1.2/download",
        type = "tar.gz",
        sha256 = "4ebda144c4fe02d1f7ea1a7d9641b6fc6b580adcfa024ae48797ecdeb6825b4d",
        strip_prefix = "dirs-sys-next-0.1.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.dirs-sys-next-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__either__1_9_0",
        url = "https://crates.io/api/v1/crates/either/1.9.0/download",
        type = "tar.gz",
        sha256 = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07",
        strip_prefix = "either-1.9.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.either-1.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__env_logger__0_10_0",
        url = "https://crates.io/api/v1/crates/env_logger/0.10.0/download",
        type = "tar.gz",
        sha256 = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0",
        strip_prefix = "env_logger-0.10.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.env_logger-0.10.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__errno__0_3_3",
        url = "https://crates.io/api/v1/crates/errno/0.3.3/download",
        type = "tar.gz",
        sha256 = "136526188508e25c6fef639d7927dfb3e0e3084488bf202267829cf7fc23dbdd",
        strip_prefix = "errno-0.3.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.errno-0.3.3.bazel"),
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
        name = "wasmtime__file_per_thread_logger__0_1_6",
        url = "https://crates.io/api/v1/crates/file-per-thread-logger/0.1.6/download",
        type = "tar.gz",
        sha256 = "84f2e425d9790201ba4af4630191feac6dcc98765b118d4d18e91d23c2353866",
        strip_prefix = "file-per-thread-logger-0.1.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.file-per-thread-logger-0.1.6.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__form_urlencoded__1_2_0",
        url = "https://crates.io/api/v1/crates/form_urlencoded/1.2.0/download",
        type = "tar.gz",
        sha256 = "a62bc1cf6f830c2ec14a513a9fb124d0a213a629668a4186f329db21fe045652",
        strip_prefix = "form_urlencoded-1.2.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.form_urlencoded-1.2.0.bazel"),
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
        name = "wasmtime__fxprof_processed_profile__0_6_0",
        url = "https://crates.io/api/v1/crates/fxprof-processed-profile/0.6.0/download",
        type = "tar.gz",
        sha256 = "27d12c0aed7f1e24276a241aadc4cb8ea9f83000f34bc062b7cc2d51e3b0fabd",
        strip_prefix = "fxprof-processed-profile-0.6.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.fxprof-processed-profile-0.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__generic_array__0_14_7",
        url = "https://crates.io/api/v1/crates/generic-array/0.14.7/download",
        type = "tar.gz",
        sha256 = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a",
        strip_prefix = "generic-array-0.14.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.generic-array-0.14.7.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__getrandom__0_2_10",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.10/download",
        type = "tar.gz",
        sha256 = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427",
        strip_prefix = "getrandom-0.2.10",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.getrandom-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__gimli__0_27_3",
        url = "https://crates.io/api/v1/crates/gimli/0.27.3/download",
        type = "tar.gz",
        sha256 = "b6c80984affa11d98d1b88b66ac8853f143217b399d3c74116778ff8fdb4ed2e",
        strip_prefix = "gimli-0.27.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.gimli-0.27.3.bazel"),
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
        name = "wasmtime__hashbrown__0_13_2",
        url = "https://crates.io/api/v1/crates/hashbrown/0.13.2/download",
        type = "tar.gz",
        sha256 = "43a3c133739dddd0d2990f9a4bdf8eb4b21ef50e4851ca85ab661199821d510e",
        strip_prefix = "hashbrown-0.13.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hashbrown-0.13.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__heck__0_4_1",
        url = "https://crates.io/api/v1/crates/heck/0.4.1/download",
        type = "tar.gz",
        sha256 = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8",
        strip_prefix = "heck-0.4.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.heck-0.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__hermit_abi__0_3_2",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.3.2/download",
        type = "tar.gz",
        sha256 = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b",
        strip_prefix = "hermit-abi-0.3.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hermit-abi-0.3.2.bazel"),
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
        name = "wasmtime__id_arena__2_2_1",
        url = "https://crates.io/api/v1/crates/id-arena/2.2.1/download",
        type = "tar.gz",
        sha256 = "25a2bc672d1148e28034f176e01fffebb08b35768468cc954630da77a1449005",
        strip_prefix = "id-arena-2.2.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.id-arena-2.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__idna__0_4_0",
        url = "https://crates.io/api/v1/crates/idna/0.4.0/download",
        type = "tar.gz",
        sha256 = "7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c",
        strip_prefix = "idna-0.4.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.idna-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__indexmap__1_9_3",
        url = "https://crates.io/api/v1/crates/indexmap/1.9.3/download",
        type = "tar.gz",
        sha256 = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99",
        strip_prefix = "indexmap-1.9.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.indexmap-1.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__io_lifetimes__1_0_11",
        url = "https://crates.io/api/v1/crates/io-lifetimes/1.0.11/download",
        type = "tar.gz",
        sha256 = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2",
        strip_prefix = "io-lifetimes-1.0.11",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.io-lifetimes-1.0.11.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__is_terminal__0_4_9",
        url = "https://crates.io/api/v1/crates/is-terminal/0.4.9/download",
        type = "tar.gz",
        sha256 = "cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b",
        strip_prefix = "is-terminal-0.4.9",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.is-terminal-0.4.9.bazel"),
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
        name = "wasmtime__itoa__1_0_9",
        url = "https://crates.io/api/v1/crates/itoa/1.0.9/download",
        type = "tar.gz",
        sha256 = "af150ab688ff2122fcef229be89cb50dd66af9e01a4ff320cc137eecc9bacc38",
        strip_prefix = "itoa-1.0.9",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.itoa-1.0.9.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__ittapi__0_3_4",
        url = "https://crates.io/api/v1/crates/ittapi/0.3.4/download",
        type = "tar.gz",
        sha256 = "41e0d0b7b3b53d92a7e8b80ede3400112a6b8b4c98d1f5b8b16bb787c780582c",
        strip_prefix = "ittapi-0.3.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ittapi-0.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__ittapi_sys__0_3_4",
        url = "https://crates.io/api/v1/crates/ittapi-sys/0.3.4/download",
        type = "tar.gz",
        sha256 = "f2f8763c96e54e6d6a0dccc2990d8b5e33e3313aaeae6185921a3f4c1614a77c",
        strip_prefix = "ittapi-sys-0.3.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ittapi-sys-0.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__jobserver__0_1_26",
        url = "https://crates.io/api/v1/crates/jobserver/0.1.26/download",
        type = "tar.gz",
        sha256 = "936cfd212a0155903bcbc060e316fb6cc7cbf2e1907329391ebadc1fe0ce77c2",
        strip_prefix = "jobserver-0.1.26",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.jobserver-0.1.26.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__leb128__0_2_5",
        url = "https://crates.io/api/v1/crates/leb128/0.2.5/download",
        type = "tar.gz",
        sha256 = "884e2677b40cc8c339eaefcb701c32ef1fd2493d71118dc0ca4b6a736c93bd67",
        strip_prefix = "leb128-0.2.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.leb128-0.2.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__libc__0_2_148",
        url = "https://crates.io/api/v1/crates/libc/0.2.148/download",
        type = "tar.gz",
        sha256 = "9cdc71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b",
        strip_prefix = "libc-0.2.148",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.148.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__linux_raw_sys__0_3_8",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.3.8/download",
        type = "tar.gz",
        sha256 = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519",
        strip_prefix = "linux-raw-sys-0.3.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.linux-raw-sys-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__linux_raw_sys__0_4_7",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.4.7/download",
        type = "tar.gz",
        sha256 = "1a9bad9f94746442c783ca431b22403b519cd7fbeed0533fdd6328b2f2212128",
        strip_prefix = "linux-raw-sys-0.4.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.linux-raw-sys-0.4.7.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__log__0_4_20",
        url = "https://crates.io/api/v1/crates/log/0.4.20/download",
        type = "tar.gz",
        sha256 = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f",
        strip_prefix = "log-0.4.20",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.log-0.4.20.bazel"),
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
        name = "wasmtime__memchr__2_6_3",
        url = "https://crates.io/api/v1/crates/memchr/2.6.3/download",
        type = "tar.gz",
        sha256 = "8f232d6ef707e1956a43342693d2a31e72989554d58299d7a88738cc95b0d35c",
        strip_prefix = "memchr-2.6.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memchr-2.6.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__memfd__0_6_3",
        url = "https://crates.io/api/v1/crates/memfd/0.6.3/download",
        type = "tar.gz",
        sha256 = "ffc89ccdc6e10d6907450f753537ebc5c5d3460d2e4e62ea74bd571db62c0f9e",
        strip_prefix = "memfd-0.6.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memfd-0.6.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__memoffset__0_8_0",
        url = "https://crates.io/api/v1/crates/memoffset/0.8.0/download",
        type = "tar.gz",
        sha256 = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1",
        strip_prefix = "memoffset-0.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memoffset-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__memoffset__0_9_0",
        url = "https://crates.io/api/v1/crates/memoffset/0.9.0/download",
        type = "tar.gz",
        sha256 = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c",
        strip_prefix = "memoffset-0.9.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memoffset-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__num_cpus__1_16_0",
        url = "https://crates.io/api/v1/crates/num_cpus/1.16.0/download",
        type = "tar.gz",
        sha256 = "4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43",
        strip_prefix = "num_cpus-1.16.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.num_cpus-1.16.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__object__0_30_4",
        url = "https://crates.io/api/v1/crates/object/0.30.4/download",
        type = "tar.gz",
        sha256 = "03b4680b86d9cfafba8fc491dc9b6df26b68cf40e9e6cd73909194759a63c385",
        strip_prefix = "object-0.30.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.object-0.30.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__once_cell__1_18_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.18.0/download",
        type = "tar.gz",
        sha256 = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d",
        strip_prefix = "once_cell-1.18.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.once_cell-1.18.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__paste__1_0_14",
        url = "https://crates.io/api/v1/crates/paste/1.0.14/download",
        type = "tar.gz",
        sha256 = "de3145af08024dea9fa9914f381a17b8fc6034dfb00f3a84013f7ff43f29ed4c",
        strip_prefix = "paste-1.0.14",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.paste-1.0.14.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__percent_encoding__2_3_0",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.3.0/download",
        type = "tar.gz",
        sha256 = "9b2a4787296e9989611394c33f193f676704af1686e70b8f8033ab5ba9a35a94",
        strip_prefix = "percent-encoding-2.3.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.percent-encoding-2.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__pkg_config__0_3_27",
        url = "https://crates.io/api/v1/crates/pkg-config/0.3.27/download",
        type = "tar.gz",
        sha256 = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964",
        strip_prefix = "pkg-config-0.3.27",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.pkg-config-0.3.27.bazel"),
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
        name = "wasmtime__proc_macro2__1_0_67",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.67/download",
        type = "tar.gz",
        sha256 = "3d433d9f1a3e8c1263d9456598b16fec66f4acc9a74dacffd35c7bb09b3a1328",
        strip_prefix = "proc-macro2-1.0.67",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.67.bazel"),
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
        name = "wasmtime__pulldown_cmark__0_8_0",
        url = "https://crates.io/api/v1/crates/pulldown-cmark/0.8.0/download",
        type = "tar.gz",
        sha256 = "ffade02495f22453cd593159ea2f59827aae7f53fa8323f756799b670881dcf8",
        strip_prefix = "pulldown-cmark-0.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.pulldown-cmark-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__quote__1_0_33",
        url = "https://crates.io/api/v1/crates/quote/1.0.33/download",
        type = "tar.gz",
        sha256 = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae",
        strip_prefix = "quote-1.0.33",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.33.bazel"),
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
        name = "wasmtime__rayon__1_7_0",
        url = "https://crates.io/api/v1/crates/rayon/1.7.0/download",
        type = "tar.gz",
        sha256 = "1d2df5196e37bcc87abebc0053e20787d73847bb33134a69841207dd0a47f03b",
        strip_prefix = "rayon-1.7.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rayon-1.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rayon_core__1_11_0",
        url = "https://crates.io/api/v1/crates/rayon-core/1.11.0/download",
        type = "tar.gz",
        sha256 = "4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddba9fc60661aebe8d",
        strip_prefix = "rayon-core-1.11.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rayon-core-1.11.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__redox_syscall__0_2_16",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.2.16/download",
        type = "tar.gz",
        sha256 = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a",
        strip_prefix = "redox_syscall-0.2.16",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.redox_syscall-0.2.16.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__redox_users__0_4_3",
        url = "https://crates.io/api/v1/crates/redox_users/0.4.3/download",
        type = "tar.gz",
        sha256 = "b033d837a7cf162d7993aded9304e30a83213c648b6e389db233191f891e5c2b",
        strip_prefix = "redox_users-0.4.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.redox_users-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regalloc2__0_8_1",
        url = "https://crates.io/api/v1/crates/regalloc2/0.8.1/download",
        type = "tar.gz",
        sha256 = "d4a52e724646c6c0800fc456ec43b4165d2f91fba88ceaca06d9e0b400023478",
        strip_prefix = "regalloc2-0.8.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc2-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex__1_9_5",
        url = "https://crates.io/api/v1/crates/regex/1.9.5/download",
        type = "tar.gz",
        sha256 = "697061221ea1b4a94a624f67d0ae2bfe4e22b8a17b6a192afb11046542cc8c47",
        strip_prefix = "regex-1.9.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-1.9.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex_automata__0_3_8",
        url = "https://crates.io/api/v1/crates/regex-automata/0.3.8/download",
        type = "tar.gz",
        sha256 = "c2f401f4955220693b56f8ec66ee9c78abffd8d1c4f23dc41a23839eb88f0795",
        strip_prefix = "regex-automata-0.3.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-automata-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex_syntax__0_7_5",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.7.5/download",
        type = "tar.gz",
        sha256 = "dbb5fb1acd8a1a18b3dd5be62d25485eb770e05afb408a9627d14d451bae12da",
        strip_prefix = "regex-syntax-0.7.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-syntax-0.7.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rustc_demangle__0_1_23",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.23/download",
        type = "tar.gz",
        sha256 = "d626bb9dae77e28219937af045c257c28bfd3f69333c512553507f5f9798cb76",
        strip_prefix = "rustc-demangle-0.1.23",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustc-demangle-0.1.23.bazel"),
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
        name = "wasmtime__rustix__0_37_23",
        url = "https://crates.io/api/v1/crates/rustix/0.37.23/download",
        type = "tar.gz",
        sha256 = "4d69718bf81c6127a49dc64e44a742e8bb9213c0ff8869a22c308f84c1d4ab06",
        strip_prefix = "rustix-0.37.23",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.37.23.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rustix__0_38_13",
        url = "https://crates.io/api/v1/crates/rustix/0.38.13/download",
        type = "tar.gz",
        sha256 = "d7db8590df6dfcd144d22afd1b83b36c21a18d7cbc1dc4bb5295a8712e9eb662",
        strip_prefix = "rustix-0.38.13",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.38.13.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__ryu__1_0_15",
        url = "https://crates.io/api/v1/crates/ryu/1.0.15/download",
        type = "tar.gz",
        sha256 = "1ad4cc8da4ef723ed60bced201181d83791ad433213d8c24efffda1eec85d741",
        strip_prefix = "ryu-1.0.15",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ryu-1.0.15.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__scopeguard__1_2_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.2.0/download",
        type = "tar.gz",
        sha256 = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49",
        strip_prefix = "scopeguard-1.2.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.scopeguard-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_188",
        url = "https://crates.io/api/v1/crates/serde/1.0.188/download",
        type = "tar.gz",
        sha256 = "cf9e0fcba69a370eed61bcf2b728575f726b50b55cba78064753d708ddc7549e",
        strip_prefix = "serde-1.0.188",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.188.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_188",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.188/download",
        type = "tar.gz",
        sha256 = "4eca7ac642d82aa35b60049a6eccb4be6be75e599bd2e9adb5f875a737654af2",
        strip_prefix = "serde_derive-1.0.188",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.188.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_json__1_0_107",
        url = "https://crates.io/api/v1/crates/serde_json/1.0.107/download",
        type = "tar.gz",
        sha256 = "6b420ce6e3d8bd882e9b243c6eed35dbc9a6110c9769e74b584e0d68d1f20c65",
        strip_prefix = "serde_json-1.0.107",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_json-1.0.107.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__sha2__0_10_7",
        url = "https://crates.io/api/v1/crates/sha2/0.10.7/download",
        type = "tar.gz",
        sha256 = "479fb9d862239e610720565ca91403019f2f00410f1864c5aa7479b950a76ed8",
        strip_prefix = "sha2-0.10.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.sha2-0.10.7.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__slice_group_by__0_3_1",
        url = "https://crates.io/api/v1/crates/slice-group-by/0.3.1/download",
        type = "tar.gz",
        sha256 = "826167069c09b99d56f31e9ae5c99049e932a98c9dc2dac47645b08dbbf76ba7",
        strip_prefix = "slice-group-by-0.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.slice-group-by-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__smallvec__1_11_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.11.0/download",
        type = "tar.gz",
        sha256 = "62bb4feee49fdd9f707ef802e22365a35de4b7b299de4763d44bfea899442ff9",
        strip_prefix = "smallvec-1.11.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.smallvec-1.11.0.bazel"),
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
        name = "wasmtime__syn__2_0_33",
        url = "https://crates.io/api/v1/crates/syn/2.0.33/download",
        type = "tar.gz",
        sha256 = "9caece70c63bfba29ec2fed841a09851b14a235c60010fa4de58089b6c025668",
        strip_prefix = "syn-2.0.33",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-2.0.33.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__target_lexicon__0_12_11",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.11/download",
        type = "tar.gz",
        sha256 = "9d0e916b1148c8e263850e1ebcbd046f333e0683c724876bb0da63ea4373dc8a",
        strip_prefix = "target-lexicon-0.12.11",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.target-lexicon-0.12.11.bazel"),
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
        name = "wasmtime__thiserror__1_0_48",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.48/download",
        type = "tar.gz",
        sha256 = "9d6d7a740b8a666a7e828dd00da9c0dc290dff53154ea77ac109281de90589b7",
        strip_prefix = "thiserror-1.0.48",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-1.0.48.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror_impl__1_0_48",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.48/download",
        type = "tar.gz",
        sha256 = "49922ecae66cc8a249b77e68d1d0623c1b2c514f0060c27cdc68bd62a1219d35",
        strip_prefix = "thiserror-impl-1.0.48",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-impl-1.0.48.bazel"),
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
        name = "wasmtime__toml__0_5_11",
        url = "https://crates.io/api/v1/crates/toml/0.5.11/download",
        type = "tar.gz",
        sha256 = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234",
        strip_prefix = "toml-0.5.11",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.toml-0.5.11.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__typenum__1_16_0",
        url = "https://crates.io/api/v1/crates/typenum/1.16.0/download",
        type = "tar.gz",
        sha256 = "497961ef93d974e23eb6f433eb5fe1b7930b659f06d12dec6fc44a8f554c0bba",
        strip_prefix = "typenum-1.16.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.typenum-1.16.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicase__2_7_0",
        url = "https://crates.io/api/v1/crates/unicase/2.7.0/download",
        type = "tar.gz",
        sha256 = "f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89",
        strip_prefix = "unicase-2.7.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicase-2.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_bidi__0_3_13",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.13/download",
        type = "tar.gz",
        sha256 = "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460",
        strip_prefix = "unicode-bidi-0.3.13",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-bidi-0.3.13.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_ident__1_0_12",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.12/download",
        type = "tar.gz",
        sha256 = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b",
        strip_prefix = "unicode-ident-1.0.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-ident-1.0.12.bazel"),
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
        name = "wasmtime__unicode_width__0_1_10",
        url = "https://crates.io/api/v1/crates/unicode-width/0.1.10/download",
        type = "tar.gz",
        sha256 = "c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b",
        strip_prefix = "unicode-width-0.1.10",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-width-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_xid__0_2_4",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.4/download",
        type = "tar.gz",
        sha256 = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c",
        strip_prefix = "unicode-xid-0.2.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-xid-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__url__2_4_1",
        url = "https://crates.io/api/v1/crates/url/2.4.1/download",
        type = "tar.gz",
        sha256 = "143b538f18257fac9cad154828a57c6bf5157e1aa604d4816b5995bf6de87ae5",
        strip_prefix = "url-2.4.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.url-2.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__uuid__1_4_1",
        url = "https://crates.io/api/v1/crates/uuid/1.4.1/download",
        type = "tar.gz",
        sha256 = "79daa5ed5740825c40b389c5e50312b9c86df53fccd33f281df655642b43869d",
        strip_prefix = "uuid-1.4.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.uuid-1.4.1.bazel"),
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
        name = "wasmtime__wasm_encoder__0_32_0",
        url = "https://crates.io/api/v1/crates/wasm-encoder/0.32.0/download",
        type = "tar.gz",
        sha256 = "1ba64e81215916eaeb48fee292f29401d69235d62d8b8fd92a7b2844ec5ae5f7",
        strip_prefix = "wasm-encoder-0.32.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasm-encoder-0.32.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmparser__0_103_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.103.0/download",
        type = "tar.gz",
        sha256 = "2c437373cac5ea84f1113d648d51f71751ffbe3d90c00ae67618cf20d0b5ee7b",
        strip_prefix = "wasmparser-0.103.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.103.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime/9.0.4/download",
        type = "tar.gz",
        sha256 = "634357e8668774b24c80b210552f3f194e2342a065d6d83845ba22c5817d0770",
        strip_prefix = "wasmtime-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_asm_macros__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-asm-macros/9.0.4/download",
        type = "tar.gz",
        sha256 = "d33c73c24ce79b0483a3b091a9acf88871f4490b88998e8974b22236264d304c",
        strip_prefix = "wasmtime-asm-macros-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-asm-macros-9.0.4.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_0_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "271b605e8d3d44c5d0a39bb4e65c3efb3869ff74",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.0.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cache__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-cache/9.0.4/download",
        type = "tar.gz",
        sha256 = "6107809b2d9f5b2fd3ddbaddb3bb92ff8048b62f4030debf1408119ffd38c6cb",
        strip_prefix = "wasmtime-cache-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cache-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_component_macro__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-component-macro/9.0.4/download",
        type = "tar.gz",
        sha256 = "e5ba489850d9c91c6c5b9e1696ee89e7a69d9796236a005f7e9131b6746e13b6",
        strip_prefix = "wasmtime-component-macro-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-component-macro-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_component_util__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-component-util/9.0.4/download",
        type = "tar.gz",
        sha256 = "7fa88f9e77d80f828c9d684741a9da649366c6d1cceb814755dd9cab7112d1d1",
        strip_prefix = "wasmtime-component-util-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-component-util-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/9.0.4/download",
        type = "tar.gz",
        sha256 = "5800616a28ed6bd5e8b99ea45646c956d798ae030494ac0689bc3e45d3b689c1",
        strip_prefix = "wasmtime-cranelift-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift_shared__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift-shared/9.0.4/download",
        type = "tar.gz",
        sha256 = "27e4030b959ac5c5d6ee500078977e813f8768fa2b92fc12be01856cd0c76c55",
        strip_prefix = "wasmtime-cranelift-shared-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-shared-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/9.0.4/download",
        type = "tar.gz",
        sha256 = "9ec815d01a8d38aceb7ed4678f9ba551ae6b8a568a63810ac3ad9293b0fd01c8",
        strip_prefix = "wasmtime-environ-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_fiber__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-fiber/9.0.4/download",
        type = "tar.gz",
        sha256 = "23c5127908fdf720614891ec741c13dd70c844e102caa393e2faca1ee68e9bfb",
        strip_prefix = "wasmtime-fiber-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-fiber-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/9.0.4/download",
        type = "tar.gz",
        sha256 = "2712eafe829778b426cad0e1769fef944898923dd29f0039e34e0d53ba72b234",
        strip_prefix = "wasmtime-jit-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/9.0.4/download",
        type = "tar.gz",
        sha256 = "65fb78eacf4a6e47260d8ef8cc81ea8ddb91397b2e848b3fb01567adebfe89b5",
        strip_prefix = "wasmtime-jit-debug-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_icache_coherence__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-icache-coherence/9.0.4/download",
        type = "tar.gz",
        sha256 = "d1364900b05f7d6008516121e8e62767ddb3e176bdf4c84dfa85da1734aeab79",
        strip_prefix = "wasmtime-jit-icache-coherence-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-icache-coherence-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/9.0.4/download",
        type = "tar.gz",
        sha256 = "4a16ffe4de9ac9669175c0ea5c6c51ffc596dfb49320aaa6f6c57eff58cef069",
        strip_prefix = "wasmtime-runtime-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-types/9.0.4/download",
        type = "tar.gz",
        sha256 = "19961c9a3b04d5e766875a5c467f6f5d693f508b3e81f8dc4a1444aa94f041c9",
        strip_prefix = "wasmtime-types-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_wit_bindgen__9_0_4",
        url = "https://crates.io/api/v1/crates/wasmtime-wit-bindgen/9.0.4/download",
        type = "tar.gz",
        sha256 = "421f0d16cc5c612b35ae53a0be3d3124c72296f18e5be3468263c745d56d37ab",
        strip_prefix = "wasmtime-wit-bindgen-9.0.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-wit-bindgen-9.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wast__64_0_0",
        url = "https://crates.io/api/v1/crates/wast/64.0.0/download",
        type = "tar.gz",
        sha256 = "a259b226fd6910225aa7baeba82f9d9933b6d00f2ce1b49b80fa4214328237cc",
        strip_prefix = "wast-64.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wast-64.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wat__1_0_71",
        url = "https://crates.io/api/v1/crates/wat/1.0.71/download",
        type = "tar.gz",
        sha256 = "53253d920ab413fca1c7dc2161d601c79b4fdf631d0ba51dd4343bf9b556c3f6",
        strip_prefix = "wat-1.0.71",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wat-1.0.71.bazel"),
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
        name = "wasmtime__windows_sys__0_48_0",
        url = "https://crates.io/api/v1/crates/windows-sys/0.48.0/download",
        type = "tar.gz",
        sha256 = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9",
        strip_prefix = "windows-sys-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-sys-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_targets__0_48_5",
        url = "https://crates.io/api/v1/crates/windows-targets/0.48.5/download",
        type = "tar.gz",
        sha256 = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c",
        strip_prefix = "windows-targets-0.48.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-targets-0.48.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_gnullvm__0_48_5",
        url = "https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.48.5/download",
        type = "tar.gz",
        sha256 = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8",
        strip_prefix = "windows_aarch64_gnullvm-0.48.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_gnullvm-0.48.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_msvc__0_48_5",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.48.5/download",
        type = "tar.gz",
        sha256 = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc",
        strip_prefix = "windows_aarch64_msvc-0.48.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_msvc-0.48.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_gnu__0_48_5",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.48.5/download",
        type = "tar.gz",
        sha256 = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e",
        strip_prefix = "windows_i686_gnu-0.48.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_gnu-0.48.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_msvc__0_48_5",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.48.5/download",
        type = "tar.gz",
        sha256 = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406",
        strip_prefix = "windows_i686_msvc-0.48.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_msvc-0.48.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnu__0_48_5",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.48.5/download",
        type = "tar.gz",
        sha256 = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e",
        strip_prefix = "windows_x86_64_gnu-0.48.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnu-0.48.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnullvm__0_48_5",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.48.5/download",
        type = "tar.gz",
        sha256 = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc",
        strip_prefix = "windows_x86_64_gnullvm-0.48.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnullvm-0.48.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_msvc__0_48_5",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.48.5/download",
        type = "tar.gz",
        sha256 = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538",
        strip_prefix = "windows_x86_64_msvc-0.48.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_msvc-0.48.5.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wit_parser__0_7_1",
        url = "https://crates.io/api/v1/crates/wit-parser/0.7.1/download",
        type = "tar.gz",
        sha256 = "5ca2581061573ef6d1754983d7a9b3ed5871ef859d52708ea9a0f5af32919172",
        strip_prefix = "wit-parser-0.7.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wit-parser-0.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__zstd__0_11_2_zstd_1_5_2",
        url = "https://crates.io/api/v1/crates/zstd/0.11.2+zstd.1.5.2/download",
        type = "tar.gz",
        sha256 = "20cc960326ece64f010d2d2107537f26dc589a6573a316bd5b1dba685fa5fde4",
        strip_prefix = "zstd-0.11.2+zstd.1.5.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.zstd-0.11.2+zstd.1.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__zstd_safe__5_0_2_zstd_1_5_2",
        url = "https://crates.io/api/v1/crates/zstd-safe/5.0.2+zstd.1.5.2/download",
        type = "tar.gz",
        sha256 = "1d2a5585e04f9eea4b2a3d1eca508c4dee9592a89ef6f450c11719da0726f4db",
        strip_prefix = "zstd-safe-5.0.2+zstd.1.5.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.zstd-safe-5.0.2+zstd.1.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__zstd_sys__2_0_8_zstd_1_5_5",
        url = "https://crates.io/api/v1/crates/zstd-sys/2.0.8+zstd.1.5.5/download",
        type = "tar.gz",
        sha256 = "5556e6ee25d32df2586c098bbfa278803692a20d0ab9565e049480d52707ec8c",
        strip_prefix = "zstd-sys-2.0.8+zstd.1.5.5",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.zstd-sys-2.0.8+zstd.1.5.5.bazel"),
    )
