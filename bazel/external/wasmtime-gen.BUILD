licenses(["notice"])  # Apache 2

genrule(
    name = "build",
    srcs = glob(["boringssl/**"]),
    outs = [
        "crypto/libcrypto.a",
        "ssl/libssl.a",
    ],
    cmd = genrule_cmd("@envoy//bazel/external:boringssl_fips.genrule_cmd"),
)

genrule_repository(
    name = name,
    **dict(location, **kwargs)
)
