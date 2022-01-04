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
    env_vars = {
        # Workaround for the -DDEBUG flag added in fastbuild on macOS,
        # which conflicts with DEBUG macro used in LLVM.
        "CFLAGS": "-UDEBUG",
        "CXXFLAGS": "-UDEBUG",
        "ASMFLAGS": "-UDEBUG",
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
        "libLLVMInterpreter.a",
        "libLLVMExecutionEngine.a",
        "libLLVMRuntimeDyld.a",
        "libLLVMOrcTargetProcess.a",
        "libLLVMOrcShared.a",
        "libLLVMDWP.a",
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
        "libLLVMDebugInfoMSF.a",
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
        "libLLVMBitReader.a",
        "libLLVMCore.a",
        "libLLVMRemarks.a",
        "libLLVMBitstreamReader.a",
        "libLLVMBinaryFormat.a",
        "libLLVMTableGen.a",
        "libLLVMSupport.a",
        "libLLVMDemangle.a",
    ],
)
