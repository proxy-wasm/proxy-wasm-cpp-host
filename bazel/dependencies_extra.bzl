load("@io_bazel_rules_rust//:workspace.bzl", "rust_workspace")
load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
load("@proxy_wasm_cpp_host//bazel/cargo:crates.bzl", "proxy_wasm_cpp_host_raze__fetch_remote_crates")

def dependencies_extra():
    bazel_skylib_workspace()
    rust_repositories()
    rust_workspace()
    proxy_wasm_cpp_host_raze__fetch_remote_crates()
