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

load("@rules_cc//cc:defs.bzl", "cc_library")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

# LLVM libraries for JIT/AOT compilation - built with native Bazel.
# This replaces the foreign_cc cmake build of LLVM with native Bazel builds.
# These libraries are linked into the final binary for WAMR JIT and WasmEdge AOT.
# Shared by both WAMR and WasmEdge for consistency.
# Uses select() for CPU-specific libraries only.
cc_library(
    name = "llvm_lib",
    deps = [
        "@llvm-project//llvm:Analysis",
        "@llvm-project//llvm:BitReader",
        "@llvm-project//llvm:BitWriter",
        "@llvm-project//llvm:CodeGen",
        "@llvm-project//llvm:Core",
        "@llvm-project//llvm:ExecutionEngine",
        "@llvm-project//llvm:IPO",
        "@llvm-project//llvm:IRReader",
        "@llvm-project//llvm:InstCombine",
        "@llvm-project//llvm:Instrumentation",
        "@llvm-project//llvm:JITLink",
        "@llvm-project//llvm:Linker",
        "@llvm-project//llvm:MC",
        "@llvm-project//llvm:MCJIT",
        "@llvm-project//llvm:Object",
        "@llvm-project//llvm:OrcJIT",
        "@llvm-project//llvm:Passes",
        "@llvm-project//llvm:Scalar",
        "@llvm-project//llvm:Support",
        "@llvm-project//llvm:Target",
        "@llvm-project//llvm:TransformUtils",
        "@llvm-project//llvm:Vectorize",
        # LLD libraries required by WasmEdge AOT codegen
        "@llvm-project//lld:Common",
        "@llvm-project//lld:ELF",
    ] + select({
        "@platforms//cpu:x86_64": [
            "@llvm-project//llvm:X86AsmParser",
            "@llvm-project//llvm:X86CodeGen",
            "@llvm-project//llvm:X86Disassembler",
        ],
        "@platforms//cpu:aarch64": [
            "@llvm-project//llvm:AArch64AsmParser",
            "@llvm-project//llvm:AArch64CodeGen",
            "@llvm-project//llvm:AArch64Disassembler",
        ],
        "//conditions:default": [
            "@llvm-project//llvm:X86AsmParser",
            "@llvm-project//llvm:X86CodeGen",
            "@llvm-project//llvm:X86Disassembler",
        ],
    }),
)

# Create a tarball with LLVM headers preserving directory structure
# This is a robust, bzlmod-compatible solution for providing headers to rules_foreign_cc
genrule(
    name = "package_llvm_headers",
    srcs = ["@llvm_toolchain_llvm//:all_includes"],
    outs = ["llvm_headers.tar.gz"],
    cmd = """
        # Create temporary directory for building the archive
        TMPDIR=$$(mktemp -d)
        
        # Copy all headers preserving directory structure
        # The all_includes filegroup contains files like include/llvm/Config/llvm-config.h
        for src in $(SRCS); do
            # Extract the path relative to the workspace
            # Files are like external/llvm_toolchain_llvm/include/llvm/...
            rel_path=$$(echo $$src | sed 's|.*/llvm_toolchain_llvm/||')
            dest_path=$$TMPDIR/$$rel_path
            mkdir -p $$(dirname $$dest_path)
            cp $$src $$dest_path
        done
        
        # Create tarball from the temp directory
        tar -czf $(location llvm_headers.tar.gz) -C $$TMPDIR .
        rm -rf $$TMPDIR
    """,
)

filegroup(
    name = "llvm_headers",
    srcs = [":package_llvm_headers"],
)

