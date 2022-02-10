load("@bazel_skylib//lib:selects.bzl", "selects")

config_setting(
    name = "runtime_nullvm",
    values = {"define": "runtime=nullvm"},
)

config_setting(
    name = "runtime_v8",
    values = {"define": "runtime=v8"},
)

config_setting(
    name = "runtime_wamr",
    values = {"define": "runtime=wamr"},
)

config_setting(
    name = "runtime_wasmtime",
    values = {"define": "runtime=wasmtime"},
)

config_setting(
    name = "runtime_wavm",
    values = {"define": "runtime=wavm"},
)

config_setting(
    name = "requested_crypto_system",
    values = {"define": "crypto=system"},
)

config_setting(
    name = "linux_s390x",
    values = {"cpu": "s390x"},
)

selects.config_setting_group(
    name = "crypto_system",
    match_any = [
        ":requested_crypto_system",
        ":linux_s390x",
    ],
)
