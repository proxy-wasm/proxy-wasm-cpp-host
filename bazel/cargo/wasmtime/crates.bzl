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
        name = "wasmtime__addr2line__0_21_0",
        url = "https://crates.io/api/v1/crates/addr2line/0.21.0/download",
        type = "tar.gz",
        sha256 = "8a30b2e23b9e17a9f90641c7ab1549cd9b44f296d3ccbf309d2863cfe398a0cb",
        strip_prefix = "addr2line-0.21.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.addr2line-0.21.0.bazel"),
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
        name = "wasmtime__aho_corasick__1_1_1",
        url = "https://crates.io/api/v1/crates/aho-corasick/1.1.1/download",
        type = "tar.gz",
        sha256 = "ea5d730647d4fadd988536d06fecce94b7b4f2a7efdae548f1cf4b63205518ab",
        strip_prefix = "aho-corasick-1.1.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.aho-corasick-1.1.1.bazel"),
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
        name = "wasmtime__bitflags__2_4_0",
        url = "https://crates.io/api/v1/crates/bitflags/2.4.0/download",
        type = "tar.gz",
        sha256 = "b4682ae6287fcf752ecaabbfcc7b6f9b72aa33933dc23a554d853aea8eea8635",
        strip_prefix = "bitflags-2.4.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bitflags-2.4.0.bazel"),
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
        name = "wasmtime__cranelift_bforest__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.100.0/download",
        type = "tar.gz",
        sha256 = "03b9d1a9e776c27ad55d7792a380785d1fe8c2d7b099eed8dbd8f4af2b598192",
        strip_prefix = "cranelift-bforest-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.100.0/download",
        type = "tar.gz",
        sha256 = "5528483314c2dd5da438576cd8a9d0b3cedad66fb8a4727f90cd319a81950038",
        strip_prefix = "cranelift-codegen-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.100.0/download",
        type = "tar.gz",
        sha256 = "0f46a8318163f7682e35b8730ba93c1b586a2da8ce12a0ed545efc1218550f70",
        strip_prefix = "cranelift-codegen-meta-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.100.0/download",
        type = "tar.gz",
        sha256 = "37d1239cfd50eecfaed468d46943f8650e32969591868ad50111613704da6c70",
        strip_prefix = "cranelift-codegen-shared-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_control__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-control/0.100.0/download",
        type = "tar.gz",
        sha256 = "bcc530560c8f16cc1d4dd7ea000c56f519c60d1a914977abe849ce555c35a61d",
        strip_prefix = "cranelift-control-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-control-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.100.0/download",
        type = "tar.gz",
        sha256 = "f333fa641a9ad2bff0b107767dcb972c18c2bfab7969805a1d7e42449ccb0408",
        strip_prefix = "cranelift-entity-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.100.0/download",
        type = "tar.gz",
        sha256 = "06abf6563015a80f03f8bc4df307d0a81363f4eb73108df3a34f6e66fb6d5307",
        strip_prefix = "cranelift-frontend-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_isle__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.100.0/download",
        type = "tar.gz",
        sha256 = "0eb29d0edc8a5c029ed0f7ca77501f272738e3c410020b4a00f42ffe8ad2a8aa",
        strip_prefix = "cranelift-isle-0.100.0",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:cranelift-isle.patch",
        ],
        patch_args = [
            "-p4",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-isle-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.100.0/download",
        type = "tar.gz",
        sha256 = "006056a7fa920870bad06bf8e1b3033d70cbb7ee625b035efa9d90882a931868",
        strip_prefix = "cranelift-native-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.100.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_100_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.100.0/download",
        type = "tar.gz",
        sha256 = "7b3d08c05f82903a1f6a04d89c4b9ecb47a4035710f89a39a21a147a80214672",
        strip_prefix = "cranelift-wasm-0.100.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.100.0.bazel"),
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
        name = "wasmtime__debugid__0_8_0",
        url = "https://crates.io/api/v1/crates/debugid/0.8.0/download",
        type = "tar.gz",
        sha256 = "bef552e6f588e446098f6ba40d89ac146c8c7b64aade83c051ee00bb5d2bc18d",
        strip_prefix = "debugid-0.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.debugid-0.8.0.bazel"),
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
        name = "wasmtime__equivalent__1_0_1",
        url = "https://crates.io/api/v1/crates/equivalent/1.0.1/download",
        type = "tar.gz",
        sha256 = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5",
        strip_prefix = "equivalent-1.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.equivalent-1.0.1.bazel"),
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
        name = "wasmtime__fallible_iterator__0_3_0",
        url = "https://crates.io/api/v1/crates/fallible-iterator/0.3.0/download",
        type = "tar.gz",
        sha256 = "2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649",
        strip_prefix = "fallible-iterator-0.3.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.fallible-iterator-0.3.0.bazel"),
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
        name = "wasmtime__getrandom__0_2_10",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.10/download",
        type = "tar.gz",
        sha256 = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427",
        strip_prefix = "getrandom-0.2.10",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.getrandom-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__gimli__0_28_0",
        url = "https://crates.io/api/v1/crates/gimli/0.28.0/download",
        type = "tar.gz",
        sha256 = "6fb8d784f27acf97159b40fc4db5ecd8aa23b9ad5ef69cdd136d3bc80665f0c0",
        strip_prefix = "gimli-0.28.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.gimli-0.28.0.bazel"),
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
        name = "wasmtime__hashbrown__0_14_0",
        url = "https://crates.io/api/v1/crates/hashbrown/0.14.0/download",
        type = "tar.gz",
        sha256 = "2c6201b9ff9fd90a5a3bac2e56a830d0caa509576f0e503818ee82c181b3437a",
        strip_prefix = "hashbrown-0.14.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hashbrown-0.14.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__hermit_abi__0_3_3",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.3.3/download",
        type = "tar.gz",
        sha256 = "d77f7ec81a6d05a3abb01ab6eb7590f6083d08449fe5a1c8b1e620283546ccb7",
        strip_prefix = "hermit-abi-0.3.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hermit-abi-0.3.3.bazel"),
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
        name = "wasmtime__indexmap__2_0_0",
        url = "https://crates.io/api/v1/crates/indexmap/2.0.0/download",
        type = "tar.gz",
        sha256 = "d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d",
        strip_prefix = "indexmap-2.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.indexmap-2.0.0.bazel"),
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
        name = "wasmtime__memfd__0_6_4",
        url = "https://crates.io/api/v1/crates/memfd/0.6.4/download",
        type = "tar.gz",
        sha256 = "b2cffa4ad52c6f791f4f8b15f0c05f9824b2ced1160e88cc393d64fff9a8ac64",
        strip_prefix = "memfd-0.6.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memfd-0.6.4.bazel"),
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
        name = "wasmtime__object__0_32_1",
        url = "https://crates.io/api/v1/crates/object/0.32.1/download",
        type = "tar.gz",
        sha256 = "9cf5f9dd3933bd50a9e1f149ec995f39ae2c496d31fd772c1fd45ebc27e902b0",
        strip_prefix = "object-0.32.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.object-0.32.1.bazel"),
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
        name = "wasmtime__regalloc2__0_9_2",
        url = "https://crates.io/api/v1/crates/regalloc2/0.9.2/download",
        type = "tar.gz",
        sha256 = "5b4dcbd3a2ae7fb94b5813fa0e957c6ab51bf5d0a8ee1b69e0c2d0f1e6eb8485",
        strip_prefix = "regalloc2-0.9.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc2-0.9.2.bazel"),
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
        name = "wasmtime__rustix__0_38_14",
        url = "https://crates.io/api/v1/crates/rustix/0.38.14/download",
        type = "tar.gz",
        sha256 = "747c788e9ce8e92b12cd485c49ddf90723550b654b32508f979b71a7b1ecda4f",
        strip_prefix = "rustix-0.38.14",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.38.14.bazel"),
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
        name = "wasmtime__semver__1_0_18",
        url = "https://crates.io/api/v1/crates/semver/1.0.18/download",
        type = "tar.gz",
        sha256 = "b0293b4b29daaf487284529cc2f5675b8e57c61f70167ba415a463651fd6a918",
        strip_prefix = "semver-1.0.18",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.semver-1.0.18.bazel"),
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
        name = "wasmtime__slice_group_by__0_3_1",
        url = "https://crates.io/api/v1/crates/slice-group-by/0.3.1/download",
        type = "tar.gz",
        sha256 = "826167069c09b99d56f31e9ae5c99049e932a98c9dc2dac47645b08dbbf76ba7",
        strip_prefix = "slice-group-by-0.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.slice-group-by-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__smallvec__1_11_1",
        url = "https://crates.io/api/v1/crates/smallvec/1.11.1/download",
        type = "tar.gz",
        sha256 = "942b4a808e05215192e39f4ab80813e599068285906cc91aa64f923db842bd5a",
        strip_prefix = "smallvec-1.11.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.smallvec-1.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__sptr__0_3_2",
        url = "https://crates.io/api/v1/crates/sptr/0.3.2/download",
        type = "tar.gz",
        sha256 = "3b9b39299b249ad65f3b7e96443bad61c02ca5cd3589f46cb6d610a0fd6c0d6a",
        strip_prefix = "sptr-0.3.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.sptr-0.3.2.bazel"),
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
        name = "wasmtime__syn__2_0_37",
        url = "https://crates.io/api/v1/crates/syn/2.0.37/download",
        type = "tar.gz",
        sha256 = "7303ef2c05cd654186cb250d29049a24840ca25d2747c25c0381c8d9e2f582e8",
        strip_prefix = "syn-2.0.37",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-2.0.37.bazel"),
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
        name = "wasmtime__termcolor__1_3_0",
        url = "https://crates.io/api/v1/crates/termcolor/1.3.0/download",
        type = "tar.gz",
        sha256 = "6093bad37da69aab9d123a8091e4be0aa4a03e4d601ec641c327398315f62b64",
        strip_prefix = "termcolor-1.3.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.termcolor-1.3.0.bazel"),
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
        name = "wasmtime__unicode_ident__1_0_12",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.12/download",
        type = "tar.gz",
        sha256 = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b",
        strip_prefix = "unicode-ident-1.0.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-ident-1.0.12.bazel"),
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
        name = "wasmtime__wasmparser__0_112_0",
        url = "https://crates.io/api/v1/crates/wasmparser/0.112.0/download",
        type = "tar.gz",
        sha256 = "e986b010f47fcce49cf8ea5d5f9e5d2737832f12b53ae8ae785bbe895d0877bf",
        strip_prefix = "wasmparser-0.112.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmparser-0.112.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime/13.0.0/download",
        type = "tar.gz",
        sha256 = "16ed7db409c1acf60d33128b2a38bee25aaf38c4bd955ab98a5b623c8294593c",
        strip_prefix = "wasmtime-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_asm_macros__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-asm-macros/13.0.0/download",
        type = "tar.gz",
        sha256 = "53af0f8f6271bd687fe5632c8fe0a0f061d0aa1b99a0cd4e1df8e4cbeb809d2f",
        strip_prefix = "wasmtime-asm-macros-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-asm-macros-13.0.0.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmtime__wasmtime_c_api_macros__0_0_0",
        remote = "https://github.com/bytecodealliance/wasmtime",
        commit = "aec4b25b8f62f409175a3cc6c4a4ed18b446d3ae",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-c-api-macros-0.0.0.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/13.0.0/download",
        type = "tar.gz",
        sha256 = "920e42058862d1f7a3dd3fca73cb495a20d7506e3ada4bbc0a9780cd636da7ca",
        strip_prefix = "wasmtime-cranelift-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift_shared__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift-shared/13.0.0/download",
        type = "tar.gz",
        sha256 = "516d63bbe18219e64a9705cf3a2c865afe1fb711454ea03091dc85a1d708194d",
        strip_prefix = "wasmtime-cranelift-shared-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-shared-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/13.0.0/download",
        type = "tar.gz",
        sha256 = "59cef239d663885f1427f8b8f4fde7be6075249c282580d94b480f11953ca194",
        strip_prefix = "wasmtime-environ-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/13.0.0/download",
        type = "tar.gz",
        sha256 = "c8089d5909b8f923aad57702ebaacb7b662aa9e43a3f71e83e025c5379a1205f",
        strip_prefix = "wasmtime-jit-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/13.0.0/download",
        type = "tar.gz",
        sha256 = "9b13924aedf6799ad66edb25500a20e3226629978b30a958c55285352bad130a",
        strip_prefix = "wasmtime-jit-debug-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_icache_coherence__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-icache-coherence/13.0.0/download",
        type = "tar.gz",
        sha256 = "c6ff5f3707a5e3797deeeeac6ac26b2e1dd32dbc06693c0ab52e8ac4d18ec706",
        strip_prefix = "wasmtime-jit-icache-coherence-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-icache-coherence-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/13.0.0/download",
        type = "tar.gz",
        sha256 = "11ab4ce04ac05342edfa7f42895f2a5d8b16ee914330869acb865cd1facf265f",
        strip_prefix = "wasmtime-runtime-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-types/13.0.0/download",
        type = "tar.gz",
        sha256 = "ecf61e21d5bd95e1ad7fa42b7bdabe21220682d6a6046d376edca29760849222",
        strip_prefix = "wasmtime-types-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_versioned_export_macros__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-versioned-export-macros/13.0.0/download",
        type = "tar.gz",
        sha256 = "fe877472cbdd6d96b4ecdc112af764e3b9d58c2e4175a87828f892ab94c60643",
        strip_prefix = "wasmtime-versioned-export-macros-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-versioned-export-macros-13.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_wmemcheck__13_0_0",
        url = "https://crates.io/api/v1/crates/wasmtime-wmemcheck/13.0.0/download",
        type = "tar.gz",
        sha256 = "5412bb464066d64c3398c96e6974348f90fa2a55110ad7da3f9295438cd4de84",
        strip_prefix = "wasmtime-wmemcheck-13.0.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-wmemcheck-13.0.0.bazel"),
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
        name = "wasmtime__winapi_util__0_1_6",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.6/download",
        type = "tar.gz",
        sha256 = "f29e6f9198ba0d26b4c9f07dbe6f9ed633e1f3d5b8b414090084349e46a52596",
        strip_prefix = "winapi-util-0.1.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.winapi-util-0.1.6.bazel"),
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
