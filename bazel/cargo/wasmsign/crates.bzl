"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def wasmsign_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "wasmsign__ansi_term__0_12_1",
        url = "https://crates.io/api/v1/crates/ansi_term/0.12.1/download",
        type = "tar.gz",
        sha256 = "d52a9bb7ec0cf484c551830a7ce27bd20d67eac647e1befb56b0be4ee39a55d2",
        strip_prefix = "ansi_term-0.12.1",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.ansi_term-0.12.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__anyhow__1_0_53",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.53/download",
        type = "tar.gz",
        sha256 = "94a45b455c14666b85fc40a019e8ab9eb75e3a124e05494f5397122bc9eb06e0",
        strip_prefix = "anyhow-1.0.53",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.anyhow-1.0.53.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__bitflags__1_3_2",
        url = "https://crates.io/api/v1/crates/bitflags/1.3.2/download",
        type = "tar.gz",
        sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a",
        strip_prefix = "bitflags-1.3.2",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.bitflags-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__byteorder__1_4_3",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.3/download",
        type = "tar.gz",
        sha256 = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610",
        strip_prefix = "byteorder-1.4.3",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.byteorder-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__clap__2_34_0",
        url = "https://crates.io/api/v1/crates/clap/2.34.0/download",
        type = "tar.gz",
        sha256 = "a0610544180c38b88101fecf2dd634b174a62eef6946f84dfc6a7127512b381c",
        strip_prefix = "clap-2.34.0",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.clap-2.34.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__ed25519_compact__1_0_8",
        url = "https://crates.io/api/v1/crates/ed25519-compact/1.0.8/download",
        type = "tar.gz",
        sha256 = "302ea73924517e9952bf08b505536f757e28dca8372cbf8b20723a0e2bab6c01",
        strip_prefix = "ed25519-compact-1.0.8",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.ed25519-compact-1.0.8.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__getrandom__0_2_4",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.4/download",
        type = "tar.gz",
        sha256 = "418d37c8b1d42553c93648be529cb70f920d3baf8ef469b74b9638df426e0b4c",
        strip_prefix = "getrandom-0.2.4",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.getrandom-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__hermit_abi__0_1_19",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.19/download",
        type = "tar.gz",
        sha256 = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33",
        strip_prefix = "hermit-abi-0.1.19",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.hermit-abi-0.1.19.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__hmac_sha512__1_1_1",
        url = "https://crates.io/api/v1/crates/hmac-sha512/1.1.1/download",
        type = "tar.gz",
        sha256 = "6b2ce076d8070f292037093a825343f6341fe0ce873268c2477e2f49abd57b10",
        strip_prefix = "hmac-sha512-1.1.1",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.hmac-sha512-1.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__libc__0_2_114",
        url = "https://crates.io/api/v1/crates/libc/0.2.114/download",
        type = "tar.gz",
        sha256 = "b0005d08a8f7b65fb8073cb697aa0b12b631ed251ce73d862ce50eeb52ce3b50",
        strip_prefix = "libc-0.2.114",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.libc-0.2.114.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__parity_wasm__0_42_2",
        url = "https://crates.io/api/v1/crates/parity-wasm/0.42.2/download",
        type = "tar.gz",
        sha256 = "be5e13c266502aadf83426d87d81a0f5d1ef45b8027f5a471c360abfe4bfae92",
        strip_prefix = "parity-wasm-0.42.2",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.parity-wasm-0.42.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__proc_macro2__1_0_36",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.36/download",
        type = "tar.gz",
        sha256 = "c7342d5883fbccae1cc37a2353b09c87c9b0f3afd73f5fb9bba687a1f733b029",
        strip_prefix = "proc-macro2-1.0.36",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.proc-macro2-1.0.36.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__quote__1_0_15",
        url = "https://crates.io/api/v1/crates/quote/1.0.15/download",
        type = "tar.gz",
        sha256 = "864d3e96a899863136fc6e99f3d7cae289dafe43bf2c5ac19b70df7210c0a145",
        strip_prefix = "quote-1.0.15",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.quote-1.0.15.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__strsim__0_8_0",
        url = "https://crates.io/api/v1/crates/strsim/0.8.0/download",
        type = "tar.gz",
        sha256 = "8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a",
        strip_prefix = "strsim-0.8.0",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.strsim-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__syn__1_0_86",
        url = "https://crates.io/api/v1/crates/syn/1.0.86/download",
        type = "tar.gz",
        sha256 = "8a65b3f4ffa0092e9887669db0eae07941f023991ab58ea44da8fe8e2d511c6b",
        strip_prefix = "syn-1.0.86",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.syn-1.0.86.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__textwrap__0_11_0",
        url = "https://crates.io/api/v1/crates/textwrap/0.11.0/download",
        type = "tar.gz",
        sha256 = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060",
        strip_prefix = "textwrap-0.11.0",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.textwrap-0.11.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__thiserror__1_0_30",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.30/download",
        type = "tar.gz",
        sha256 = "854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9644e5c417",
        strip_prefix = "thiserror-1.0.30",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.thiserror-1.0.30.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__thiserror_impl__1_0_30",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.30/download",
        type = "tar.gz",
        sha256 = "aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d377e5714b",
        strip_prefix = "thiserror-impl-1.0.30",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.thiserror-impl-1.0.30.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__unicode_width__0_1_9",
        url = "https://crates.io/api/v1/crates/unicode-width/0.1.9/download",
        type = "tar.gz",
        sha256 = "3ed742d4ea2bd1176e236172c8429aaf54486e7ac098db29ffe6529e0ce50973",
        strip_prefix = "unicode-width-0.1.9",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.unicode-width-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__unicode_xid__0_2_2",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.2/download",
        type = "tar.gz",
        sha256 = "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3",
        strip_prefix = "unicode-xid-0.2.2",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.unicode-xid-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__vec_map__0_8_2",
        url = "https://crates.io/api/v1/crates/vec_map/0.8.2/download",
        type = "tar.gz",
        sha256 = "f1bddf1187be692e79c5ffeab891132dfb0f236ed36a43c7ed39f1165ee20191",
        strip_prefix = "vec_map-0.8.2",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.vec_map-0.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__wasi__0_10_2_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.10.2+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "fd6fbd9a79829dd1ad0cc20627bf1ed606756a7f77edff7b66b7064f9cb327c6",
        strip_prefix = "wasi-0.10.2+wasi-snapshot-preview1",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.wasi-0.10.2+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        new_git_repository,
        name = "wasmsign__wasmsign__0_1_2",
        remote = "https://github.com/jedisct1/wasmsign",
        commit = "dfbc0aabe81885d59e88e667aa9c1e6a62dfe9cc",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.wasmsign-0.1.2.bazel"),
        init_submodules = True,
    )

    maybe(
        http_archive,
        name = "wasmsign__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "wasmsign__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//bazel/cargo/wasmsign/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )
