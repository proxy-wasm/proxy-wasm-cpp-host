workspace(name = "proxy_wasm_cpp_host")

load("@proxy_wasm_cpp_host//bazel:repositories.bzl", "proxy_wasm_cpp_host_repositories")

proxy_wasm_cpp_host_repositories()

load("@proxy_wasm_cpp_host//bazel:dependencies.bzl", "proxy_wasm_cpp_host_dependencies")

proxy_wasm_cpp_host_dependencies()

# Setup bazel_features internal repos (required for aspect_rules_lint)
load("@proxy_wasm_cpp_host//bazel:setup_features.bzl", "setup_bazel_features")

setup_bazel_features()

load("@proxy_wasm_cpp_host//bazel:dependencies_python.bzl", "proxy_wasm_cpp_host_dependencies_python")

proxy_wasm_cpp_host_dependencies_python()

load("@proxy_wasm_cpp_host//bazel:dependencies_import.bzl", "proxy_wasm_cpp_host_dependencies_import")

proxy_wasm_cpp_host_dependencies_import()

load("@proxy_wasm_cpp_sdk//bazel:repositories.bzl", "proxy_wasm_cpp_sdk_repositories")

proxy_wasm_cpp_sdk_repositories()

load("@proxy_wasm_cpp_sdk//bazel:dependencies.bzl", "proxy_wasm_cpp_sdk_dependencies")

proxy_wasm_cpp_sdk_dependencies()

load("@proxy_wasm_cpp_sdk//bazel:dependencies_extra.bzl", "proxy_wasm_cpp_sdk_dependencies_extra")

proxy_wasm_cpp_sdk_dependencies_extra()
