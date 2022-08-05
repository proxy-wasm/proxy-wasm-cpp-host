load("@rules_fuzzing//fuzzing:cc_defs.bzl", "cc_fuzz_test")

licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "corpus_bytecode",
    srcs = glob(["corpus_bytecode/**"]),
)

cc_fuzz_test(
    name = "bytecode_util_fuzzer",
    srcs = ["bytecode_util_fuzzer.cc"],
    corpus = [":corpus_bytecode"],
    deps = [
        "//:lib",
    ],
)

filegroup(
    name = "corpus_pairs",
    srcs = glob(["corpus_pairs/**"]),
)

cc_fuzz_test(
    name = "pairs_util_fuzzer",
    srcs = ["pairs_util_fuzzer.cc"],
    corpus = [":corpus_pairs"],
    deps = [
        "//:lib",
    ],
)