# Create LLVM CMake config files for rules_foreign_cc
# WasmEdge's CMake build needs find_package(LLVM) to work
# This genrule creates a tarball with CMake config files preserving directory structure
# The tarball approach ensures rules_foreign_cc extracts files to EXT_BUILD_DEPS with correct paths
genrule(
    name = "generate_llvm_cmake_config",
    outs = ["llvm_cmake.tar.gz"],
    cmd = """
        # Create temporary directory for building the archive
        TMPDIR=$$(mktemp -d) || exit 1
        
        # Ensure cleanup on exit
        trap 'rm -rf $$TMPDIR' EXIT
        
        # Create directory structure
        mkdir -p $$TMPDIR/llvm_cmake/lib/cmake/llvm
        
        # Determine native architecture for LLVM_NATIVE_ARCH
        # This is used as a placeholder - actual architecture is determined by Bazel build
        NATIVE_ARCH="X86"
        if [ "$$(uname -m)" = "aarch64" ] || [ "$$(uname -m)" = "arm64" ]; then
            NATIVE_ARCH="AArch64"
        fi
        
        # Create LLVMConfig.cmake with necessary variables
        # Note: Version numbers are hardcoded to match llvm-project-19.1.0.src in repositories.bzl
        # When upgrading LLVM, update both repositories.bzl and this version string
        cat > $$TMPDIR/llvm_cmake/lib/cmake/llvm/LLVMConfig.cmake << EOF
# Minimal LLVMConfig.cmake for Bazel builds
# Generated by bazel/external/llvm.BUILD

set(LLVM_VERSION_MAJOR 19)
set(LLVM_VERSION_MINOR 1)
set(LLVM_VERSION_PATCH 0)
set(LLVM_VERSION_SUFFIX "")
set(LLVM_VERSION_STRING "19.1.0")

# Set library and include directories
# These are relative to where WasmEdge's CMake will be running
# In rules_foreign_cc sandbox, LLVM headers are available via EXT_BUILD_ROOT
get_filename_component(LLVM_INSTALL_PREFIX "\\$${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)
set(LLVM_LIBRARY_DIR "\\$${LLVM_INSTALL_PREFIX}/lib")
set(LLVM_CMAKE_DIR "\\$${CMAKE_CURRENT_LIST_DIR}")
set(LLVM_INCLUDE_DIRS "\\$${LLVM_INSTALL_PREFIX}/include")
set(LLVM_DEFINITIONS "")
set(LLVM_ENABLE_ASSERTIONS OFF)
set(LLVM_ENABLE_EH OFF)
set(LLVM_ENABLE_RTTI OFF)
set(LLVM_BUILD_TYPE "Release")

# Target information
set(LLVM_TARGETS_TO_BUILD "X86;AArch64")
set(LLVM_NATIVE_ARCH $$NATIVE_ARCH)

# Components (minimal set for WasmEdge)
set(LLVM_AVAILABLE_LIBS "")

# Mark as found
set(LLVM_FOUND TRUE)

# Include LLVMExports if it exists (it will be empty but needs to exist)
include("\\$${CMAKE_CURRENT_LIST_DIR}/LLVMExports.cmake" OPTIONAL)

message(STATUS "Found LLVM \\$${LLVM_VERSION_STRING} (Bazel-generated config)")
message(STATUS "LLVM_CMAKE_DIR: \\$${LLVM_CMAKE_DIR}")
message(STATUS "LLVM_LIBRARY_DIR: \\$${LLVM_LIBRARY_DIR}")
message(STATUS "LLVM_INCLUDE_DIRS: \\$${LLVM_INCLUDE_DIRS}")
EOF

        # Create LLVMConfigVersion.cmake
        # Note: Version number must match LLVM_VERSION_STRING above
        cat > $$TMPDIR/llvm_cmake/lib/cmake/llvm/LLVMConfigVersion.cmake << 'EOF'
# LLVMConfigVersion.cmake for Bazel builds
set(PACKAGE_VERSION "19.1.0")
set(PACKAGE_VERSION_EXACT FALSE)
set(PACKAGE_VERSION_COMPATIBLE TRUE)
if(PACKAGE_VERSION VERSION_LESS PACKAGE_FIND_VERSION)
  set(PACKAGE_VERSION_COMPATIBLE FALSE)
endif()
if(PACKAGE_FIND_VERSION_MAJOR STREQUAL "19" AND 
   PACKAGE_FIND_VERSION_MINOR STREQUAL "1")
  set(PACKAGE_VERSION_EXACT TRUE)
endif()
EOF

        # Create empty LLVMExports.cmake
        cat > $$TMPDIR/llvm_cmake/lib/cmake/llvm/LLVMExports.cmake << 'EOF'
# LLVMExports.cmake for Bazel builds
# In Bazel builds, LLVM libraries are linked via cc_library deps,
# not via CMake targets, so this file is intentionally minimal.
EOF

        # Create tarball from the temp directory
        tar -czf $(location llvm_cmake.tar.gz) -C $$TMPDIR llvm_cmake
    """,
)

filegroup(
    name = "llvm_cmake_config",
    srcs = [":generate_llvm_cmake_config"],
)
