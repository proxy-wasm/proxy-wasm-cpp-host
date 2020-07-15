// Copyright 2020 Envoy Project Authors
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
//
#include "include/proxy-wasm/wasm.h"

#define WASM_CONTEXT(_c)                                                                           \
  (ContextOrEffectiveContext(static_cast<ContextBase *>((void)_c, current_context_)))

namespace proxy_wasm {

// The id of the context which should be used for calls out of the VM in place
// of current_context_.
extern thread_local uint32_t effective_context_id_;

namespace exports {

ContextBase *ContextOrEffectiveContext(ContextBase *context) {
  if (effective_context_id_ == 0) {
    return context;
  }
  auto effective_context = context->wasm()->getContext(effective_context_id_);
  if (effective_context) {
    return effective_context;
  }
  // The effective_context_id_ no longer exists, revert to the true context.
  return context;
}

namespace {

Pairs toPairs(string_view buffer) {
  Pairs result;
  const char *b = buffer.data();
  if (buffer.size() < sizeof(uint32_t)) {
    return {};
  }
  auto size = *reinterpret_cast<const uint32_t *>(b);
  b += sizeof(uint32_t);
  if (sizeof(uint32_t) + size * 2 * sizeof(uint32_t) > buffer.size()) {
    return {};
  }
  result.resize(size);
  for (uint32_t i = 0; i < size; i++) {
    result[i].first = string_view(nullptr, *reinterpret_cast<const uint32_t *>(b));
    b += sizeof(uint32_t);
    result[i].second = string_view(nullptr, *reinterpret_cast<const uint32_t *>(b));
    b += sizeof(uint32_t);
  }
  for (auto &p : result) {
    p.first = string_view(b, p.first.size());
    b += p.first.size() + 1;
    p.second = string_view(b, p.second.size());
    b += p.second.size() + 1;
  }
  return result;
}

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

template <typename Pairs>
bool getPairs(ContextBase *context, const Pairs &result, uint64_t ptr_ptr, uint64_t size_ptr) {
  if (result.empty()) {
    return context->wasm()->copyToPointerSize("", ptr_ptr, size_ptr);
  }
  uint64_t size = pairsSize(result);
  uint64_t ptr;
  char *buffer = static_cast<char *>(context->wasm()->allocMemory(size, &ptr));
  marshalPairs(result, buffer);
  if (!context->wasmVm()->setWord(ptr_ptr, Word(ptr))) {
    return false;
  }
  if (!context->wasmVm()->setWord(size_ptr, Word(size))) {
    return false;
  }
  return true;
}

} // namespace

// General ABI.

Word set_property(void *raw_context, Word key_ptr, Word key_size, Word value_ptr, Word value_size) {
  auto context = WASM_CONTEXT(raw_context);
  auto key = context->wasmVm()->getMemory(key_ptr, key_size);
  auto value = context->wasmVm()->getMemory(value_ptr, value_size);
  if (!key || !value) {
    return WasmResult::InvalidMemoryAccess;
  }
  return context->setProperty(key.value(), value.value());
}

// Generic selector
Word get_property(void *raw_context, Word path_ptr, Word path_size, Word value_ptr_ptr,
                  Word value_size_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  auto path = context->wasmVm()->getMemory(path_ptr, path_size);
  if (!path.has_value()) {
    return WasmResult::InvalidMemoryAccess;
  }
  std::string value;
  auto result = context->getProperty(path.value(), &value);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->copyToPointerSize(value, value_ptr_ptr, value_size_ptr)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word get_status(void *raw_context, Word code_ptr, Word value_ptr_ptr, Word value_size_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  auto status = context->getStatus();
  if (!context->wasm()->setDatatype(code_ptr, status.first)) {
    return WasmResult::InvalidMemoryAccess;
  }
  if (!context->wasm()->copyToPointerSize(status.second, value_ptr_ptr, value_size_ptr)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

// HTTP

// Continue/Reply/Route
Word continue_stream(void *raw_context, Word type) {
  auto context = WASM_CONTEXT(raw_context);
  if (type > static_cast<uint64_t>(WasmStreamType::MAX)) {
    return WasmResult::BadArgument;
  }
  return context->continueStream(static_cast<WasmStreamType>(type.u64_));
}

Word close_stream(void *raw_context, Word type) {
  auto context = WASM_CONTEXT(raw_context);
  if (type > static_cast<uint64_t>(WasmStreamType::MAX)) {
    return WasmResult::BadArgument;
  }
  return context->closeStream(static_cast<WasmStreamType>(type.u64_));
}

Word send_local_response(void *raw_context, Word response_code, Word response_code_details_ptr,
                         Word response_code_details_size, Word body_ptr, Word body_size,
                         Word additional_response_header_pairs_ptr,
                         Word additional_response_header_pairs_size, Word grpc_code) {
  auto context = WASM_CONTEXT(raw_context);
  auto details =
      context->wasmVm()->getMemory(response_code_details_ptr, response_code_details_size);
  auto body = context->wasmVm()->getMemory(body_ptr, body_size);
  auto additional_response_header_pairs = context->wasmVm()->getMemory(
      additional_response_header_pairs_ptr, additional_response_header_pairs_size);
  if (!details || !body || !additional_response_header_pairs) {
    return WasmResult::InvalidMemoryAccess;
  }
  auto additional_headers = toPairs(additional_response_header_pairs.value());
  context->sendLocalResponse(response_code, body.value(), std::move(additional_headers), grpc_code,
                             details.value());
  return WasmResult::Ok;
}

Word set_effective_context(void *raw_context, Word context_id) {
  auto context = WASM_CONTEXT(raw_context);
  uint32_t cid = static_cast<uint32_t>(context_id);
  auto c = context->wasm()->getContext(cid);
  if (!c) {
    return WasmResult::BadArgument;
  }
  effective_context_id_ = cid;
  return WasmResult::Ok;
}

Word done(void *raw_context) {
  auto context = WASM_CONTEXT(raw_context);
  return context->wasm()->done(context);
}

Word call_foreign_function(void *raw_context, Word function_name, Word function_name_size,
                           Word arguments, Word arguments_size, Word results, Word results_size) {
  auto context = WASM_CONTEXT(raw_context);
  auto function = context->wasmVm()->getMemory(function_name, function_name_size);
  if (!function) {
    return WasmResult::InvalidMemoryAccess;
  }
  auto args_opt = context->wasmVm()->getMemory(arguments, arguments_size);
  if (!args_opt) {
    return WasmResult::InvalidMemoryAccess;
  }
  auto f = context->wasm()->getForeignFunction(function.value());
  if (!f) {
    return WasmResult::NotFound;
  }
  auto &wasm = *context->wasm();
  auto &args = args_opt.value();
  uint64_t address = 0;
  void *result = nullptr;
  size_t result_size = 0;
  auto res = f(wasm, args, [&wasm, &address, &result, &result_size, results](size_t s) -> void * {
    if (results) {
      result = wasm.allocMemory(s, &address);
    } else {
      // If the caller does not want the results, allocate a temporary buffer for them.
      result = ::malloc(s);
    }
    result_size = s;
    return result;
  });
  if (results && !context->wasmVm()->setWord(results, Word(address))) {
    return WasmResult::InvalidMemoryAccess;
  }
  if (results_size && !context->wasmVm()->setWord(results_size, Word(result_size))) {
    return WasmResult::InvalidMemoryAccess;
  }
  if (!results) {
    ::free(result);
  }
  return res;
}

// SharedData
Word get_shared_data(void *raw_context, Word key_ptr, Word key_size, Word value_ptr_ptr,
                     Word value_size_ptr, Word cas_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  auto key = context->wasmVm()->getMemory(key_ptr, key_size);
  if (!key) {
    return WasmResult::InvalidMemoryAccess;
  }
  std::pair<std::string, uint32_t> data;
  WasmResult result = context->getSharedData(key.value(), &data);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->copyToPointerSize(data.first, value_ptr_ptr, value_size_ptr)) {
    return WasmResult::InvalidMemoryAccess;
  }
  if (!context->wasmVm()->setMemory(cas_ptr, sizeof(uint32_t), &data.second)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word set_shared_data(void *raw_context, Word key_ptr, Word key_size, Word value_ptr,
                     Word value_size, Word cas) {
  auto context = WASM_CONTEXT(raw_context);
  auto key = context->wasmVm()->getMemory(key_ptr, key_size);
  auto value = context->wasmVm()->getMemory(value_ptr, value_size);
  if (!key || !value) {
    return WasmResult::InvalidMemoryAccess;
  }
  return context->setSharedData(key.value(), value.value(), cas);
}

Word register_shared_queue(void *raw_context, Word queue_name_ptr, Word queue_name_size,
                           Word token_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  auto queue_name = context->wasmVm()->getMemory(queue_name_ptr, queue_name_size);
  if (!queue_name) {
    return WasmResult::InvalidMemoryAccess;
  }
  uint32_t token;
  auto result = context->registerSharedQueue(queue_name.value(), &token);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->setDatatype(token_ptr, token)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word dequeue_shared_queue(void *raw_context, Word token, Word data_ptr_ptr, Word data_size_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  std::string data;
  WasmResult result = context->dequeueSharedQueue(token.u32(), &data);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->copyToPointerSize(data, data_ptr_ptr, data_size_ptr)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word resolve_shared_queue(void *raw_context, Word vm_id_ptr, Word vm_id_size, Word queue_name_ptr,
                          Word queue_name_size, Word token_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  auto vm_id = context->wasmVm()->getMemory(vm_id_ptr, vm_id_size);
  auto queue_name = context->wasmVm()->getMemory(queue_name_ptr, queue_name_size);
  if (!vm_id || !queue_name) {
    return WasmResult::InvalidMemoryAccess;
  }
  uint32_t token = 0;
  auto result = context->lookupSharedQueue(vm_id.value(), queue_name.value(), &token);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->setDatatype(token_ptr, token)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word enqueue_shared_queue(void *raw_context, Word token, Word data_ptr, Word data_size) {
  auto context = WASM_CONTEXT(raw_context);
  auto data = context->wasmVm()->getMemory(data_ptr, data_size);
  if (!data) {
    return WasmResult::InvalidMemoryAccess;
  }
  return context->enqueueSharedQueue(token.u32(), data.value());
}

// Header/Trailer/Metadata Maps
Word add_header_map_value(void *raw_context, Word type, Word key_ptr, Word key_size, Word value_ptr,
                          Word value_size) {
  if (type > static_cast<uint64_t>(WasmHeaderMapType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto key = context->wasmVm()->getMemory(key_ptr, key_size);
  auto value = context->wasmVm()->getMemory(value_ptr, value_size);
  if (!key || !value) {
    return WasmResult::InvalidMemoryAccess;
  }
  context->addHeaderMapValue(static_cast<WasmHeaderMapType>(type.u64_), key.value(), value.value());
  return WasmResult::Ok;
}

Word get_header_map_value(void *raw_context, Word type, Word key_ptr, Word key_size,
                          Word value_ptr_ptr, Word value_size_ptr) {
  if (type > static_cast<uint64_t>(WasmHeaderMapType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto key = context->wasmVm()->getMemory(key_ptr, key_size);
  if (!key) {
    return WasmResult::InvalidMemoryAccess;
  }
  string_view value;
  auto result =
      context->getHeaderMapValue(static_cast<WasmHeaderMapType>(type.u64_), key.value(), &value);
  if (result != WasmResult::Ok) {
    return result;
  }
  context->wasm()->copyToPointerSize(value, value_ptr_ptr, value_size_ptr);
  return WasmResult::Ok;
}

Word replace_header_map_value(void *raw_context, Word type, Word key_ptr, Word key_size,
                              Word value_ptr, Word value_size) {
  if (type > static_cast<uint64_t>(WasmHeaderMapType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto key = context->wasmVm()->getMemory(key_ptr, key_size);
  auto value = context->wasmVm()->getMemory(value_ptr, value_size);
  if (!key || !value) {
    return WasmResult::InvalidMemoryAccess;
  }
  context->replaceHeaderMapValue(static_cast<WasmHeaderMapType>(type.u64_), key.value(),
                                 value.value());
  return WasmResult::Ok;
}

Word remove_header_map_value(void *raw_context, Word type, Word key_ptr, Word key_size) {
  if (type > static_cast<uint64_t>(WasmHeaderMapType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto key = context->wasmVm()->getMemory(key_ptr, key_size);
  if (!key) {
    return WasmResult::InvalidMemoryAccess;
  }
  context->removeHeaderMapValue(static_cast<WasmHeaderMapType>(type.u64_), key.value());
  return WasmResult::Ok;
}

Word get_header_map_pairs(void *raw_context, Word type, Word ptr_ptr, Word size_ptr) {
  if (type > static_cast<uint64_t>(WasmHeaderMapType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  Pairs pairs;
  auto result = context->getHeaderMapPairs(static_cast<WasmHeaderMapType>(type.u64_), &pairs);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!getPairs(context, pairs, ptr_ptr, size_ptr)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word set_header_map_pairs(void *raw_context, Word type, Word ptr, Word size) {
  if (type > static_cast<uint64_t>(WasmHeaderMapType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto data = context->wasmVm()->getMemory(ptr, size);
  if (!data) {
    return WasmResult::InvalidMemoryAccess;
  }
  context->setHeaderMapPairs(static_cast<WasmHeaderMapType>(type.u64_), toPairs(data.value()));
  return WasmResult::Ok;
}

Word get_header_map_size(void *raw_context, Word type, Word result_ptr) {
  if (type > static_cast<uint64_t>(WasmHeaderMapType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  uint32_t size;
  auto result = context->getHeaderMapSize(static_cast<WasmHeaderMapType>(type.u64_), &size);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasmVm()->setWord(result_ptr, Word(size))) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

// Buffer
Word get_buffer_bytes(void *raw_context, Word type, Word start, Word length, Word ptr_ptr,
                      Word size_ptr) {
  if (type > static_cast<uint64_t>(WasmBufferType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto buffer = context->getBuffer(static_cast<WasmBufferType>(type.u64_));
  if (!buffer) {
    return WasmResult::NotFound;
  }
  // check for overflow.
  if (buffer->size() < start + length || start > start + length) {
    return WasmResult::BadArgument;
  }
  if (length > 0) {
    return buffer->copyTo(context->wasm(), start, length, ptr_ptr, size_ptr);
  }
  return WasmResult::Ok;
}

Word get_buffer_status(void *raw_context, Word type, Word length_ptr, Word flags_ptr) {
  if (type > static_cast<uint64_t>(WasmBufferType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto buffer = context->getBuffer(static_cast<WasmBufferType>(type.u64_));
  if (!buffer) {
    return WasmResult::NotFound;
  }
  auto length = buffer->size();
  uint32_t flags = 0;
  if (!context->wasmVm()->setWord(length_ptr, Word(length))) {
    return WasmResult::InvalidMemoryAccess;
  }
  if (!context->wasm()->setDatatype(flags_ptr, flags)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word set_buffer_bytes(void *raw_context, Word type, Word start, Word length, Word data_ptr,
                      Word data_size) {
  if (type > static_cast<uint64_t>(WasmBufferType::MAX)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto buffer = context->getBuffer(static_cast<WasmBufferType>(type.u64_));
  if (!buffer) {
    return WasmResult::NotFound;
  }
  auto data = context->wasmVm()->getMemory(data_ptr, data_size);
  if (!data) {
    return WasmResult::InvalidMemoryAccess;
  }
  return buffer->copyFrom(start, length, data.value());
}

Word http_call(void *raw_context, Word uri_ptr, Word uri_size, Word header_pairs_ptr,
               Word header_pairs_size, Word body_ptr, Word body_size, Word trailer_pairs_ptr,
               Word trailer_pairs_size, Word timeout_milliseconds, Word token_ptr) {
  auto context = WASM_CONTEXT(raw_context)->root_context();
  auto uri = context->wasmVm()->getMemory(uri_ptr, uri_size);
  auto body = context->wasmVm()->getMemory(body_ptr, body_size);
  auto header_pairs = context->wasmVm()->getMemory(header_pairs_ptr, header_pairs_size);
  auto trailer_pairs = context->wasmVm()->getMemory(trailer_pairs_ptr, trailer_pairs_size);
  if (!uri || !body || !header_pairs || !trailer_pairs) {
    return WasmResult::InvalidMemoryAccess;
  }
  auto headers = toPairs(header_pairs.value());
  auto trailers = toPairs(trailer_pairs.value());
  uint32_t token = 0;
  // NB: try to write the token to verify the memory before starting the async
  // operation.
  if (!context->wasm()->setDatatype(token_ptr, token)) {
    return WasmResult::InvalidMemoryAccess;
  }
  auto result =
      context->httpCall(uri.value(), headers, body.value(), trailers, timeout_milliseconds, &token);
  context->wasm()->setDatatype(token_ptr, token);
  return result;
}

Word define_metric(void *raw_context, Word metric_type, Word name_ptr, Word name_size,
                   Word metric_id_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  auto name = context->wasmVm()->getMemory(name_ptr, name_size);
  if (!name) {
    return WasmResult::InvalidMemoryAccess;
  }
  uint32_t metric_id = 0;
  auto result =
      context->defineMetric(static_cast<uint32_t>(metric_type.u64_), name.value(), &metric_id);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->setDatatype(metric_id_ptr, metric_id)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word increment_metric(void *raw_context, Word metric_id, int64_t offset) {
  auto context = WASM_CONTEXT(raw_context);
  return context->incrementMetric(metric_id, offset);
}

Word record_metric(void *raw_context, Word metric_id, uint64_t value) {
  auto context = WASM_CONTEXT(raw_context);
  return context->recordMetric(metric_id, value);
}

Word get_metric(void *raw_context, Word metric_id, Word result_uint64_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  uint64_t value = 0;
  auto result = context->getMetric(metric_id, &value);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->setDatatype(result_uint64_ptr, value)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word grpc_call(void *raw_context, Word service_ptr, Word service_size, Word service_name_ptr,
               Word service_name_size, Word method_name_ptr, Word method_name_size,
               Word initial_metadata_ptr, Word initial_metadata_size, Word request_ptr,
               Word request_size, Word timeout_milliseconds, Word token_ptr) {
  auto context = WASM_CONTEXT(raw_context)->root_context();
  auto service = context->wasmVm()->getMemory(service_ptr, service_size);
  auto service_name = context->wasmVm()->getMemory(service_name_ptr, service_name_size);
  auto method_name = context->wasmVm()->getMemory(method_name_ptr, method_name_size);
  auto initial_metadata_pairs =
      context->wasmVm()->getMemory(initial_metadata_ptr, initial_metadata_size);
  auto request = context->wasmVm()->getMemory(request_ptr, request_size);
  if (!service || !service_name || !method_name || !initial_metadata_pairs || !request) {
    return WasmResult::InvalidMemoryAccess;
  }
  uint32_t token = 0;
  auto initial_metadata = toPairs(initial_metadata_pairs.value());
  auto result = context->grpcCall(service.value(), service_name.value(), method_name.value(),
                                  initial_metadata, request.value(),
                                  std::chrono::milliseconds(timeout_milliseconds), &token);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->setDatatype(token_ptr, token)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word grpc_stream(void *raw_context, Word service_ptr, Word service_size, Word service_name_ptr,
                 Word service_name_size, Word method_name_ptr, Word method_name_size,
                 Word initial_metadata_ptr, Word initial_metadata_size, Word token_ptr) {
  auto context = WASM_CONTEXT(raw_context)->root_context();
  auto service = context->wasmVm()->getMemory(service_ptr, service_size);
  auto service_name = context->wasmVm()->getMemory(service_name_ptr, service_name_size);
  auto method_name = context->wasmVm()->getMemory(method_name_ptr, method_name_size);
  auto initial_metadata_pairs =
      context->wasmVm()->getMemory(initial_metadata_ptr, initial_metadata_size);
  if (!service || !service_name || !method_name || !initial_metadata_pairs) {
    return WasmResult::InvalidMemoryAccess;
  }
  uint32_t token = 0;
  auto initial_metadata = toPairs(initial_metadata_pairs.value());
  auto result = context->grpcStream(service.value(), service_name.value(), method_name.value(),
                                    initial_metadata, &token);
  if (result != WasmResult::Ok) {
    return result;
  }
  if (!context->wasm()->setDatatype(token_ptr, token)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word grpc_cancel(void *raw_context, Word token) {
  auto context = WASM_CONTEXT(raw_context)->root_context();
  return context->grpcCancel(token);
}

Word grpc_close(void *raw_context, Word token) {
  auto context = WASM_CONTEXT(raw_context)->root_context();
  return context->grpcClose(token);
}

Word grpc_send(void *raw_context, Word token, Word message_ptr, Word message_size,
               Word end_stream) {
  auto context = WASM_CONTEXT(raw_context)->root_context();
  auto message = context->wasmVm()->getMemory(message_ptr, message_size);
  if (!message) {
    return WasmResult::InvalidMemoryAccess;
  }
  return context->grpcSend(token, message.value(), end_stream);
}

// Implementation of writev-like() syscall that redirects stdout/stderr to Envoy
// logs.
Word writevImpl(void *raw_context, Word fd, Word iovs, Word iovs_len, Word *nwritten_ptr) {
  auto context = WASM_CONTEXT(raw_context);

  // Read syscall args.
  uint64_t log_level;
  switch (fd) {
  case 1 /* stdout */:
    log_level = 2; // LogLevel::info
    break;
  case 2 /* stderr */:
    log_level = 4; // LogLevel::error
    break;
  default:
    return 8; // __WASI_EBADF
  }

  std::string s;
  for (size_t i = 0; i < iovs_len; i++) {
    auto memslice =
        context->wasmVm()->getMemory(iovs + i * 2 * sizeof(uint32_t), 2 * sizeof(uint32_t));
    if (!memslice) {
      return 21; // __WASI_EFAULT
    }
    const uint32_t *iovec = reinterpret_cast<const uint32_t *>(memslice.value().data());
    if (iovec[1] /* buf_len */) {
      memslice = context->wasmVm()->getMemory(iovec[0] /* buf */, iovec[1] /* buf_len */);
      if (!memslice) {
        return 21; // __WASI_EFAULT
      }
      s.append(memslice.value().data(), memslice.value().size());
    }
  }

  size_t written = s.size();
  if (written) {
    // Remove trailing newline from the logs, if any.
    if (s[written - 1] == '\n') {
      s.erase(written - 1);
    }
    if (context->log(log_level, s) != WasmResult::Ok) {
      return 8; // __WASI_EBADF
    }
  }
  *nwritten_ptr = Word(written);
  return 0; // __WASI_ESUCCESS
}

// __wasi_errno_t __wasi_fd_write(_wasi_fd_t fd, const _wasi_ciovec_t *iov,
// size_t iovs_len, size_t* nwritten);
Word wasi_unstable_fd_write(void *raw_context, Word fd, Word iovs, Word iovs_len,
                            Word nwritten_ptr) {
  auto context = WASM_CONTEXT(raw_context);

  Word nwritten(0);
  auto result = writevImpl(raw_context, fd, iovs, iovs_len, &nwritten);
  if (result != 0) { // __WASI_ESUCCESS
    return result;
  }
  if (!context->wasmVm()->setWord(nwritten_ptr, Word(nwritten))) {
    return 21; // __WASI_EFAULT
  }
  return 0; // __WASI_ESUCCESS
}

// __wasi_errno_t __wasi_fd_read(_wasi_fd_t fd, const __wasi_iovec_t *iovs,
//    size_t iovs_len, __wasi_size_t *nread);
Word wasi_unstable_fd_read(void *, Word, Word, Word, Word) {
  // Don't support reading of any files.
  return 52; // __WASI_ERRNO_ENOSYS
}

// __wasi_errno_t __wasi_fd_seek(__wasi_fd_t fd, __wasi_filedelta_t offset,
// __wasi_whence_t whence,__wasi_filesize_t *newoffset);
Word wasi_unstable_fd_seek(void *raw_context, Word, int64_t, Word, Word) {
  auto context = WASM_CONTEXT(raw_context);
  context->error("wasi_unstable fd_seek");
  return 0;
}

// __wasi_errno_t __wasi_fd_close(__wasi_fd_t fd);
Word wasi_unstable_fd_close(void *raw_context, Word) {
  auto context = WASM_CONTEXT(raw_context);
  context->error("wasi_unstable fd_close");
  return 0;
}

// __wasi_errno_t __wasi_fd_fdstat_get(__wasi_fd_t fd, __wasi_fdstat_t *stat)
Word wasi_unstable_fd_fdstat_get(void *raw_context, Word fd, Word statOut) {
  // We will only support this interface on stdout and stderr
  if (fd != 1 && fd != 2) {
    return 8; // __WASI_EBADF;
  }

  // The last word points to a 24-byte structure, which we
  // are mostly going to zero out.
  uint64_t wasi_fdstat[3];
  wasi_fdstat[0] = 0;
  wasi_fdstat[1] = 64; // This sets "fs_rights_base" to __WASI_RIGHTS_FD_WRITE
  wasi_fdstat[2] = 0;

  auto context = WASM_CONTEXT(raw_context);
  context->wasmVm()->setMemory(statOut, 3 * sizeof(uint64_t), &wasi_fdstat);

  return 0; // __WASI_ESUCCESS
}

// __wasi_errno_t __wasi_environ_get(char **environ, char *environ_buf);
Word wasi_unstable_environ_get(void *, Word, Word) {
  return 0; // __WASI_ESUCCESS
}

// __wasi_errno_t __wasi_environ_sizes_get(size_t *environ_count, size_t
// *environ_buf_size);
Word wasi_unstable_environ_sizes_get(void *raw_context, Word count_ptr, Word buf_size_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  if (!context->wasmVm()->setWord(count_ptr, Word(0))) {
    return 21; // __WASI_EFAULT
  }
  if (!context->wasmVm()->setWord(buf_size_ptr, Word(0))) {
    return 21; // __WASI_EFAULT
  }
  return 0; // __WASI_ESUCCESS
}

// __wasi_errno_t __wasi_args_get(size_t **argv, size_t *argv_buf);
Word wasi_unstable_args_get(void *, Word, Word) {
  return 0; // __WASI_ESUCCESS
}

// __wasi_errno_t __wasi_args_sizes_get(size_t *argc, size_t *argv_buf_size);
Word wasi_unstable_args_sizes_get(void *raw_context, Word argc_ptr, Word argv_buf_size_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  if (!context->wasmVm()->setWord(argc_ptr, Word(0))) {
    return 21; // __WASI_EFAULT
  }
  if (!context->wasmVm()->setWord(argv_buf_size_ptr, Word(0))) {
    return 21; // __WASI_EFAULT
  }
  return 0; // __WASI_ESUCCESS
}

// void __wasi_proc_exit(__wasi_exitcode_t rval);
void wasi_unstable_proc_exit(void *raw_context, Word) {
  auto context = WASM_CONTEXT(raw_context);
  context->error("wasi_unstable proc_exit");
}

Word pthread_equal(void *, Word left, Word right) { return left == right; }

Word set_tick_period_milliseconds(void *raw_context, Word period_milliseconds) {
  TimerToken token = 0;
  return WASM_CONTEXT(raw_context)
      ->setTimerPeriod(std::chrono::milliseconds(period_milliseconds), &token);
}

Word get_current_time_nanoseconds(void *raw_context, Word result_uint64_ptr) {
  auto context = WASM_CONTEXT(raw_context);
  uint64_t result = context->getCurrentTimeNanoseconds();
  if (!context->wasm()->setDatatype(result_uint64_ptr, result)) {
    return WasmResult::InvalidMemoryAccess;
  }
  return WasmResult::Ok;
}

Word log(void *raw_context, Word level, Word address, Word size) {
  if (level > static_cast<uint64_t>(LogLevel::Max)) {
    return WasmResult::BadArgument;
  }
  auto context = WASM_CONTEXT(raw_context);
  auto message = context->wasmVm()->getMemory(address, size);
  if (!message) {
    return WasmResult::InvalidMemoryAccess;
  }
  return context->log(level, message.value());
}

} // namespace exports
} // namespace proxy_wasm
