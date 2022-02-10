load("@bazel_skylib//lib:selects.bzl", "selects")

config_setting(
    name = "requested_engine_v8",
    values = {"define": "engine=v8"},
)

config_setting(
    name = "requested_runtime_v8",
    values = {"define": "runtime=v8"},
)

selects.config_setting_group(
    name = "engine_v8",
    match_any = [
        ":requested_engine_v8",
        ":requested_runtime_v8",
    ],
)

config_setting(
    name = "requested_engine_wamr",
    values = {"define": "engine=wamr"},
)

config_setting(
    name = "requested_runtime_wamr",
    values = {"define": "runtime=wamr"},
)

selects.config_setting_group(
    name = "engine_wamr",
    match_any = [
        ":requested_engine_wamr",
        ":requested_runtime_wamr",
    ],
)

config_setting(
    name = "requested_engine_wasmtime",
    values = {"define": "engine=wasmtime"},
)

config_setting(
    name = "requested_runtime_wasmtime",
    values = {"define": "runtime=wasmtime"},
)

selects.config_setting_group(
    name = "engine_wasmtime",
    match_any = [
        ":requested_engine_wasmtime",
        ":requested_runtime_wasmtime",
    ],
)

config_setting(
    name = "requested_engine_wavm",
    values = {"define": "engine=wavm"},
)

config_setting(
    name = "requested_runtime_wavm",
    values = {"define": "runtime=wavm"},
)

selects.config_setting_group(
    name = "engine_wavm",
    match_any = [
        ":requested_engine_wavm",
        ":requested_runtime_wavm",
    ],
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
