load("@bazel_skylib//lib:selects.bzl", "selects")

config_setting(
    name = "engine_null",
    values = {"define": "engine=null"},
)

config_setting(
    name = "engine_v8",
    values = {"define": "engine=v8"},
)

config_setting(
    name = "engine_wamr",
    values = {"define": "engine=wamr"},
)

config_setting(
    name = "engine_wasmtime",
    values = {"define": "engine=wasmtime"},
)

config_setting(
    name = "engine_wavm",
    values = {"define": "engine=wavm"},
)

config_setting(
    name = "multiengine",
    values = {"define": "engine=multi"},
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
