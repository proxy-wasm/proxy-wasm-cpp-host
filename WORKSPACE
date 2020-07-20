workspace(name = "proxy_wasm_cpp_host")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "proxy_wasm_cpp_sdk",
    commit = "b273b07ae0cfa9cc76dfe38236b163e9e3a2ab49",
    remote = "https://github.com/proxy-wasm/proxy-wasm-cpp-sdk",
)

http_archive(
    name = "com_google_absl",
    sha256 = "19391fb4882601a65cb648d638c11aa301ce5f525ef02da1a9eafd22f72d7c59",
    strip_prefix = "abseil-cpp-37dd2562ec830d547a1524bb306be313ac3f2556",
    # 2020-01-29
    urls = ["https://github.com/abseil/abseil-cpp/archive/37dd2562ec830d547a1524bb306be313ac3f2556.tar.gz"],
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

git_repository(
    name = "com_google_protobuf",
    commit = "655310ca192a6e3a050e0ca0b7084a2968072260",
    remote = "https://github.com/protocolbuffers/protobuf",
    shallow_since = "1565024848 -0700",
)

http_archive(
    name = "com_google_googletest",
    sha256 = "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
    strip_prefix = "googletest-release-1.10.0",
    urls = ["https://github.com/google/googletest/archive/release-1.10.0.tar.gz"],
)
