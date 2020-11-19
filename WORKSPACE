workspace(name = "proxy_wasm_cpp_host")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "proxy_wasm_cpp_sdk",
    commit = "1b5f69ce1535b0c21f88c4af4ebf0ec51d255abe",
    remote = "https://github.com/proxy-wasm/proxy-wasm-cpp-sdk",
)

http_archive(
    name = "com_google_absl",
    sha256 = "19391fb4882601a65cb648d638c11aa301ce5f525ef02da1a9eafd22f72d7c59",
    strip_prefix = "abseil-cpp-37dd2562ec830d547a1524bb306be313ac3f2556",
    # 2020-01-29
    urls = ["https://github.com/abseil/abseil-cpp/archive/37dd2562ec830d547a1524bb306be313ac3f2556.tar.gz"],
)

# required by com_google_absl
http_archive(
  name = "rules_cc",
  urls = ["https://github.com/bazelbuild/rules_cc/archive/262ebec3c2296296526740db4aefce68c80de7fa.zip"],
  strip_prefix = "rules_cc-262ebec3c2296296526740db4aefce68c80de7fa",
)

# required by com_google_protobuf
http_archive(
    name = "bazel_skylib",
    sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

# rust rules
http_archive(
    name = "io_bazel_rules_rust",
    sha256 = "7401878bf966325bbec5224eeb4ff7e8762681070b401acaa168da68d383563a",
    strip_prefix = "rules_rust-9741a32e50a8c50c504c0931111bb6048d6d6888",
    url = "https://github.com/bazelbuild/rules_rust/archive/9741a32e50a8c50c504c0931111bb6048d6d6888.tar.gz",
)

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load("@io_bazel_rules_rust//:workspace.bzl", "rust_workspace")

rust_workspace()

load("//bazel/cargo:crates.bzl", "proxy_wasm_cpp_host_raze__fetch_remote_crates")

proxy_wasm_cpp_host_raze__fetch_remote_crates()

git_repository(
    name = "com_google_protobuf",
    commit = "655310ca192a6e3a050e0ca0b7084a2968072260",
    remote = "https://github.com/protocolbuffers/protobuf",
    shallow_since = "1565024848 -0700",
)

http_archive(
    name = "boringssl",
    sha256 = "bb55b0ed2f0cb548b5dce6a6b8307ce37f7f748eb9f1be6bfe2d266ff2b4d52b",
    strip_prefix = "boringssl-2192bbc878822cf6ab5977d4257a1339453d9d39",
    urls = ["https://github.com/google/boringssl/archive/2192bbc878822cf6ab5977d4257a1339453d9d39.tar.gz"],
)

http_archive(
    name = "com_google_googletest",
    sha256 = "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
    strip_prefix = "googletest-release-1.10.0",
    urls = ["https://github.com/google/googletest/archive/release-1.10.0.tar.gz"],
)

http_archive(
    name = "wasmtime",
    build_file = "@proxy_wasm_cpp_host//bazel/external:wasmtime.BUILD",
    sha256 = "7874feb1026bbef06796bd5ab80e73f15b8e83752bde8dc93994f5bc039a4952",
    strip_prefix = "wasmtime-0.21.0",
    url = "https://github.com/bytecodealliance/wasmtime/archive/v0.21.0.tar.gz",
)

http_archive(
    name = "wasm_c_api",
    build_file = "@proxy_wasm_cpp_host//bazel/external:wasm-c-api.BUILD",
    sha256 = "aea8cd095e9937f1e14f2c93e026317b197eb2345e7a817fe3932062eb7b792c",
    strip_prefix = "wasm-c-api-d9a80099d496b5cdba6f3fe8fc77586e0e505ddc",
    url = "https://github.com/WebAssembly/wasm-c-api/archive/d9a80099d496b5cdba6f3fe8fc77586e0e505ddc.tar.gz",
)
