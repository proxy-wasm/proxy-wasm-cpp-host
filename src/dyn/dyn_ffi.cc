// Copyright 2016-2019 Envoy Project Authors
// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "include/proxy-wasm/wasm_vm.h"
#include "include/proxy-wasm/wasm_api_impl.h"
#include <stddef.h>

extern "C" {

// Configuration and Status
extern proxy_wasm::WasmResult proxy_get_configuration(const char **configuration_ptr,
                                                      size_t *configuration_size) {
  return proxy_wasm::null_plugin::proxy_get_configuration(configuration_ptr, configuration_size);
}

proxy_wasm::WasmResult proxy_get_status(uint32_t *code_ptr, const char **ptr, size_t *size) {
  return proxy_wasm::null_plugin::proxy_get_status(code_ptr, ptr, size);
}

// Logging
proxy_wasm::WasmResult proxy_log(proxy_wasm::LogLevel level, const char *logMessage,
                                 size_t messageSize) {
  return proxy_wasm::null_plugin::proxy_log(level, logMessage, messageSize);
}
proxy_wasm::WasmResult proxy_get_log_level(proxy_wasm::LogLevel *level) {
  return proxy_wasm::null_plugin::proxy_get_log_level(level);
}

// Timer
proxy_wasm::WasmResult proxy_set_tick_period_milliseconds(uint64_t millisecond) {
  return proxy_wasm::null_plugin::proxy_set_tick_period_milliseconds(millisecond);
}
proxy_wasm::WasmResult proxy_get_current_time_nanoseconds(uint64_t *result) {
  return proxy_wasm::null_plugin::proxy_get_current_time_nanoseconds(result);
}

// State accessors
proxy_wasm::WasmResult proxy_get_property(const char *path_ptr, size_t path_size,
                                          const char **value_ptr_ptr, size_t *value_size_ptr) {
  return proxy_wasm::null_plugin::proxy_get_property(path_ptr, path_size, value_ptr_ptr,
                                                     value_size_ptr);
}
proxy_wasm::WasmResult proxy_set_property(const char *key_ptr, size_t key_size,
                                          const char *value_ptr, size_t value_size) {
  return proxy_wasm::null_plugin::proxy_set_property(key_ptr, key_size, value_ptr, value_size);
}

// Continue
proxy_wasm::WasmResult proxy_continue_request() {
  return proxy_wasm::null_plugin::proxy_continue_request();
}
proxy_wasm::WasmResult proxy_continue_response() {
  return proxy_wasm::null_plugin::proxy_continue_response();
}
proxy_wasm::WasmResult proxy_continue_stream(proxy_wasm::WasmStreamType stream_type) {
  return proxy_wasm::null_plugin::proxy_continue_stream(stream_type);
}
proxy_wasm::WasmResult proxy_close_stream(proxy_wasm::WasmStreamType stream_type) {
  return proxy_wasm::null_plugin::proxy_close_stream(stream_type);
}
proxy_wasm::WasmResult
proxy_send_local_response(uint32_t response_code, const char *response_code_details_ptr,
                          size_t response_code_details_size, const char *body_ptr, size_t body_size,
                          const char *additional_response_header_pairs_ptr,
                          size_t additional_response_header_pairs_size, uint32_t grpc_status) {
  return proxy_wasm::null_plugin::proxy_send_local_response(
      response_code, response_code_details_ptr, response_code_details_size, body_ptr, body_size,
      additional_response_header_pairs_ptr, additional_response_header_pairs_size, grpc_status);
}

proxy_wasm::WasmResult proxy_clear_route_cache() {
  return proxy_wasm::null_plugin::proxy_clear_route_cache();
}

// SharedData
proxy_wasm::WasmResult proxy_get_shared_data(const char *key_ptr, size_t key_size,
                                             const char **value_ptr, size_t *value_size,
                                             uint32_t *cas) {
  return proxy_wasm::null_plugin::proxy_get_shared_data(key_ptr, key_size, value_ptr, value_size,
                                                        cas);
}
//  If cas != 0 and cas != the current cas for 'key' return false, otherwise set the value and
//  return true.
proxy_wasm::WasmResult proxy_set_shared_data(const char *key_ptr, size_t key_size,
                                             const char *value_ptr, size_t value_size,
                                             uint64_t cas) {
  return proxy_wasm::null_plugin::proxy_set_shared_data(key_ptr, key_size, value_ptr, value_size,
                                                        cas);
}

// SharedQueue
// Note: Registering the same queue_name will overwrite the old registration while preseving any
// pending data. Consequently it should typically be followed by a call to
// proxy_dequeue_shared_queue. Returns unique token for the queue.
proxy_wasm::WasmResult proxy_register_shared_queue(const char *queue_name_ptr,
                                                   size_t queue_name_size, uint32_t *token) {
  return proxy_wasm::null_plugin::proxy_register_shared_queue(queue_name_ptr, queue_name_size,
                                                              token);
}
// Returns unique token for the queue.
proxy_wasm::WasmResult proxy_resolve_shared_queue(const char *vm_id_ptr, size_t vm_id_size,
                                                  const char *queue_name_ptr,
                                                  size_t queue_name_size, uint32_t *token) {
  return proxy_wasm::null_plugin::proxy_resolve_shared_queue(vm_id_ptr, vm_id_size, queue_name_ptr,
                                                             queue_name_size, token);
}
// Returns true on end-of-stream (no more data available).
proxy_wasm::WasmResult proxy_dequeue_shared_queue(uint32_t token, const char **data_ptr,
                                                  size_t *data_size) {
  return proxy_wasm::null_plugin::proxy_dequeue_shared_queue(token, data_ptr, data_size);
}
// Returns false if the queue was not found and the data was not enqueued.
proxy_wasm::WasmResult proxy_enqueue_shared_queue(uint32_t token, const char *data_ptr,
                                                  size_t data_size) {
  return proxy_wasm::null_plugin::proxy_enqueue_shared_queue(token, data_ptr, data_size);
}

// Buffer
proxy_wasm::WasmResult proxy_get_buffer_bytes(proxy_wasm::WasmBufferType type, size_t start,
                                              size_t length, const char **ptr, size_t *size) {
  return proxy_wasm::null_plugin::proxy_get_buffer_bytes(type, start, length, ptr, size);
}

proxy_wasm::WasmResult proxy_get_buffer_status(proxy_wasm::WasmBufferType type, size_t *length_ptr,
                                               uint32_t *flags_ptr) {
  return proxy_wasm::null_plugin::proxy_get_buffer_status(type, length_ptr, flags_ptr);
}

proxy_wasm::WasmResult proxy_set_buffer_bytes(proxy_wasm::WasmBufferType type, uint64_t start,
                                              uint64_t length, const char *data, size_t size) {
  return proxy_wasm::null_plugin::proxy_set_buffer_bytes(type, start, length, data, size);
}

// Headers/Trailers/Metadata Maps
proxy_wasm::WasmResult proxy_add_header_map_value(proxy_wasm::WasmHeaderMapType type,
                                                  const char *key_ptr, size_t key_size,
                                                  const char *value_ptr, size_t value_size) {
  return proxy_wasm::null_plugin::proxy_add_header_map_value(type, key_ptr, key_size, value_ptr,
                                                             value_size);
}
proxy_wasm::WasmResult proxy_get_header_map_value(proxy_wasm::WasmHeaderMapType type,
                                                  const char *key_ptr, size_t key_size,
                                                  const char **value_ptr, size_t *value_size) {
  return proxy_wasm::null_plugin::proxy_get_header_map_value(type, key_ptr, key_size, value_ptr,
                                                             value_size);
}
proxy_wasm::WasmResult proxy_get_header_map_pairs(proxy_wasm::WasmHeaderMapType type,
                                                  const char **ptr, size_t *size) {
  return proxy_wasm::null_plugin::proxy_get_header_map_pairs(type, ptr, size);
}
proxy_wasm::WasmResult proxy_set_header_map_pairs(proxy_wasm::WasmHeaderMapType type,
                                                  const char *ptr, size_t size) {
  return proxy_wasm::null_plugin::proxy_set_header_map_pairs(type, ptr, size);
}
proxy_wasm::WasmResult proxy_replace_header_map_value(proxy_wasm::WasmHeaderMapType type,
                                                      const char *key_ptr, size_t key_size,
                                                      const char *value_ptr, size_t value_size) {
  return proxy_wasm::null_plugin::proxy_replace_header_map_value(type, key_ptr, key_size, value_ptr,
                                                                 value_size);
}
proxy_wasm::WasmResult proxy_remove_header_map_value(proxy_wasm::WasmHeaderMapType type,
                                                     const char *key_ptr, size_t key_size) {
  return proxy_wasm::null_plugin::proxy_remove_header_map_value(type, key_ptr, key_size);
}
proxy_wasm::WasmResult proxy_get_header_map_size(proxy_wasm::WasmHeaderMapType type, size_t *size) {
  return proxy_wasm::null_plugin::proxy_get_header_map_size(type, size);
}

// HTTP
// Returns token, used in callback onHttpCallResponse
proxy_wasm::WasmResult proxy_http_call(const char *uri_ptr, size_t uri_size, void *header_pairs_ptr,
                                       size_t header_pairs_size, const char *body_ptr,
                                       size_t body_size, void *trailer_pairs_ptr,
                                       size_t trailer_pairs_size, uint64_t timeout_milliseconds,
                                       uint32_t *token_ptr) {
  return proxy_wasm::null_plugin::proxy_http_call(
      uri_ptr, uri_size, header_pairs_ptr, header_pairs_size, body_ptr, body_size,
      trailer_pairs_ptr, trailer_pairs_size, timeout_milliseconds, token_ptr);
}
// gRPC
// Returns token, used in gRPC callbacks (onGrpc...)
proxy_wasm::WasmResult proxy_grpc_call(const char *service_ptr, size_t service_size,
                                       const char *service_name_ptr, size_t service_name_size,
                                       const char *method_name_ptr, size_t method_name_size,
                                       void *initial_metadata_ptr, size_t initial_metadata_size,
                                       const char *request_ptr, size_t request_size,
                                       uint64_t timeout_milliseconds, uint32_t *token_ptr) {
  return proxy_wasm::null_plugin::proxy_grpc_call(
      service_ptr, service_size, service_name_ptr, service_name_size, method_name_ptr,
      method_name_size, initial_metadata_ptr, initial_metadata_size, request_ptr, request_size,
      timeout_milliseconds, token_ptr);
}
proxy_wasm::WasmResult proxy_grpc_stream(const char *service_ptr, size_t service_size,
                                         const char *service_name_ptr, size_t service_name_size,
                                         const char *method_name_ptr, size_t method_name_size,
                                         void *initial_metadata_ptr, size_t initial_metadata_size,
                                         uint32_t *token_ptr) {
  return proxy_wasm::null_plugin::proxy_grpc_stream(
      service_ptr, service_size, service_name_ptr, service_name_size, method_name_ptr,
      method_name_size, initial_metadata_ptr, initial_metadata_size, token_ptr);
}
proxy_wasm::WasmResult proxy_grpc_cancel(uint64_t token) {
  return proxy_wasm::null_plugin::proxy_grpc_cancel(token);
}
proxy_wasm::WasmResult proxy_grpc_close(uint64_t token) {
  return proxy_wasm::null_plugin::proxy_grpc_close(token);
}
proxy_wasm::WasmResult proxy_grpc_send(uint64_t token, const char *message_ptr, size_t message_size,
                                       uint64_t end_stream) {
  return proxy_wasm::null_plugin::proxy_grpc_send(token, message_ptr, message_size, end_stream);
}

// Metrics
// Returns a metric_id which can be used to report a metric. On error returns 0.
proxy_wasm::WasmResult proxy_define_metric(proxy_wasm::MetricType type, const char *name_ptr,
                                           size_t name_size, uint32_t *metric_id) {
  return proxy_wasm::null_plugin::proxy_define_metric(type, name_ptr, name_size, metric_id);
}
proxy_wasm::WasmResult proxy_increment_metric(uint32_t metric_id, int64_t offset) {
  return proxy_wasm::null_plugin::proxy_increment_metric(metric_id, offset);
}
proxy_wasm::WasmResult proxy_record_metric(uint32_t metric_id, uint64_t value) {
  return proxy_wasm::null_plugin::proxy_record_metric(metric_id, value);
}
proxy_wasm::WasmResult proxy_get_metric(uint32_t metric_id, uint64_t *value) {
  return proxy_wasm::null_plugin::proxy_get_metric(metric_id, value);
}

// System
proxy_wasm::WasmResult proxy_set_effective_context(uint64_t context_id) {
  return proxy_wasm::null_plugin::proxy_set_effective_context(context_id);
}
proxy_wasm::WasmResult proxy_done() { return proxy_wasm::null_plugin::proxy_done(); }

proxy_wasm::WasmResult proxy_call_foreign_function(const char *function_name,
                                                   size_t function_name_size, const char *arguments,
                                                   size_t arguments_size, char **results,
                                                   size_t *results_size) {
  return proxy_wasm::null_plugin::proxy_call_foreign_function(
      function_name, function_name_size, arguments, arguments_size, results, results_size);
}

// following functions only exposed in dyn native contexts

void *proxy_dyn_get_thread_context() {
  return reinterpret_cast<void *>(proxy_wasm::exports::getBaseContext());
}

void proxy_dyn_set_limited_thread_context(void *thread_context) {
  proxy_wasm::exports::setLimitedEffectiveContext(
      reinterpret_cast<proxy_wasm::ContextBase *>(thread_context));
}
}