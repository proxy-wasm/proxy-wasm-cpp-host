# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Wrapper rule to apply V8's pointer compression transition to cc_library targets.

V8 provides v8_disable_pointer_compression transition and v8_binary_non_pointer_compression
for cc_binary targets. This file provides the equivalent for cc_library targets by wrapping
the same transition that V8 uses.
"""

load("@v8//:bazel/v8-non-pointer-compression.bzl", "v8_disable_pointer_compression")

def _v8_lib_no_pointer_compression_impl(ctx):
    """Forward providers from the library built with pointer compression disabled.

    This is analogous to V8's _v8_binary_non_pointer_compression implementation,
    but for cc_library instead of cc_binary.
    """

    # The transition may create a list of configured targets, take the first one
    library = ctx.attr.library[0] if type(ctx.attr.library) == type([]) else ctx.attr.library
    return [library[CcInfo], library[DefaultInfo]]

v8_lib_no_pointer_compression = rule(
    implementation = _v8_lib_no_pointer_compression_impl,
    attrs = {
        "library": attr.label(
            cfg = v8_disable_pointer_compression,
            providers = [CcInfo],
            doc = "The V8 library to build with pointer compression disabled",
        ),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    provides = [CcInfo, DefaultInfo],
    doc = """Wraps a cc_library target with V8's pointer compression disabled.

    This rule uses V8's v8_disable_pointer_compression transition (the same one used
    by v8_binary_non_pointer_compression) to ensure v8_enable_pointer_compression
    is set to False for the library and all its dependencies.

    This is the library equivalent of V8's v8_binary_non_pointer_compression rule.
    """,
)
