# Copyright 2025 Google LLC
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

load("@rules_cc//cc:defs.bzl", _cc_test = "cc_test")
load("@rules_fuzzing//fuzzing:cc_defs.bzl", _cc_fuzz_test = "cc_fuzz_test")

def cc_test(data = [], **kwargs):
    _cc_test(data = data + ["//bazel:tsan_suppressions.txt"], **kwargs)

def cc_fuzz_test(data = [], **kwargs):
    _cc_fuzz_test(data = data + ["//bazel:tsan_suppressions.txt"], **kwargs)
