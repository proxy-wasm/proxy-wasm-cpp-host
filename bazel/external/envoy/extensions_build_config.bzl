# Copyright 2020 Google LLC
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

EXTENSIONS = {
    "envoy.access_loggers.wasm": "//source/extensions/access_loggers/wasm:config",
    "envoy.bootstrap.wasm": "//source/extensions/bootstrap/wasm:config",
    "envoy.filters.http.router": "//source/extensions/filters/http/router:config",
    "envoy.filters.http.wasm": "//source/extensions/filters/http/wasm:config",
    "envoy.filters.network.http_connection_manager": "//source/extensions/filters/network/http_connection_manager:config",
    "envoy.filters.network.tcp_proxy": "//source/extensions/filters/network/tcp_proxy:config",
    "envoy.filters.network.wasm": "//source/extensions/filters/network/wasm:config",
    "envoy.stat_sinks.wasm": "//source/extensions/stat_sinks/wasm:config",
    "envoy.wasm.runtime.null": "//source/extensions/wasm_runtime/null:config",
    "envoy.wasm.runtime.wasmtime": "//source/extensions/wasm_runtime/wasmtime:config",
}

# These can be changed to ["//visibility:public"], for  downstream builds which
# need to directly reference Envoy extensions.
EXTENSION_CONFIG_VISIBILITY = ["//:extension_config"]
EXTENSION_PACKAGE_VISIBILITY = ["//:extension_library"]
