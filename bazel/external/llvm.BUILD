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

load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = glob(["**"]),
)

cmake(
    name = "llvm_lib",
    cache_entries = {
        # Disable both: BUILD and INCLUDE, since some of the INCLUDE
        # targets build code instead of only generating build files.
        "LLVM_BUILD_BENCHMARKS": "off",
        "LLVM_INCLUDE_BENCHMARKS": "off",
        "LLVM_BUILD_DOCS": "off",
        "LLVM_INCLUDE_DOCS": "off",
        "LLVM_BUILD_EXAMPLES": "off",
        "LLVM_INCLUDE_EXAMPLES": "off",
        "LLVM_BUILD_RUNTIME": "off",
        "LLVM_BUILD_RUNTIMES": "off",
        "LLVM_INCLUDE_RUNTIMES": "off",
        "LLVM_BUILD_TESTS": "off",
        "LLVM_INCLUDE_TESTS": "off",
        "LLVM_BUILD_TOOLS": "off",
        "LLVM_INCLUDE_TOOLS": "off",
        "LLVM_BUILD_UTILS": "off",
        "LLVM_INCLUDE_UTILS": "off",
        "LLVM_ENABLE_IDE": "off",
        "LLVM_ENABLE_LIBEDIT": "off",
        "LLVM_ENABLE_LIBXML2": "off",
        "LLVM_ENABLE_TERMINFO": "off",
        "LLVM_ENABLE_ZLIB": "off",
        "LLVM_TARGETS_TO_BUILD": "X86",
        "CMAKE_CXX_FLAGS": "-Wno-unused-command-line-argument",
    },
    generate_args = ["-GNinja"],
    lib_source = ":srcs",
    out_static_libs = [
        "libLLVMWindowsManifest.a",
        "libLLVMXRay.a",
        "libLLVMLibDriver.a",
        "libLLVMDlltoolDriver.a",
        "libLLVMCoverage.a",
        "libLLVMLineEditor.a",
        "libLLVMX86Disassembler.a",
        "libLLVMX86AsmParser.a",
        "libLLVMX86CodeGen.a",
        "libLLVMX86Desc.a",
        "libLLVMX86Info.a",
        "libLLVMOrcJIT.a",
        "libLLVMMCJIT.a",
        "libLLVMJITLink.a",
        "libLLVMOrcTargetProcess.a",
        "libLLVMOrcShared.a",
        "libLLVMInterpreter.a",
        "libLLVMExecutionEngine.a",
        "libLLVMRuntimeDyld.a",
        "libLLVMSymbolize.a",
        "libLLVMDebugInfoPDB.a",
        "libLLVMDebugInfoGSYM.a",
        "libLLVMOption.a",
        "libLLVMObjectYAML.a",
        "libLLVMMCA.a",
        "libLLVMMCDisassembler.a",
        "libLLVMLTO.a",
        "libLLVMPasses.a",
        "libLLVMCFGuard.a",
        "libLLVMCoroutines.a",
        "libLLVMObjCARCOpts.a",
        "libLLVMHelloNew.a",
        "libLLVMipo.a",
        "libLLVMVectorize.a",
        "libLLVMLinker.a",
        "libLLVMInstrumentation.a",
        "libLLVMFrontendOpenMP.a",
        "libLLVMFrontendOpenACC.a",
        "libLLVMExtensions.a",
        "libLLVMDWARFLinker.a",
        "libLLVMGlobalISel.a",
        "libLLVMMIRParser.a",
        "libLLVMAsmPrinter.a",
        "libLLVMDebugInfoDWARF.a",
        "libLLVMSelectionDAG.a",
        "libLLVMCodeGen.a",
        "libLLVMIRReader.a",
        "libLLVMAsmParser.a",
        "libLLVMInterfaceStub.a",
        "libLLVMFileCheck.a",
        "libLLVMFuzzMutate.a",
        "libLLVMTarget.a",
        "libLLVMScalarOpts.a",
        "libLLVMInstCombine.a",
        "libLLVMAggressiveInstCombine.a",
        "libLLVMTransformUtils.a",
        "libLLVMBitWriter.a",
        "libLLVMAnalysis.a",
        "libLLVMProfileData.a",
        "libLLVMObject.a",
        "libLLVMTextAPI.a",
        "libLLVMMCParser.a",
        "libLLVMMC.a",
        "libLLVMDebugInfoCodeView.a",
        "libLLVMDebugInfoMSF.a",
        "libLLVMBitReader.a",
        "libLLVMCore.a",
        "libLLVMRemarks.a",
        "libLLVMBitstreamReader.a",
        "libLLVMBinaryFormat.a",
        "libLLVMSupport.a",
        "libLLVMDemangle.a",
    ],
)
