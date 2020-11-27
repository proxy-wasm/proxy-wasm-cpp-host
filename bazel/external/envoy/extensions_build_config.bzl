# See bazel/README.md for details on how this system works.
EXTENSIONS = {
    #
    # Access loggers
    #
    "envoy.access_loggers.file": "//source/extensions/access_loggers/file:config",
    "envoy.access_loggers.wasm": "//source/extensions/access_loggers/wasm:config",

    #
    # WASM
    #
    "envoy.bootstrap.wasm": "//source/extensions/bootstrap/wasm:config",

    #
    # HTTP filters
    #
    "envoy.filters.http.router": "//source/extensions/filters/http/router:config",
    "envoy.filters.http.wasm": "//source/extensions/filters/http/wasm:config",

    #
    # Listener filters
    #
    "envoy.filters.listener.http_inspector": "//source/extensions/filters/listener/http_inspector:config",
    # NOTE: The original_dst filter is implicitly loaded if original_dst functionality is
    #       configured on the listener. Do not remove it in that case or configs will fail to load.
    "envoy.filters.listener.original_dst": "//source/extensions/filters/listener/original_dst:config",
    "envoy.filters.listener.original_src": "//source/extensions/filters/listener/original_src:config",
    # NOTE: The proxy_protocol filter is implicitly loaded if proxy_protocol functionality is
    #       configured on the listener. Do not remove it in that case or configs will fail to load.
    "envoy.filters.listener.proxy_protocol": "//source/extensions/filters/listener/proxy_protocol:config",
    "envoy.filters.listener.tls_inspector": "//source/extensions/filters/listener/tls_inspector:config",

    #
    # Network filters
    #
    "envoy.filters.network.client_ssl_auth": "//source/extensions/filters/network/client_ssl_auth:config",
    "envoy.filters.network.direct_response": "//source/extensions/filters/network/direct_response:config",
    "envoy.filters.network.dubbo_proxy": "//source/extensions/filters/network/dubbo_proxy:config",
    "envoy.filters.network.echo": "//source/extensions/filters/network/echo:config",
    "envoy.filters.network.ext_authz": "//source/extensions/filters/network/ext_authz:config",
    "envoy.filters.network.http_connection_manager": "//source/extensions/filters/network/http_connection_manager:config",
    # WiP
    "envoy.filters.network.kafka_broker": "//source/extensions/filters/network/kafka:kafka_broker_config_lib",
    "envoy.filters.network.local_ratelimit": "//source/extensions/filters/network/local_ratelimit:config",
    "envoy.filters.network.mongo_proxy": "//source/extensions/filters/network/mongo_proxy:config",
    "envoy.filters.network.mysql_proxy": "//source/extensions/filters/network/mysql_proxy:config",
    "envoy.filters.network.postgres_proxy": "//source/extensions/filters/network/postgres_proxy:config",
    "envoy.filters.network.ratelimit": "//source/extensions/filters/network/ratelimit:config",
    "envoy.filters.network.rbac": "//source/extensions/filters/network/rbac:config",
    "envoy.filters.network.redis_proxy": "//source/extensions/filters/network/redis_proxy:config",
    "envoy.filters.network.rocketmq_proxy": "//source/extensions/filters/network/rocketmq_proxy:config",
    "envoy.filters.network.tcp_proxy": "//source/extensions/filters/network/tcp_proxy:config",
    "envoy.filters.network.thrift_proxy": "//source/extensions/filters/network/thrift_proxy:config",
    "envoy.filters.network.sni_cluster": "//source/extensions/filters/network/sni_cluster:config",
    "envoy.filters.network.sni_dynamic_forward_proxy": "//source/extensions/filters/network/sni_dynamic_forward_proxy:config",
    "envoy.filters.network.wasm": "//source/extensions/filters/network/wasm:config",
    "envoy.filters.network.zookeeper_proxy": "//source/extensions/filters/network/zookeeper_proxy:config",

    #
    # UDP filters
    #
    "envoy.filters.udp_listener.dns_filter": "//source/extensions/filters/udp/dns_filter:config",
    "envoy.filters.udp_listener.udp_proxy": "//source/extensions/filters/udp/udp_proxy:config",

    #
    # Resource monitors
    #
    "envoy.resource_monitors.fixed_heap": "//source/extensions/resource_monitors/fixed_heap:config",
    "envoy.resource_monitors.injected_resource": "//source/extensions/resource_monitors/injected_resource:config",

    #
    # Stat sinks
    #
    "envoy.stat_sinks.dog_statsd": "//source/extensions/stat_sinks/dog_statsd:config",
    "envoy.stat_sinks.hystrix": "//source/extensions/stat_sinks/hystrix:config",
    "envoy.stat_sinks.metrics_service": "//source/extensions/stat_sinks/metrics_service:config",
    "envoy.stat_sinks.statsd": "//source/extensions/stat_sinks/statsd:config",
    "envoy.stat_sinks.wasm": "//source/extensions/stat_sinks/wasm:config",

    #
    # Thrift filters
    #
    "envoy.filters.thrift.router": "//source/extensions/filters/network/thrift_proxy/router:config",
    "envoy.filters.thrift.ratelimit": "//source/extensions/filters/network/thrift_proxy/filters/ratelimit:config",

    #
    # Tracers
    #
    "envoy.tracers.dynamic_ot": "//source/extensions/tracers/dynamic_ot:config",
    "envoy.tracers.lightstep": "//source/extensions/tracers/lightstep:config",
    "envoy.tracers.datadog": "//source/extensions/tracers/datadog:config",
    "envoy.tracers.zipkin": "//source/extensions/tracers/zipkin:config",
    "envoy.tracers.opencensus": "//source/extensions/tracers/opencensus:config",
    # WiP
    "envoy.tracers.xray": "//source/extensions/tracers/xray:config",
    "envoy.tracers.skywalking": "//source/extensions/tracers/skywalking:config",

    #
    # Transport sockets
    #
    "envoy.transport_sockets.alts": "//source/extensions/transport_sockets/alts:config",
    "envoy.transport_sockets.upstream_proxy_protocol": "//source/extensions/transport_sockets/proxy_protocol:upstream_config",
    "envoy.transport_sockets.raw_buffer": "//source/extensions/transport_sockets/raw_buffer:config",
    "envoy.transport_sockets.tap": "//source/extensions/transport_sockets/tap:config",
    "envoy.transport_sockets.quic": "//source/extensions/quic_listeners/quiche:quic_factory_lib",

    #
    # Retry host predicates
    #
    "envoy.retry_host_predicates.previous_hosts": "//source/extensions/retry/host/previous_hosts:config",
    "envoy.retry_host_predicates.omit_canary_hosts": "//source/extensions/retry/host/omit_canary_hosts:config",
    "envoy.retry_host_predicates.omit_host_metadata": "//source/extensions/retry/host/omit_host_metadata:config",

    #
    # Retry priorities
    #
    "envoy.retry_priorities.previous_priorities": "//source/extensions/retry/priority/previous_priorities:config",

    #
    # CacheFilter plugins
    #
    "envoy.filters.http.cache.simple_http_cache": "//source/extensions/filters/http/cache/simple_http_cache:simple_http_cache_lib",

    #
    # Internal redirect predicates
    #
    "envoy.internal_redirect_predicates.allow_listed_routes": "//source/extensions/internal_redirect/allow_listed_routes:config",
    "envoy.internal_redirect_predicates.previous_routes": "//source/extensions/internal_redirect/previous_routes:config",
    "envoy.internal_redirect_predicates.safe_cross_scheme": "//source/extensions/internal_redirect/safe_cross_scheme:config",

    #
    # Http Upstreams (excepting envoy.upstreams.http.generic which is hard-coded into the build so not registered here)
    #
    "envoy.upstreams.http.http": "//source/extensions/upstreams/http/http:config",
    "envoy.upstreams.http.tcp": "//source/extensions/upstreams/http/tcp:config",

    #
    # Watchdog actions
    #
    "envoy.watchdog.profile_action": "//source/extensions/watchdog/profile_action:config",

    #
    # WebAssembly runtimes
    #
    "envoy.wasm.runtime.null": "//source/extensions/wasm_runtime/null:config",
    "envoy.wasm.runtime.v8": "//source/extensions/wasm_runtime/v8:config",
    "envoy.wasm.runtime.wavm": "//source/extensions/wasm_runtime/wavm:config",
    "envoy.wasm.runtime.wasmtime": "//source/extensions/wasm_runtime/wasmtime:config",
}

# These can be changed to ["//visibility:public"], for  downstream builds which
# need to directly reference Envoy extensions.
EXTENSION_CONFIG_VISIBILITY = ["//:extension_config"]
EXTENSION_PACKAGE_VISIBILITY = ["//:extension_library"]
