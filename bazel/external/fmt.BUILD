# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Based on Bazel Central Registry fmt module BUILD file
# https://github.com/bazelbuild/bazel-central-registry/tree/main/modules/fmt/11.0.2

load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # MIT

cc_library(
    name = "fmt",
    srcs = [
        "src/format.cc",
        "src/os.cc",
    ],
    hdrs = glob([
        "include/fmt/*.h",
    ]),
    copts = select({
        "@platforms//os:windows": ["-utf-8"],
        "//conditions:default": [],
    }),
    includes = ["include"],
    strip_include_prefix = "include",
)
