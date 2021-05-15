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
        name = "proxy_wasm_cpp_host__addr2line__0_15_1",
        url = "https://crates.io/api/v1/crates/addr2line/0.15.1/download",
        type = "tar.gz",
        sha256 = "03345e98af8f3d786b6d9f656ccfa6ac316d954e92bc4841f0bba20789d5fb5a",
        strip_prefix = "addr2line-0.15.1",
        build_file = Label("//bazel/cargo/remote:BUILD.addr2line-0.15.1.bazel"),
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
        name = "proxy_wasm_cpp_host__anyhow__1_0_40",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.40/download",
        type = "tar.gz",
        sha256 = "28b2cd92db5cbd74e8e5028f7e27dd7aa3090e89e4f2a197cc7c8dfb69c7063b",
        strip_prefix = "anyhow-1.0.40",
        build_file = Label("//bazel/cargo/remote:BUILD.anyhow-1.0.40.bazel"),
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
        name = "proxy_wasm_cpp_host__backtrace__0_3_59",
        url = "https://crates.io/api/v1/crates/backtrace/0.3.59/download",
        type = "tar.gz",
        sha256 = "4717cfcbfaa661a0fd48f8453951837ae7e8f81e481fbb136e3202d72805a744",
        strip_prefix = "backtrace-0.3.59",
        build_file = Label("//bazel/cargo/remote:BUILD.backtrace-0.3.59.bazel"),
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
        name = "proxy_wasm_cpp_host__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        sha256 = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//bazel/cargo/remote:BUILD.bitflags-1.2.1.bazel"),
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
        name = "proxy_wasm_cpp_host__cc__1_0_67",
        url = "https://crates.io/api/v1/crates/cc/1.0.67/download",
        type = "tar.gz",
        sha256 = "e3c69b077ad434294d3ce9f1f6143a2a4b89a8a2d54ef813d85003a4fd1137fd",
        strip_prefix = "cc-1.0.67",
        build_file = Label("//bazel/cargo/remote:BUILD.cc-1.0.67.bazel"),
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
        name = "proxy_wasm_cpp_host__cpp_demangle__0_3_2",
        url = "https://crates.io/api/v1/crates/cpp_demangle/0.3.2/download",
        type = "tar.gz",
        sha256 = "44919ecaf6f99e8e737bc239408931c9a01e9a6c74814fee8242dd2506b65390",
        strip_prefix = "cpp_demangle-0.3.2",
        build_file = Label("//bazel/cargo/remote:BUILD.cpp_demangle-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_bforest__0_73_0",
        url = "https://crates.io/api/v1/crates/cranelift-bforest/0.73.0/download",
        type = "tar.gz",
        sha256 = "07f641ec9146b7d7498d78cd832007d66ca44a9b61f23474d1fb78e5a3701e99",
        strip_prefix = "cranelift-bforest-0.73.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-bforest-0.73.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen__0_73_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen/0.73.0/download",
        type = "tar.gz",
        sha256 = "fd1f2c0cd4ac12c954116ab2e26e40df0d51db322a855b5664fa208bc32d6686",
        strip_prefix = "cranelift-codegen-0.73.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-0.73.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen_meta__0_73_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-meta/0.73.0/download",
        type = "tar.gz",
        sha256 = "105e11b2f0ff7ac81f80dd05ec938ce529a75e36f3d598360d806bb5bfa75e5a",
        strip_prefix = "cranelift-codegen-meta-0.73.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-meta-0.73.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_codegen_shared__0_73_0",
        url = "https://crates.io/api/v1/crates/cranelift-codegen-shared/0.73.0/download",
        type = "tar.gz",
        sha256 = "51e5eba2c1858d50abf023be4d88bd0450cb12d4ec2ba3ffac56353e6d09caf2",
        strip_prefix = "cranelift-codegen-shared-0.73.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-codegen-shared-0.73.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_entity__0_73_0",
        url = "https://crates.io/api/v1/crates/cranelift-entity/0.73.0/download",
        type = "tar.gz",
        sha256 = "79fa6fdd77a8d317763cd21668d3e72b96e09ac8a974326c6149f7de5aafa8ed",
        strip_prefix = "cranelift-entity-0.73.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-entity-0.73.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_frontend__0_73_0",
        url = "https://crates.io/api/v1/crates/cranelift-frontend/0.73.0/download",
        type = "tar.gz",
        sha256 = "ae11da9ca99f987c29e3eb39ebe10e9b879ecca30f3aeaee13db5e8e02b80fb6",
        strip_prefix = "cranelift-frontend-0.73.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-frontend-0.73.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_native__0_73_0",
        url = "https://crates.io/api/v1/crates/cranelift-native/0.73.0/download",
        type = "tar.gz",
        sha256 = "100ca4810058e23a5c4dcaedfa25289d1853f4a899d0960265aa7c54a4789351",
        strip_prefix = "cranelift-native-0.73.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-native-0.73.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__cranelift_wasm__0_73_0",
        url = "https://crates.io/api/v1/crates/cranelift-wasm/0.73.0/download",
        type = "tar.gz",
        sha256 = "607826643d74cf2cc36973ebffd1790a11d1781e14e3f95cf5529942b2168a67",
        strip_prefix = "cranelift-wasm-0.73.0",
        build_file = Label("//bazel/cargo/remote:BUILD.cranelift-wasm-0.73.0.bazel"),
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
        name = "proxy_wasm_cpp_host__ed25519_compact__0_1_9",
        url = "https://crates.io/api/v1/crates/ed25519-compact/0.1.9/download",
        type = "tar.gz",
        sha256 = "aaf396058cc7285b342f9a10ed7a377f088942396c46c4c9a7eb4f0782cb1171",
        strip_prefix = "ed25519-compact-0.1.9",
        build_file = Label("//bazel/cargo/remote:BUILD.ed25519-compact-0.1.9.bazel"),
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
        name = "proxy_wasm_cpp_host__getrandom__0_2_2",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.2/download",
        type = "tar.gz",
        sha256 = "c9495705279e7140bf035dde1f6e750c162df8b625267cd52cc44e0b156732c8",
        strip_prefix = "getrandom-0.2.2",
        build_file = Label("//bazel/cargo/remote:BUILD.getrandom-0.2.2.bazel"),
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
        name = "proxy_wasm_cpp_host__gimli__0_24_0",
        url = "https://crates.io/api/v1/crates/gimli/0.24.0/download",
        type = "tar.gz",
        sha256 = "0e4075386626662786ddb0ec9081e7c7eeb1ba31951f447ca780ef9f5d568189",
        strip_prefix = "gimli-0.24.0",
        build_file = Label("//bazel/cargo/remote:BUILD.gimli-0.24.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__glob__0_3_0",
        url = "https://crates.io/api/v1/crates/glob/0.3.0/download",
        type = "tar.gz",
        sha256 = "9b919933a397b79c37e33b77bb2aa3dc8eb6e165ad809e58ff75bc7db2e34574",
        strip_prefix = "glob-0.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.glob-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__hashbrown__0_9_1",
        url = "https://crates.io/api/v1/crates/hashbrown/0.9.1/download",
        type = "tar.gz",
        sha256 = "d7afe4a420e3fe79967a00898cc1f4db7c8a49a9333a29f8a4bd76a253d5cd04",
        strip_prefix = "hashbrown-0.9.1",
        build_file = Label("//bazel/cargo/remote:BUILD.hashbrown-0.9.1.bazel"),
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
        name = "proxy_wasm_cpp_host__indexmap__1_6_2",
        url = "https://crates.io/api/v1/crates/indexmap/1.6.2/download",
        type = "tar.gz",
        sha256 = "824845a0bf897a9042383849b02c1bc219c2383772efcd5c6f9766fa4b81aef3",
        strip_prefix = "indexmap-1.6.2",
        build_file = Label("//bazel/cargo/remote:BUILD.indexmap-1.6.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__itertools__0_10_0",
        url = "https://crates.io/api/v1/crates/itertools/0.10.0/download",
        type = "tar.gz",
        sha256 = "37d572918e350e82412fe766d24b15e6682fb2ed2bbe018280caa810397cb319",
        strip_prefix = "itertools-0.10.0",
        build_file = Label("//bazel/cargo/remote:BUILD.itertools-0.10.0.bazel"),
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
        name = "proxy_wasm_cpp_host__libc__0_2_94",
        url = "https://crates.io/api/v1/crates/libc/0.2.94/download",
        type = "tar.gz",
        sha256 = "18794a8ad5b29321f790b55d93dfba91e125cb1a9edbd4f8e3150acc771c1a5e",
        strip_prefix = "libc-0.2.94",
        build_file = Label("//bazel/cargo/remote:BUILD.libc-0.2.94.bazel"),
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
        name = "proxy_wasm_cpp_host__memchr__2_4_0",
        url = "https://crates.io/api/v1/crates/memchr/2.4.0/download",
        type = "tar.gz",
        sha256 = "b16bd47d9e329435e309c58469fe0791c2d0d1ba96ec0954152a5ae2b04387dc",
        strip_prefix = "memchr-2.4.0",
        build_file = Label("//bazel/cargo/remote:BUILD.memchr-2.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__memoffset__0_6_3",
        url = "https://crates.io/api/v1/crates/memoffset/0.6.3/download",
        type = "tar.gz",
        sha256 = "f83fb6581e8ed1f85fd45c116db8405483899489e38406156c25eb743554361d",
        strip_prefix = "memoffset-0.6.3",
        build_file = Label("//bazel/cargo/remote:BUILD.memoffset-0.6.3.bazel"),
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
        name = "proxy_wasm_cpp_host__object__0_24_0",
        url = "https://crates.io/api/v1/crates/object/0.24.0/download",
        type = "tar.gz",
        sha256 = "1a5b3dd1c072ee7963717671d1ca129f1048fda25edea6b752bfc71ac8854170",
        strip_prefix = "object-0.24.0",
        build_file = Label("//bazel/cargo/remote:BUILD.object-0.24.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__once_cell__1_7_2",
        url = "https://crates.io/api/v1/crates/once_cell/1.7.2/download",
        type = "tar.gz",
        sha256 = "af8b08b04175473088b46763e51ee54da5f9a164bc162f615b91bc179dbf15a3",
        strip_prefix = "once_cell-1.7.2",
        build_file = Label("//bazel/cargo/remote:BUILD.once_cell-1.7.2.bazel"),
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
        name = "proxy_wasm_cpp_host__proc_macro2__1_0_26",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.26/download",
        type = "tar.gz",
        sha256 = "a152013215dca273577e18d2bf00fa862b89b24169fb78c4c95aeb07992c9cec",
        strip_prefix = "proc-macro2-1.0.26",
        build_file = Label("//bazel/cargo/remote:BUILD.proc-macro2-1.0.26.bazel"),
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
        name = "proxy_wasm_cpp_host__rand__0_8_3",
        url = "https://crates.io/api/v1/crates/rand/0.8.3/download",
        type = "tar.gz",
        sha256 = "0ef9e7e66b4468674bfcb0c81af8b7fa0bb154fa9f28eb840da5c447baeb8d7e",
        strip_prefix = "rand-0.8.3",
        build_file = Label("//bazel/cargo/remote:BUILD.rand-0.8.3.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rand_chacha__0_3_0",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.3.0/download",
        type = "tar.gz",
        sha256 = "e12735cf05c9e10bf21534da50a147b924d555dc7a547c42e6bb2d5b6017ae0d",
        strip_prefix = "rand_chacha-0.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.rand_chacha-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rand_core__0_6_2",
        url = "https://crates.io/api/v1/crates/rand_core/0.6.2/download",
        type = "tar.gz",
        sha256 = "34cf66eb183df1c5876e2dcf6b13d57340741e8dc255b48e40a26de954d06ae7",
        strip_prefix = "rand_core-0.6.2",
        build_file = Label("//bazel/cargo/remote:BUILD.rand_core-0.6.2.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__rand_hc__0_3_0",
        url = "https://crates.io/api/v1/crates/rand_hc/0.3.0/download",
        type = "tar.gz",
        sha256 = "3190ef7066a446f2e7f42e239d161e905420ccab01eb967c9eb27d21b2322a73",
        strip_prefix = "rand_hc-0.3.0",
        build_file = Label("//bazel/cargo/remote:BUILD.rand_hc-0.3.0.bazel"),
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
        name = "proxy_wasm_cpp_host__rustc_demangle__0_1_19",
        url = "https://crates.io/api/v1/crates/rustc-demangle/0.1.19/download",
        type = "tar.gz",
        sha256 = "410f7acf3cb3a44527c5d9546bad4bf4e6c460915d5f9f2fc524498bfe8f70ce",
        strip_prefix = "rustc-demangle-0.1.19",
        build_file = Label("//bazel/cargo/remote:BUILD.rustc-demangle-0.1.19.bazel"),
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
        name = "proxy_wasm_cpp_host__serde__1_0_126",
        url = "https://crates.io/api/v1/crates/serde/1.0.126/download",
        type = "tar.gz",
        sha256 = "ec7505abeacaec74ae4778d9d9328fe5a5d04253220a85c4ee022239fc996d03",
        strip_prefix = "serde-1.0.126",
        build_file = Label("//bazel/cargo/remote:BUILD.serde-1.0.126.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__serde_derive__1_0_126",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.126/download",
        type = "tar.gz",
        sha256 = "963a7dbc9895aeac7ac90e74f34a5d5261828f79df35cbed41e10189d3804d43",
        strip_prefix = "serde_derive-1.0.126",
        build_file = Label("//bazel/cargo/remote:BUILD.serde_derive-1.0.126.bazel"),
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
        name = "proxy_wasm_cpp_host__strsim__0_8_0",
        url = "https://crates.io/api/v1/crates/strsim/0.8.0/download",
        type = "tar.gz",
        sha256 = "8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a",
        strip_prefix = "strsim-0.8.0",
        build_file = Label("//bazel/cargo/remote:BUILD.strsim-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__syn__1_0_72",
        url = "https://crates.io/api/v1/crates/syn/1.0.72/download",
        type = "tar.gz",
        sha256 = "a1e8cdbefb79a9a5a65e0db8b47b723ee907b7c7f8496c76a1770b5c310bab82",
        strip_prefix = "syn-1.0.72",
        build_file = Label("//bazel/cargo/remote:BUILD.syn-1.0.72.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__target_lexicon__0_12_0",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.0/download",
        type = "tar.gz",
        sha256 = "64ae3b39281e4b14b8123bdbaddd472b7dfe215e444181f2f9d2443c2444f834",
        strip_prefix = "target-lexicon-0.12.0",
        build_file = Label("//bazel/cargo/remote:BUILD.target-lexicon-0.12.0.bazel"),
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
        name = "proxy_wasm_cpp_host__thiserror__1_0_24",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.24/download",
        type = "tar.gz",
        sha256 = "e0f4a65597094d4483ddaed134f409b2cb7c1beccf25201a9f73c719254fa98e",
        strip_prefix = "thiserror-1.0.24",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__thiserror_impl__1_0_24",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.24/download",
        type = "tar.gz",
        sha256 = "7765189610d8241a44529806d6fd1f2e0a08734313a35d5b3a556f92b381f3c0",
        strip_prefix = "thiserror-impl-1.0.24",
        build_file = Label("//bazel/cargo/remote:BUILD.thiserror-impl-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__unicode_width__0_1_8",
        url = "https://crates.io/api/v1/crates/unicode-width/0.1.8/download",
        type = "tar.gz",
        sha256 = "9337591893a19b88d8d87f2cec1e73fad5cdfd10e5a6f349f498ad6ea2ffb1e3",
        strip_prefix = "unicode-width-0.1.8",
        build_file = Label("//bazel/cargo/remote:BUILD.unicode-width-0.1.8.bazel"),
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
        name = "proxy_wasm_cpp_host__wasmtime__0_26_0",
        url = "https://crates.io/api/v1/crates/wasmtime/0.26.0/download",
        type = "tar.gz",
        sha256 = "4da03115f8ad36e50edeb6640f4ba27ed7e9a6f05c2f98f728c762966f7054c6",
        strip_prefix = "wasmtime-0.26.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-0.26.0.bazel"),
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
        name = "proxy_wasm_cpp_host__wasmtime_cranelift__0_26_0",
        url = "https://crates.io/api/v1/crates/wasmtime-cranelift/0.26.0/download",
        type = "tar.gz",
        sha256 = "b73c47553954eab22f432a7a60bcd695eb46508c2088cb0aa1cfd060538db3b6",
        strip_prefix = "wasmtime-cranelift-0.26.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-cranelift-0.26.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_debug__0_26_0",
        url = "https://crates.io/api/v1/crates/wasmtime-debug/0.26.0/download",
        type = "tar.gz",
        sha256 = "5241e603c262b2ee0dfb5b2245ad539d0a99f0589909fbffc91d2a8035f2d20a",
        strip_prefix = "wasmtime-debug-0.26.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-debug-0.26.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_environ__0_26_0",
        url = "https://crates.io/api/v1/crates/wasmtime-environ/0.26.0/download",
        type = "tar.gz",
        sha256 = "fb8d356abc04754f5936b9377441a4a202f6bba7ad997d2cd66acb3908bc85a3",
        strip_prefix = "wasmtime-environ-0.26.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-environ-0.26.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_jit__0_26_0",
        url = "https://crates.io/api/v1/crates/wasmtime-jit/0.26.0/download",
        type = "tar.gz",
        sha256 = "81b066a3290a903c5beb7d765b3e82e00cd4f8ac0475297f91330fbe8e16bb17",
        strip_prefix = "wasmtime-jit-0.26.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-jit-0.26.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_obj__0_26_0",
        url = "https://crates.io/api/v1/crates/wasmtime-obj/0.26.0/download",
        type = "tar.gz",
        sha256 = "bd9d5c6c8924ea1fb2372d26c0546a8c5aab94001d5ddedaa36fd7b090c04de2",
        strip_prefix = "wasmtime-obj-0.26.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-obj-0.26.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_profiling__0_26_0",
        url = "https://crates.io/api/v1/crates/wasmtime-profiling/0.26.0/download",
        type = "tar.gz",
        sha256 = "44760e80dd5f53e9af6c976120f9f1d35908ee0c646a3144083f0a57b7123ba7",
        strip_prefix = "wasmtime-profiling-0.26.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-profiling-0.26.0.bazel"),
    )

    maybe(
        http_archive,
        name = "proxy_wasm_cpp_host__wasmtime_runtime__0_26_0",
        url = "https://crates.io/api/v1/crates/wasmtime-runtime/0.26.0/download",
        type = "tar.gz",
        sha256 = "9701c6412897ba3a10fb4e17c4ec29723ed33d6feaaaeaf59f53799107ce7351",
        strip_prefix = "wasmtime-runtime-0.26.0",
        build_file = Label("//bazel/cargo/remote:BUILD.wasmtime-runtime-0.26.0.bazel"),
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
