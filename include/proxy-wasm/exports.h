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

#pragma once

#include <memory>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/wasm_vm.h"
#include "include/proxy-wasm/word.h"

namespace proxy_wasm {

class ContextBase;

extern thread_local ContextBase *current_context_;

namespace exports {

template <typename Pairs> size_t pairsSize(const Pairs &result) {
  size_t size = 4; // number of headers
  for (auto &p : result) {
    size += 8;                   // size of key, size of value
    size += p.first.size() + 1;  // null terminated key
    size += p.second.size() + 1; // null terminated value
  }
  return size;
}

template <typename Pairs> void marshalPairs(const Pairs &result, char *buffer) {
  char *b = buffer;
  *reinterpret_cast<uint32_t *>(b) = result.size();
  b += sizeof(uint32_t);
  for (auto &p : result) {
    *reinterpret_cast<uint32_t *>(b) = p.first.size();
    b += sizeof(uint32_t);
    *reinterpret_cast<uint32_t *>(b) = p.second.size();
    b += sizeof(uint32_t);
  }
  for (auto &p : result) {
    memcpy(b, p.first.data(), p.first.size());
    b += p.first.size();
    *b++ = 0;
    memcpy(b, p.second.data(), p.second.size());
    b += p.second.size();
    *b++ = 0;
  }
}

// ABI functions exported from host to wasm.

Word get_configuration(void *raw_context, Word address, Word size);
Word get_status(void *raw_context, Word status_code, Word address, Word size);
Word log(void *raw_context, Word level, Word address, Word size);
Word get_log_level(void *raw_context, Word result_level_uint32_ptr);
Word get_property(void *raw_context, Word path_ptr, Word path_size, Word value_ptr_ptr,
                  Word value_size_ptr);
Word set_property(void *raw_context, Word key_ptr, Word key_size, Word value_ptr, Word value_size);
Word continue_request(void *raw_context);
Word continue_response(void *raw_context);
Word continue_stream(void *raw_context, Word stream_type);
Word close_stream(void *raw_context, Word stream_type);
Word send_local_response(void *raw_context, Word response_code, Word response_code_details_ptr,
                         Word response_code_details_size, Word body_ptr, Word body_size,
                         Word additional_response_header_pairs_ptr,
                         Word additional_response_header_pairs_size, Word grpc_status);
Word clear_route_cache(void *raw_context);
Word get_shared_data(void *raw_context, Word key_ptr, Word key_size, Word value_ptr_ptr,
                     Word value_size_ptr, Word cas_ptr);
Word set_shared_data(void *raw_context, Word key_ptr, Word key_size, Word value_ptr,
                     Word value_size, Word cas);
Word register_shared_queue(void *raw_context, Word queue_name_ptr, Word queue_name_size,
                           Word token_ptr);
Word resolve_shared_queue(void *raw_context, Word vm_id_ptr, Word vm_id_size, Word queue_name_ptr,
                          Word queue_name_size, Word token_ptr);
Word dequeue_shared_queue(void *raw_context, Word token, Word data_ptr_ptr, Word data_size_ptr);
Word enqueue_shared_queue(void *raw_context, Word token, Word data_ptr, Word data_size);
Word get_buffer_bytes(void *raw_context, Word type, Word start, Word length, Word ptr_ptr,
                      Word size_ptr);
Word get_buffer_status(void *raw_context, Word type, Word length_ptr, Word flags_ptr);
Word set_buffer_bytes(void *raw_context, Word type, Word start, Word length, Word data_ptr,
                      Word data_size);
Word add_header_map_value(void *raw_context, Word type, Word key_ptr, Word key_size, Word value_ptr,
                          Word value_size);
Word get_header_map_value(void *raw_context, Word type, Word key_ptr, Word key_size,
                          Word value_ptr_ptr, Word value_size_ptr);
Word replace_header_map_value(void *raw_context, Word type, Word key_ptr, Word key_size,
                              Word value_ptr, Word value_size);
Word remove_header_map_value(void *raw_context, Word type, Word key_ptr, Word key_size);
Word get_header_map_pairs(void *raw_context, Word type, Word ptr_ptr, Word size_ptr);
Word set_header_map_pairs(void *raw_context, Word type, Word ptr, Word size);
Word get_header_map_size(void *raw_context, Word type, Word result_ptr);
Word getRequestBodyBufferBytes(void *raw_context, Word start, Word length, Word ptr_ptr,
                               Word size_ptr);
Word get_response_body_buffer_bytes(void *raw_context, Word start, Word length, Word ptr_ptr,
                                    Word size_ptr);
Word http_call(void *raw_context, Word uri_ptr, Word uri_size, Word header_pairs_ptr,
               Word header_pairs_size, Word body_ptr, Word body_size, Word trailer_pairs_ptr,
               Word trailer_pairs_size, Word timeout_milliseconds, Word token_ptr);
Word define_metric(void *raw_context, Word metric_type, Word name_ptr, Word name_size,
                   Word result_ptr);
Word increment_metric(void *raw_context, Word metric_id, int64_t offset);
Word record_metric(void *raw_context, Word metric_id, uint64_t value);
Word get_metric(void *raw_context, Word metric_id, Word result_uint64_ptr);
Word grpc_call(void *raw_context, Word service_ptr, Word service_size, Word service_name_ptr,
               Word service_name_size, Word method_name_ptr, Word method_name_size,
               Word initial_metadata_ptr, Word initial_metadata_size, Word request_ptr,
               Word request_size, Word timeout_milliseconds, Word token_ptr);
Word grpc_stream(void *raw_context, Word service_ptr, Word service_size, Word service_name_ptr,
                 Word service_name_size, Word method_name_ptr, Word method_name_size,
                 Word initial_metadata_ptr, Word initial_metadata_size, Word token_ptr);
Word grpc_cancel(void *raw_context, Word token);
Word grpc_close(void *raw_context, Word token);
Word grpc_send(void *raw_context, Word token, Word message_ptr, Word message_size, Word end_stream);

Word set_tick_period_milliseconds(void *raw_context, Word tick_period_milliseconds);
Word get_current_time_nanoseconds(void *raw_context, Word result_uint64_ptr);

Word set_effective_context(void *raw_context, Word context_id);
Word done(void *raw_context);
Word call_foreign_function(void *raw_context, Word function_name, Word function_name_size,
                           Word arguments, Word warguments_size, Word results, Word results_size);

// Runtime environment functions exported from envoy to wasm.

Word wasi_unstable_fd_write(void *raw_context, Word fd, Word iovs, Word iovs_len,
                            Word nwritten_ptr);
Word wasi_unstable_fd_read(void *, Word, Word, Word, Word);
Word wasi_unstable_fd_seek(void *, Word, int64_t, Word, Word);
Word wasi_unstable_fd_close(void *, Word);
Word wasi_unstable_fd_fdstat_get(void *, Word fd, Word statOut);
Word wasi_unstable_environ_get(void *, Word, Word);
Word wasi_unstable_environ_sizes_get(void *raw_context, Word count_ptr, Word buf_size_ptr);
Word wasi_unstable_args_get(void *raw_context, Word argc_ptr, Word argv_buf_size_ptr);
Word wasi_unstable_args_sizes_get(void *raw_context, Word argc_ptr, Word argv_buf_size_ptr);
void wasi_unstable_proc_exit(void *, Word);
Word wasi_unstable_clock_time_get(void *, Word, uint64_t, Word);
Word wasi_unstable_random_get(void *, Word, Word);
Word pthread_equal(void *, Word left, Word right);

// Support for embedders, not exported to Wasm.

// Any currently executing Wasm call context.
::proxy_wasm::ContextBase *ContextOrEffectiveContext(::proxy_wasm::ContextBase *context);

#define FOR_ALL_HOST_FUNCTIONS(_f)                                                                 \
  _f(log) _f(get_status) _f(set_property) _f(get_property) _f(send_local_response)                 \
      _f(get_shared_data) _f(set_shared_data) _f(register_shared_queue) _f(resolve_shared_queue)   \
          _f(dequeue_shared_queue) _f(enqueue_shared_queue) _f(get_header_map_value)               \
              _f(add_header_map_value) _f(replace_header_map_value) _f(remove_header_map_value)    \
                  _f(get_header_map_pairs) _f(set_header_map_pairs) _f(get_header_map_size)        \
                      _f(get_buffer_status) _f(get_buffer_bytes) _f(set_buffer_bytes)              \
                          _f(http_call) _f(grpc_call) _f(grpc_stream) _f(grpc_close)               \
                              _f(grpc_cancel) _f(grpc_send) _f(set_tick_period_milliseconds)       \
                                  _f(get_current_time_nanoseconds) _f(define_metric)               \
                                      _f(increment_metric) _f(record_metric) _f(get_metric)        \
                                          _f(set_effective_context) _f(done)                       \
                                              _f(call_foreign_function)

#define FOR_ALL_HOST_FUNCTIONS_ABI_SPECIFIC(_f)                                                    \
  _f(get_configuration) _f(continue_request) _f(continue_response) _f(clear_route_cache)           \
      _f(continue_stream) _f(close_stream) _f(get_log_level)

#define FOR_ALL_WASI_FUNCTIONS(_f)                                                                 \
  _f(fd_write) _f(fd_read) _f(fd_seek) _f(fd_close) _f(fd_fdstat_get) _f(environ_get)              \
      _f(environ_sizes_get) _f(args_get) _f(args_sizes_get) _f(clock_time_get) _f(random_get)      \
          _f(proc_exit)

// Helpers to generate a stub to pass to VM, in place of a restricted proxy-wasm capability.
#define _CREATE_PROXY_WASM_STUB(_fn)                                                               \
  template <typename F> struct _fn##Stub;                                                          \
  template <typename... Args> struct _fn##Stub<Word(void *, Args...)> {                            \
    static Word stub(void *raw_context, Args...) {                                                 \
      auto context = exports::ContextOrEffectiveContext(                                           \
          static_cast<ContextBase *>((void)raw_context, current_context_));                        \
      context->wasmVm()->integration()->error(                                                     \
          "Attempted call to restricted proxy-wasm capability: proxy_" #_fn);                      \
      return WasmResult::InternalFailure;                                                          \
    }                                                                                              \
  };
FOR_ALL_HOST_FUNCTIONS(_CREATE_PROXY_WASM_STUB)
FOR_ALL_HOST_FUNCTIONS_ABI_SPECIFIC(_CREATE_PROXY_WASM_STUB)
#undef _CREATE_PROXY_WASM_STUB

// Helpers to generate a stub to pass to VM, in place of a restricted WASI capability.
#define _CREATE_WASI_STUB(_fn)                                                                     \
  template <typename F> struct _fn##Stub;                                                          \
  template <typename... Args> struct _fn##Stub<Word(void *, Args...)> {                            \
    static Word stub(void *raw_context, Args...) {                                                 \
      auto context = exports::ContextOrEffectiveContext(                                           \
          static_cast<ContextBase *>((void)raw_context, current_context_));                        \
      context->wasmVm()->integration()->error(                                                     \
          "Attempted call to restricted WASI capability: " #_fn);                                  \
      return 76; /* __WASI_ENOTCAPABLE */                                                          \
    }                                                                                              \
  };                                                                                               \
  template <typename... Args> struct _fn##Stub<void(void *, Args...)> {                            \
    static void stub(void *raw_context, Args...) {                                                 \
      auto context = exports::ContextOrEffectiveContext(                                           \
          static_cast<ContextBase *>((void)raw_context, current_context_));                        \
      context->wasmVm()->integration()->error(                                                     \
          "Attempted call to restricted WASI capability: " #_fn);                                  \
    }                                                                                              \
  };
FOR_ALL_WASI_FUNCTIONS(_CREATE_WASI_STUB)
#undef _CREATE_WASI_STUB

} // namespace exports
} // namespace proxy_wasm
