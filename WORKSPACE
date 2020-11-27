workspace(name = "proxy_wasm_cpp_host")

load("@proxy_wasm_cpp_host//bazel:dependencies.bzl", proxy_wasm_cpp_host_dependencies = "dependencies")

proxy_wasm_cpp_host_dependencies()

load("@proxy_wasm_cpp_host//bazel:dependencies_extra.bzl", proxy_wasm_cpp_host_dependencies_extra = "dependencies_extra")

proxy_wasm_cpp_host_dependencies_extra()

load("@envoy//bazel:api_binding.bzl", "envoy_api_binding")

envoy_api_binding()

load("@envoy//bazel:api_repositories.bzl", "envoy_api_dependencies")

envoy_api_dependencies()

load("@envoy//bazel:repositories.bzl", "envoy_dependencies")

envoy_dependencies()

load("@envoy//bazel:repositories_extra.bzl", "envoy_dependencies_extra")

envoy_dependencies_extra()

load("@envoy//bazel:dependency_imports.bzl", "envoy_dependency_imports")

envoy_dependency_imports()
