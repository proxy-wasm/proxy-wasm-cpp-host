workspace(name = "proxy_wasm_cpp_host")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "proxy_wasm_cpp_sdk",
    sha256 = "14f66f67e8f37ec81d28d7f5307be4407d206ac5f0daaf6d22fa5536797bcac1",
    strip_prefix = "proxy-wasm-cpp-sdk-31f1fc5b7e09f231fa532d2d296e479a113c3e10",
    urls = ["https://github.com/proxy-wasm/proxy-wasm-cpp-sdk/archive/31f1fc5b7e09f231fa532d2d296e479a113c3e10.tar.gz"],
)

http_archive(
    name = "com_google_absl",
    sha256 = "19391fb4882601a65cb648d638c11aa301ce5f525ef02da1a9eafd22f72d7c59",
    strip_prefix = "abseil-cpp-37dd2562ec830d547a1524bb306be313ac3f2556",
    # 2020-01-29
    urls = ["https://github.com/abseil/abseil-cpp/archive/37dd2562ec830d547a1524bb306be313ac3f2556.tar.gz"],
)

http_archive(
    name = "com_google_googletest",
    sha256 = "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb",
    strip_prefix = "googletest-release-1.10.0",
    urls = ["https://github.com/google/googletest/archive/release-1.10.0.tar.gz"],
)
