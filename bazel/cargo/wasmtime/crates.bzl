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
        name = "wasmtime__aho_corasick__1_0_1",
        url = "https://crates.io/api/v1/crates/aho-corasick/1.0.1/download",
        type = "tar.gz",
        sha256 = "67fc08ce920c31afb70f013dcce1bfc3a3195de6a228474e45e1f145b36f8d04",
        strip_prefix = "aho-corasick-1.0.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.aho-corasick-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__anyhow__1_0_71",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.71/download",
        type = "tar.gz",
        sha256 = "9c7d0618f0e0b7e8ff11427422b64564d5fb0be1940354bfe2e0529b18a9d9b8",
        strip_prefix = "anyhow-1.0.71",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.anyhow-1.0.71.bazel"),
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
        name = "wasmtime__bitflags__1_3_2",
        url = "https://crates.io/api/v1/crates/bitflags/1.3.2/download",
        type = "tar.gz",
        sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a",
        strip_prefix = "bitflags-1.3.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bitflags-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__bitflags__2_3_1",
        url = "https://crates.io/api/v1/crates/bitflags/2.3.1/download",
        type = "tar.gz",
        sha256 = "6776fc96284a0bb647b615056fc496d1fe1644a7ab01829818a6d91cae888b84",
        strip_prefix = "bitflags-2.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bitflags-2.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__bumpalo__3_13_0",
        url = "https://crates.io/api/v1/crates/bumpalo/3.13.0/download",
        type = "tar.gz",
        sha256 = "a3e2c3daef883ecc1b5d58c15adae93470a91d425f3532ba1695849656af3fc1",
        strip_prefix = "bumpalo-3.13.0",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:bumpalo.patch",
        ],
        patch_args = [
            "-p1",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.bumpalo-3.13.0.bazel"),
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
        name = "wasmtime__cc__1_0_79",
        url = "https://crates.io/api/v1/crates/cc/1.0.79/download",
        type = "tar.gz",
        sha256 = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f",
        strip_prefix = "cc-1.0.79",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cc-1.0.79.bazel"),
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
        name = "wasmtime__cranelift_bforest__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.96.3/download",
        type = "tar.gz",
        sha256 = "9c064a534a914eb6709d198525321a386dad50627aecfaf64053f369993a3e5a",
        strip_prefix = "cranelift-bforest-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-bforest-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.96.3/download",
        type = "tar.gz",
        sha256 = "619ed4d24acef0bd58b16a1be39077c0b36c65782e6c933892439af5e799110e",
        strip_prefix = "cranelift-codegen-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_meta__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.96.3/download",
        type = "tar.gz",
        sha256 = "c777ce22678ae1869f990b2f31e0cd7ca109049213bfc0baf3e2205a18b21ebb",
        strip_prefix = "cranelift-codegen-meta-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-meta-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_codegen_shared__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.96.3/download",
        type = "tar.gz",
        sha256 = "eb65884d17a1fa55990dd851c43c140afb4c06c3312cf42cfa1222c3b23f9561",
        strip_prefix = "cranelift-codegen-shared-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-codegen-shared-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_control__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-control/0.96.3/download",
        type = "tar.gz",
        sha256 = "9a0cea8abc90934d0a7ee189a29fd35fecd5c40f59ae7e6aab1805e8ab1a535e",
        strip_prefix = "cranelift-control-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-control-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_entity__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.96.3/download",
        type = "tar.gz",
        sha256 = "c2e50bebc05f2401a1320169314b62f91ad811ef20163cac00151d78e0684d4c",
        strip_prefix = "cranelift-entity-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-entity-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_frontend__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.96.3/download",
        type = "tar.gz",
        sha256 = "7b82ccfe704d53f669791399d417928410785132d809ec46f5e2ce069e9d17c8",
        strip_prefix = "cranelift-frontend-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-frontend-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_isle__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-isle/0.96.3/download",
        type = "tar.gz",
        sha256 = "a2515d8e7836f9198b160b2c80aaa1f586d7749d57d6065af86223fb65b7e2c3",
        strip_prefix = "cranelift-isle-0.96.3",
        patches = [
            "@proxy_wasm_cpp_host//bazel/cargo/wasmtime:cranelift-isle.patch",
        ],
        patch_args = [
            "-p4",
        ],
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-isle-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_native__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.96.3/download",
        type = "tar.gz",
        sha256 = "bcb47ffdcdac7e9fed6e4a618939773a4dc4a412fa7da9e701ae667431a10af3",
        strip_prefix = "cranelift-native-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-native-0.96.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__cranelift_wasm__0_96_3",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.96.3/download",
        type = "tar.gz",
        sha256 = "852390f92c3eaa457e42be44d174ff5abbbcd10062d5963bda8ffb2505e73a71",
        strip_prefix = "cranelift-wasm-0.96.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.cranelift-wasm-0.96.3.bazel"),
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
        name = "wasmtime__either__1_8_1",
        url = "https://crates.io/api/v1/crates/either/1.8.1/download",
        type = "tar.gz",
        sha256 = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91",
        strip_prefix = "either-1.8.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.either-1.8.1.bazel"),
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
        name = "wasmtime__errno__0_3_1",
        url = "https://crates.io/api/v1/crates/errno/0.3.1/download",
        type = "tar.gz",
        sha256 = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a",
        strip_prefix = "errno-0.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.errno-0.3.1.bazel"),
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
        name = "wasmtime__form_urlencoded__1_1_0",
        url = "https://crates.io/api/v1/crates/form_urlencoded/1.1.0/download",
        type = "tar.gz",
        sha256 = "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8",
        strip_prefix = "form_urlencoded-1.1.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.form_urlencoded-1.1.0.bazel"),
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
        name = "wasmtime__getrandom__0_2_9",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.9/download",
        type = "tar.gz",
        sha256 = "c85e1d9ab2eadba7e5040d4e09cbd6d072b76a557ad64e797c2cb9d4da21d7e4",
        strip_prefix = "getrandom-0.2.9",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.getrandom-0.2.9.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__gimli__0_27_2",
        url = "https://crates.io/api/v1/crates/gimli/0.27.2/download",
        type = "tar.gz",
        sha256 = "ad0a93d233ebf96623465aad4046a8d3aa4da22d4f4beba5388838c8a434bbb4",
        strip_prefix = "gimli-0.27.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.gimli-0.27.2.bazel"),
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
        name = "wasmtime__hermit_abi__0_3_1",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.3.1/download",
        type = "tar.gz",
        sha256 = "fed44880c466736ef9a5c5b5facefb5ed0785676d0c02d612db14e54f0d84286",
        strip_prefix = "hermit-abi-0.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.hermit-abi-0.3.1.bazel"),
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
        name = "wasmtime__idna__0_3_0",
        url = "https://crates.io/api/v1/crates/idna/0.3.0/download",
        type = "tar.gz",
        sha256 = "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6",
        strip_prefix = "idna-0.3.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.idna-0.3.0.bazel"),
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
        name = "wasmtime__is_terminal__0_4_7",
        url = "https://crates.io/api/v1/crates/is-terminal/0.4.7/download",
        type = "tar.gz",
        sha256 = "adcf93614601c8129ddf72e2d5633df827ba6551541c6d8c59520a371475be1f",
        strip_prefix = "is-terminal-0.4.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.is-terminal-0.4.7.bazel"),
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
        name = "wasmtime__itoa__1_0_6",
        url = "https://crates.io/api/v1/crates/itoa/1.0.6/download",
        type = "tar.gz",
        sha256 = "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6",
        strip_prefix = "itoa-1.0.6",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.itoa-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__libc__0_2_144",
        url = "https://crates.io/api/v1/crates/libc/0.2.144/download",
        type = "tar.gz",
        sha256 = "2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1",
        strip_prefix = "libc-0.2.144",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.libc-0.2.144.bazel"),
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
        name = "wasmtime__log__0_4_18",
        url = "https://crates.io/api/v1/crates/log/0.4.18/download",
        type = "tar.gz",
        sha256 = "518ef76f2f87365916b142844c16d8fefd85039bc5699050210a7778ee1cd1de",
        strip_prefix = "log-0.4.18",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.log-0.4.18.bazel"),
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
        name = "wasmtime__object__0_30_3",
        url = "https://crates.io/api/v1/crates/object/0.30.3/download",
        type = "tar.gz",
        sha256 = "ea86265d3d3dcb6a27fc51bd29a4bf387fae9d2986b823079d4986af253eb439",
        strip_prefix = "object-0.30.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.object-0.30.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__once_cell__1_17_2",
        url = "https://crates.io/api/v1/crates/once_cell/1.17.2/download",
        type = "tar.gz",
        sha256 = "9670a07f94779e00908f3e686eab508878ebb390ba6e604d3a284c00e8d0487b",
        strip_prefix = "once_cell-1.17.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.once_cell-1.17.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__paste__1_0_12",
        url = "https://crates.io/api/v1/crates/paste/1.0.12/download",
        type = "tar.gz",
        sha256 = "9f746c4065a8fa3fe23974dd82f15431cc8d40779821001404d10d2e79ca7d79",
        strip_prefix = "paste-1.0.12",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.paste-1.0.12.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__percent_encoding__2_2_0",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.2.0/download",
        type = "tar.gz",
        sha256 = "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e",
        strip_prefix = "percent-encoding-2.2.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.percent-encoding-2.2.0.bazel"),
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
        name = "wasmtime__proc_macro2__1_0_59",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.59/download",
        type = "tar.gz",
        sha256 = "6aeca18b86b413c660b781aa319e4e2648a3e6f9eadc9b47e9038e6fe9f3451b",
        strip_prefix = "proc-macro2-1.0.59",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.proc-macro2-1.0.59.bazel"),
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
        name = "wasmtime__quote__1_0_28",
        url = "https://crates.io/api/v1/crates/quote/1.0.28/download",
        type = "tar.gz",
        sha256 = "1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488",
        strip_prefix = "quote-1.0.28",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.quote-1.0.28.bazel"),
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
        name = "wasmtime__regex__1_8_3",
        url = "https://crates.io/api/v1/crates/regex/1.8.3/download",
        type = "tar.gz",
        sha256 = "81ca098a9821bd52d6b24fd8b10bd081f47d39c22778cafaa75a2857a62c6390",
        strip_prefix = "regex-1.8.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-1.8.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__regex_syntax__0_7_2",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.7.2/download",
        type = "tar.gz",
        sha256 = "436b050e76ed2903236f032a59761c1eb99e1b0aead2c257922771dab1fc8c78",
        strip_prefix = "regex-syntax-0.7.2",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.regex-syntax-0.7.2.bazel"),
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
        name = "wasmtime__rustix__0_37_19",
        url = "https://crates.io/api/v1/crates/rustix/0.37.19/download",
        type = "tar.gz",
        sha256 = "acf8729d8542766f1b2cf77eb034d52f40d375bb8b615d0b147089946e16613d",
        strip_prefix = "rustix-0.37.19",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.rustix-0.37.19.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__ryu__1_0_13",
        url = "https://crates.io/api/v1/crates/ryu/1.0.13/download",
        type = "tar.gz",
        sha256 = "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041",
        strip_prefix = "ryu-1.0.13",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.ryu-1.0.13.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde__1_0_163",
        url = "https://crates.io/api/v1/crates/serde/1.0.163/download",
        type = "tar.gz",
        sha256 = "2113ab51b87a539ae008b5c6c02dc020ffa39afd2d83cffcb3f4eb2722cebec2",
        strip_prefix = "serde-1.0.163",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde-1.0.163.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_derive__1_0_163",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.163/download",
        type = "tar.gz",
        sha256 = "8c805777e3930c8883389c602315a24224bcc738b63905ef87cd1420353ea93e",
        strip_prefix = "serde_derive-1.0.163",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_derive-1.0.163.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__serde_json__1_0_96",
        url = "https://crates.io/api/v1/crates/serde_json/1.0.96/download",
        type = "tar.gz",
        sha256 = "057d394a50403bcac12672b2b18fb387ab6d289d957dab67dd201875391e52f1",
        strip_prefix = "serde_json-1.0.96",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.serde_json-1.0.96.bazel"),
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
        name = "wasmtime__syn__2_0_18",
        url = "https://crates.io/api/v1/crates/syn/2.0.18/download",
        type = "tar.gz",
        sha256 = "32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e",
        strip_prefix = "syn-2.0.18",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.syn-2.0.18.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__target_lexicon__0_12_7",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.7/download",
        type = "tar.gz",
        sha256 = "fd1ba337640d60c3e96bc6f0638a939b9c9a7f2c316a1598c279828b3d1dc8c5",
        strip_prefix = "target-lexicon-0.12.7",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.target-lexicon-0.12.7.bazel"),
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
        name = "wasmtime__thiserror__1_0_40",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.40/download",
        type = "tar.gz",
        sha256 = "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac",
        strip_prefix = "thiserror-1.0.40",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-1.0.40.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__thiserror_impl__1_0_40",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.40/download",
        type = "tar.gz",
        sha256 = "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f",
        strip_prefix = "thiserror-impl-1.0.40",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.thiserror-impl-1.0.40.bazel"),
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
        name = "wasmtime__unicode_bidi__0_3_13",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.13/download",
        type = "tar.gz",
        sha256 = "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460",
        strip_prefix = "unicode-bidi-0.3.13",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-bidi-0.3.13.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__unicode_ident__1_0_9",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.9/download",
        type = "tar.gz",
        sha256 = "b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0",
        strip_prefix = "unicode-ident-1.0.9",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.unicode-ident-1.0.9.bazel"),
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
        name = "wasmtime__url__2_3_1",
        url = "https://crates.io/api/v1/crates/url/2.3.1/download",
        type = "tar.gz",
        sha256 = "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643",
        strip_prefix = "url-2.3.1",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.url-2.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__uuid__1_3_3",
        url = "https://crates.io/api/v1/crates/uuid/1.3.3/download",
        type = "tar.gz",
        sha256 = "345444e32442451b267fc254ae85a209c64be56d2890e601a0c37ff0c3c5ecd2",
        strip_prefix = "uuid-1.3.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.uuid-1.3.3.bazel"),
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
        name = "wasmtime__wasmtime__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime/9.0.3/download",
        type = "tar.gz",
        sha256 = "aa0f72886c3264eb639f50188d1eb98b975564130292fea8deb4facf91ca7258",
        strip_prefix = "wasmtime-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-9.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_asm_macros__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-asm-macros/9.0.3/download",
        type = "tar.gz",
        sha256 = "a18391ed41ca957eecdbe64c51879b75419cbc52e2d8663fe82945b28b4f19da",
        strip_prefix = "wasmtime-asm-macros-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-asm-macros-9.0.3.bazel"),
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
        name = "wasmtime__wasmtime_cranelift__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/9.0.3/download",
        type = "tar.gz",
        sha256 = "a2495036d05eb1e79ecf22e092eeacd279dcf24b4fcab77fb4cf8ef9bd42c3ea",
        strip_prefix = "wasmtime-cranelift-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-9.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_cranelift_shared__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift-shared/9.0.3/download",
        type = "tar.gz",
        sha256 = "ef677f7b0d3f3b73275675486d791f1e85e7c24afe8dd367c6b9950028906330",
        strip_prefix = "wasmtime-cranelift-shared-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-cranelift-shared-9.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_environ__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/9.0.3/download",
        type = "tar.gz",
        sha256 = "2d03356374ffafa881c5f972529d2bb11ce48fe2736285e2b0ad72c6d554257b",
        strip_prefix = "wasmtime-environ-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-environ-9.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/9.0.3/download",
        type = "tar.gz",
        sha256 = "e5374f0d2ee0069391dd9348f148802846b2b3e0af650385f9c56b3012d3c5d1",
        strip_prefix = "wasmtime-jit-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-9.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_debug__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-debug/9.0.3/download",
        type = "tar.gz",
        sha256 = "102653b177225bfdd2da41cc385965d4bf6bc10cf14ec7b306bc9b015fb01c22",
        strip_prefix = "wasmtime-jit-debug-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-debug-9.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_jit_icache_coherence__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-jit-icache-coherence/9.0.3/download",
        type = "tar.gz",
        sha256 = "374ff63b3eb41db57c56682a9ef7737d2c9efa801f5dbf9da93941c9dd436a06",
        strip_prefix = "wasmtime-jit-icache-coherence-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-jit-icache-coherence-9.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_runtime__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/9.0.3/download",
        type = "tar.gz",
        sha256 = "9b1b832f19099066ebd26e683121d331f12cf98f158eac0f889972854413b46f",
        strip_prefix = "wasmtime-runtime-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-runtime-9.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__wasmtime_types__9_0_3",
        url = "https://crates.io/api/v1/crates/wasmtime-types/9.0.3/download",
        type = "tar.gz",
        sha256 = "9c574221440e05bbb04efa09786d049401be2eb10081ecf43eb72fbd637bd12f",
        strip_prefix = "wasmtime-types-9.0.3",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.wasmtime-types-9.0.3.bazel"),
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
        name = "wasmtime__windows_targets__0_48_0",
        url = "https://crates.io/api/v1/crates/windows-targets/0.48.0/download",
        type = "tar.gz",
        sha256 = "7b1eb6f0cd7c80c79759c929114ef071b87354ce476d9d94271031c0497adfd5",
        strip_prefix = "windows-targets-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows-targets-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_gnullvm__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.48.0/download",
        type = "tar.gz",
        sha256 = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc",
        strip_prefix = "windows_aarch64_gnullvm-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_gnullvm-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_aarch64_msvc__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.48.0/download",
        type = "tar.gz",
        sha256 = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3",
        strip_prefix = "windows_aarch64_msvc-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_aarch64_msvc-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_gnu__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.48.0/download",
        type = "tar.gz",
        sha256 = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241",
        strip_prefix = "windows_i686_gnu-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_gnu-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_i686_msvc__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.48.0/download",
        type = "tar.gz",
        sha256 = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00",
        strip_prefix = "windows_i686_msvc-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_i686_msvc-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnu__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.48.0/download",
        type = "tar.gz",
        sha256 = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1",
        strip_prefix = "windows_x86_64_gnu-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnu-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_gnullvm__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.48.0/download",
        type = "tar.gz",
        sha256 = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953",
        strip_prefix = "windows_x86_64_gnullvm-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_gnullvm-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmtime__windows_x86_64_msvc__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.48.0/download",
        type = "tar.gz",
        sha256 = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a",
        strip_prefix = "windows_x86_64_msvc-0.48.0",
        build_file = Label("//bazel/cargo/wasmtime/remote:BUILD.windows_x86_64_msvc-0.48.0.bazel"),
    )
