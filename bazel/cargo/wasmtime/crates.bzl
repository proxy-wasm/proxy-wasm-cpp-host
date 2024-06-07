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
        name = "wasmtime__ahash__0_8_11",
        url = "https://crates.io/api/v1/crates/ahash/0.8.11/download",
        type = "tar.gz",
        sha256 = "e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011",
        strip_prefix = "ahash-0.8.11",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ahash-0.8.11.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__aho_corasick__1_1_3",
        url = "https://crates.io/api/v1/crates/aho-corasick/1.1.3/download",
        type = "tar.gz",
        sha256 = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916",
        strip_prefix = "aho-corasick-1.1.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.aho-corasick-1.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__anyhow__1_0_81",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.81/download",
        type = "tar.gz",
        sha256 = "0952808a6c2afd1aa8947271f3a60f1a6763c7b912d210184c5149b5cf147247",
        strip_prefix = "anyhow-1.0.81",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.81.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__arbitrary__1_3_2",
        url = "https://crates.io/api/v1/crates/arbitrary/1.3.2/download",
        type = "tar.gz",
        sha256 = "7d5a26814d8dcb93b0e5a0ff3c6d80a8843bafb21b39e8e18a6f05471870e110",
        strip_prefix = "arbitrary-1.3.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.arbitrary-1.3.2.bazel"),
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
        name = "wasmtime__bitflags__2_5_0",
        url = "https://crates.io/api/v1/crates/bitflags/2.5.0/download",
        type = "tar.gz",
        sha256 = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1",
        strip_prefix = "bitflags-2.5.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bitflags-2.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__bumpalo__3_15_4",
        url = "https://crates.io/api/v1/crates/bumpalo/3.15.4/download",
        type = "tar.gz",
        sha256 = "7ff69b9dd49fd426c69a0db9fc04dd934cdb6645ff000864d98f7e2af8830eaa",
        strip_prefix = "bumpalo-3.15.4",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:bumpalo.patch",
        ],
        patch_args = [
            "-p1",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bumpalo-3.15.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__byteorder__1_5_0",
        url = "https://crates.io/api/v1/crates/byteorder/1.5.0/download",
        type = "tar.gz",
        sha256 = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b",
        strip_prefix = "byteorder-1.5.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.byteorder-1.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cc__1_0_90",
        url = "https://crates.io/api/v1/crates/cc/1.0.90/download",
        type = "tar.gz",
        sha256 = "8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5",
        strip_prefix = "cc-1.0.90",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cc-1.0.90.bazel"),
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
        name = "wasmtime__crc32fast__1_4_0",
        url = "https://crates.io/api/v1/crates/crc32fast/1.4.0/download",
        type = "tar.gz",
        sha256 = "b3855a8a784b474f333699ef2bbca9db2c4a1f6d9088a90a2d25b1eb53111eaa",
        strip_prefix = "crc32fast-1.4.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.crc32fast-1.4.0.bazel"),
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
        name = "wasmtime__either__1_10_0",
        url = "https://crates.io/api/v1/crates/either/1.10.0/download",
        type = "tar.gz",
        sha256 = "11157ac094ffbdde99aa67b23417ebdd801842852b500e395a45a9c0aac03e4a",
        strip_prefix = "either-1.10.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.either-1.10.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__env_logger__0_10_2",
        url = "https://crates.io/api/v1/crates/env_logger/0.10.2/download",
        type = "tar.gz",
        sha256 = "4cd405aab171cb85d6735e5c8d9db038c17d3ca007a4d2c25f337935c3d90580",
        strip_prefix = "env_logger-0.10.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.env_logger-0.10.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__errno__0_3_8",
        url = "https://crates.io/api/v1/crates/errno/0.3.8/download",
        type = "tar.gz",
        sha256 = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245",
        strip_prefix = "errno-0.3.8",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.errno-0.3.8.bazel"),
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
        name = "wasmtime__form_urlencoded__1_2_1",
        url = "https://crates.io/api/v1/crates/form_urlencoded/1.2.1/download",
        type = "tar.gz",
        sha256 = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456",
        strip_prefix = "form_urlencoded-1.2.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.form_urlencoded-1.2.1.bazel"),
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
        name = "wasmtime__getrandom__0_2_12",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.12/download",
        type = "tar.gz",
        sha256 = "190092ea657667030ac6a35e305e62fc4dd69fd98ac98631e5d3a2b1575a12b5",
        strip_prefix = "getrandom-0.2.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.getrandom-0.2.12.bazel"),
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
        name = "wasmtime__hermit_abi__0_3_9",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.3.9/download",
        type = "tar.gz",
        sha256 = "d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024",
        strip_prefix = "hermit-abi-0.3.9",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hermit-abi-0.3.9.bazel"),
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
        name = "wasmtime__idna__0_5_0",
        url = "https://crates.io/api/v1/crates/idna/0.5.0/download",
        type = "tar.gz",
        sha256 = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6",
        strip_prefix = "idna-0.5.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.idna-0.5.0.bazel"),
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
        name = "wasmtime__is_terminal__0_4_12",
        url = "https://crates.io/api/v1/crates/is-terminal/0.4.12/download",
        type = "tar.gz",
        sha256 = "f23ff5ef2b80d608d61efee834934d862cd92461afc0560dedf493e4c033738b",
        strip_prefix = "is-terminal-0.4.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.is-terminal-0.4.12.bazel"),
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
        name = "wasmtime__itoa__1_0_10",
        url = "https://crates.io/api/v1/crates/itoa/1.0.10/download",
        type = "tar.gz",
        sha256 = "b1a46d1a171d865aa5f83f92695765caa047a9b4cbae2cbf37dbd613a793fd4c",
        strip_prefix = "itoa-1.0.10",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.itoa-1.0.10.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__libc__0_2_153",
        url = "https://crates.io/api/v1/crates/libc/0.2.153/download",
        type = "tar.gz",
        sha256 = "9c198f91728a82281a64e1f4f9eeb25d82cb32a5de251c6bd1b5154d63a8e7bd",
        strip_prefix = "libc-0.2.153",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.153.bazel"),
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
        name = "wasmtime__linux_raw_sys__0_4_13",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.4.13/download",
        type = "tar.gz",
        sha256 = "01cda141df6706de531b6c46c3a33ecca755538219bd484262fa09410c13539c",
        strip_prefix = "linux-raw-sys-0.4.13",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.linux-raw-sys-0.4.13.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__log__0_4_21",
        url = "https://crates.io/api/v1/crates/log/0.4.21/download",
        type = "tar.gz",
        sha256 = "90ed8c1e510134f979dbc4f070f87d4313098b704861a105fe34231c70a3901c",
        strip_prefix = "log-0.4.21",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.log-0.4.21.bazel"),
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
        name = "wasmtime__memchr__2_7_1",
        url = "https://crates.io/api/v1/crates/memchr/2.7.1/download",
        type = "tar.gz",
        sha256 = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149",
        strip_prefix = "memchr-2.7.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memchr-2.7.1.bazel"),
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
        name = "wasmtime__memoffset__0_8_0",
        url = "https://crates.io/api/v1/crates/memoffset/0.8.0/download",
        type = "tar.gz",
        sha256 = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1",
        strip_prefix = "memoffset-0.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.memoffset-0.8.0.bazel"),
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
        name = "wasmtime__once_cell__1_19_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.19.0/download",
        type = "tar.gz",
        sha256 = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92",
        strip_prefix = "once_cell-1.19.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.once_cell-1.19.0.bazel"),
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
        name = "wasmtime__percent_encoding__2_3_1",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.3.1/download",
        type = "tar.gz",
        sha256 = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e",
        strip_prefix = "percent-encoding-2.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.percent-encoding-2.3.1.bazel"),
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
        name = "wasmtime__proc_macro2__1_0_79",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.79/download",
        type = "tar.gz",
        sha256 = "e835ff2298f5721608eb1a980ecaee1aef2c132bf95ecc026a11b7bf3c01c02e",
        strip_prefix = "proc-macro2-1.0.79",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.79.bazel"),
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
        name = "wasmtime__quote__1_0_35",
        url = "https://crates.io/api/v1/crates/quote/1.0.35/download",
        type = "tar.gz",
        sha256 = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef",
        strip_prefix = "quote-1.0.35",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.35.bazel"),
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
        name = "wasmtime__regalloc2__0_8_1",
        url = "https://crates.io/api/v1/crates/regalloc2/0.8.1/download",
        type = "tar.gz",
        sha256 = "d4a52e724646c6c0800fc456ec43b4165d2f91fba88ceaca06d9e0b400023478",
        strip_prefix = "regalloc2-0.8.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regalloc2-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex__1_10_3",
        url = "https://crates.io/api/v1/crates/regex/1.10.3/download",
        type = "tar.gz",
        sha256 = "b62dbe01f0b06f9d8dc7d49e05a0785f153b00b2c227856282f671e0318c9b15",
        strip_prefix = "regex-1.10.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-1.10.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex_automata__0_4_6",
        url = "https://crates.io/api/v1/crates/regex-automata/0.4.6/download",
        type = "tar.gz",
        sha256 = "86b83b8b9847f9bf95ef68afb0b8e6cdb80f498442f5179a29fad448fcc1eaea",
        strip_prefix = "regex-automata-0.4.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-automata-0.4.6.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex_syntax__0_8_2",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.8.2/download",
        type = "tar.gz",
        sha256 = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f",
        strip_prefix = "regex-syntax-0.8.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-syntax-0.8.2.bazel"),
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
        name = "wasmtime__rustix__0_37_27",
        url = "https://crates.io/api/v1/crates/rustix/0.37.27/download",
        type = "tar.gz",
        sha256 = "fea8ca367a3a01fe35e6943c400addf443c0f57670e6ec51196f71a4b8762dd2",
        strip_prefix = "rustix-0.37.27",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.37.27.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__rustix__0_38_32",
        url = "https://crates.io/api/v1/crates/rustix/0.38.32/download",
        type = "tar.gz",
        sha256 = "65e04861e65f21776e67888bfbea442b3642beaa0138fdb1dd7a84a52dffdb89",
        strip_prefix = "rustix-0.38.32",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.38.32.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__ryu__1_0_17",
        url = "https://crates.io/api/v1/crates/ryu/1.0.17/download",
        type = "tar.gz",
        sha256 = "e86697c916019a8588c99b5fac3cead74ec0b4b819707a682fd4d23fa0ce1ba1",
        strip_prefix = "ryu-1.0.17",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ryu-1.0.17.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_197",
        url = "https://crates.io/api/v1/crates/serde/1.0.197/download",
        type = "tar.gz",
        sha256 = "3fb1c873e1b9b056a4dc4c0c198b24c3ffa059243875552b2bd0933b1aee4ce2",
        strip_prefix = "serde-1.0.197",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.197.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_197",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.197/download",
        type = "tar.gz",
        sha256 = "7eb0b34b42edc17f6b7cac84a52a1c5f0e1bb2227e997ca9011ea3dd34e8610b",
        strip_prefix = "serde_derive-1.0.197",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.197.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_json__1_0_114",
        url = "https://crates.io/api/v1/crates/serde_json/1.0.114/download",
        type = "tar.gz",
        sha256 = "c5f09b1bd632ef549eaa9f60a1f8de742bdbc698e6cee2095fc84dde5f549ae0",
        strip_prefix = "serde_json-1.0.114",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_json-1.0.114.bazel"),
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
        name = "wasmtime__smallvec__1_13_2",
        url = "https://crates.io/api/v1/crates/smallvec/1.13.2/download",
        type = "tar.gz",
        sha256 = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67",
        strip_prefix = "smallvec-1.13.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.smallvec-1.13.2.bazel"),
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
        name = "wasmtime__syn__2_0_53",
        url = "https://crates.io/api/v1/crates/syn/2.0.53/download",
        type = "tar.gz",
        sha256 = "7383cd0e49fff4b6b90ca5670bfd3e9d6a733b3f90c686605aa7eec8c4996032",
        strip_prefix = "syn-2.0.53",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-2.0.53.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__target_lexicon__0_12_14",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.14/download",
        type = "tar.gz",
        sha256 = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f",
        strip_prefix = "target-lexicon-0.12.14",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.target-lexicon-0.12.14.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__termcolor__1_4_1",
        url = "https://crates.io/api/v1/crates/termcolor/1.4.1/download",
        type = "tar.gz",
        sha256 = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755",
        strip_prefix = "termcolor-1.4.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.termcolor-1.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror__1_0_58",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.58/download",
        type = "tar.gz",
        sha256 = "03468839009160513471e86a034bb2c5c0e4baae3b43f79ffc55c4a5427b3297",
        strip_prefix = "thiserror-1.0.58",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-1.0.58.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror_impl__1_0_58",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.58/download",
        type = "tar.gz",
        sha256 = "c61f3ba182994efc43764a46c018c347bc492c79f024e705f46567b418f6d4f7",
        strip_prefix = "thiserror-impl-1.0.58",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-impl-1.0.58.bazel"),
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
        name = "wasmtime__unicode_bidi__0_3_15",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.15/download",
        type = "tar.gz",
        sha256 = "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75",
        strip_prefix = "unicode-bidi-0.3.15",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-bidi-0.3.15.bazel"),
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
        name = "wasmtime__unicode_normalization__0_1_23",
        url = "https://crates.io/api/v1/crates/unicode-normalization/0.1.23/download",
        type = "tar.gz",
        sha256 = "a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5",
        strip_prefix = "unicode-normalization-0.1.23",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-normalization-0.1.23.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__url__2_5_0",
        url = "https://crates.io/api/v1/crates/url/2.5.0/download",
        type = "tar.gz",
        sha256 = "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633",
        strip_prefix = "url-2.5.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.url-2.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__uuid__1_8_0",
        url = "https://crates.io/api/v1/crates/uuid/1.8.0/download",
        type = "tar.gz",
        sha256 = "a183cf7feeba97b4dd1c0d46788634f6221d87fa961b305bed08c851829efcc0",
        strip_prefix = "uuid-1.8.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.uuid-1.8.0.bazel"),
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
        name = "wasmtime__windows_sys__0_52_0",
        url = "https://crates.io/api/v1/crates/windows-sys/0.52.0/download",
        type = "tar.gz",
        sha256 = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d",
        strip_prefix = "windows-sys-0.52.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-sys-0.52.0.bazel"),
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
        name = "wasmtime__windows_targets__0_52_4",
        url = "https://crates.io/api/v1/crates/windows-targets/0.52.4/download",
        type = "tar.gz",
        sha256 = "7dd37b7e5ab9018759f893a1952c9420d060016fc19a472b4bb20d1bdd694d1b",
        strip_prefix = "windows-targets-0.52.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-targets-0.52.4.bazel"),
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
        name = "wasmtime__windows_aarch64_gnullvm__0_52_4",
        url = "https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.52.4/download",
        type = "tar.gz",
        sha256 = "bcf46cf4c365c6f2d1cc93ce535f2c8b244591df96ceee75d8e83deb70a9cac9",
        strip_prefix = "windows_aarch64_gnullvm-0.52.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_gnullvm-0.52.4.bazel"),
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
        name = "wasmtime__windows_aarch64_msvc__0_52_4",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.52.4/download",
        type = "tar.gz",
        sha256 = "da9f259dd3bcf6990b55bffd094c4f7235817ba4ceebde8e6d11cd0c5633b675",
        strip_prefix = "windows_aarch64_msvc-0.52.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_msvc-0.52.4.bazel"),
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
        name = "wasmtime__windows_i686_gnu__0_52_4",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.52.4/download",
        type = "tar.gz",
        sha256 = "b474d8268f99e0995f25b9f095bc7434632601028cf86590aea5c8a5cb7801d3",
        strip_prefix = "windows_i686_gnu-0.52.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_gnu-0.52.4.bazel"),
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
        name = "wasmtime__windows_i686_msvc__0_52_4",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.52.4/download",
        type = "tar.gz",
        sha256 = "1515e9a29e5bed743cb4415a9ecf5dfca648ce85ee42e15873c3cd8610ff8e02",
        strip_prefix = "windows_i686_msvc-0.52.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_msvc-0.52.4.bazel"),
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
        name = "wasmtime__windows_x86_64_gnu__0_52_4",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.52.4/download",
        type = "tar.gz",
        sha256 = "5eee091590e89cc02ad514ffe3ead9eb6b660aedca2183455434b93546371a03",
        strip_prefix = "windows_x86_64_gnu-0.52.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnu-0.52.4.bazel"),
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
        name = "wasmtime__windows_x86_64_gnullvm__0_52_4",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.52.4/download",
        type = "tar.gz",
        sha256 = "77ca79f2451b49fa9e2af39f0747fe999fcda4f5e241b2898624dca97a1f2177",
        strip_prefix = "windows_x86_64_gnullvm-0.52.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnullvm-0.52.4.bazel"),
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
        name = "wasmtime__windows_x86_64_msvc__0_52_4",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.52.4/download",
        type = "tar.gz",
        sha256 = "32b752e52a2da0ddfbdbcc6fceadfeede4c939ed16d13e648833a61dfb611ed8",
        strip_prefix = "windows_x86_64_msvc-0.52.4",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_msvc-0.52.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__zerocopy__0_7_32",
        url = "https://crates.io/api/v1/crates/zerocopy/0.7.32/download",
        type = "tar.gz",
        sha256 = "74d4d3961e53fa4c9a25a8637fc2bfaf2595b3d3ae34875568a5cf64787716be",
        strip_prefix = "zerocopy-0.7.32",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.zerocopy-0.7.32.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__zerocopy_derive__0_7_32",
        url = "https://crates.io/api/v1/crates/zerocopy-derive/0.7.32/download",
        type = "tar.gz",
        sha256 = "9ce1b18ccd8e73a9321186f97e46f9f04b778851177567b1975109d26a08d2a6",
        strip_prefix = "zerocopy-derive-0.7.32",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.zerocopy-derive-0.7.32.bazel"),
    )
