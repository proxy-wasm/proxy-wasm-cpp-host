workspace(name = "proxy_wasm_cpp_host")

load("@proxy_wasm_cpp_host//bazel:repositories.bzl", "proxy_wasm_cpp_host_base_repositories", "proxy_wasm_cpp_host_engine_repositories")

proxy_wasm_cpp_host_base_repositories()

# Now that rules_foreign_cc was loaded above, we can pull in all of the dependencies we need
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

# Need to load bazel_features deps as well (now that we've pulled in rules_foreign_cc_deps)
load("@bazel_features//:deps.bzl", "bazel_features_deps")

bazel_features_deps()

proxy_wasm_cpp_host_engine_repositories()

load("@proxy_wasm_cpp_host//bazel:dependencies.bzl", "proxy_wasm_cpp_host_dependencies")

proxy_wasm_cpp_host_dependencies()

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
