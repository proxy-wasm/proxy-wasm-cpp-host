
#include <memory>
#include <string>

#include "include/proxy-wasm/context.h"
#include "include/proxy-wasm/wasm.h"
#include "include/proxy-wasm/wasmtime.h"

#include "wasmtime/include/wasm.h"
#include "wasmtime/include/wasmtime.h"

#include "test/watdata.h"
#include "gtest/gtest.h"
#include <chrono>
#include <fstream>
#include <thread>

namespace proxy_wasm {
namespace {

struct DummyIntegration : public WasmVmIntegration {
  ~DummyIntegration() override{};
  WasmVmIntegration *clone() override { return new DummyIntegration{}; }
  void error(std::string_view message) override {
    std::cout << "ERROR from integration: " << message << std::endl;
    error_message_ = message;
  }
  bool getNullVmFunction(std::string_view function_name, bool returns_word, int number_of_arguments,
                         NullPlugin *plugin, void *ptr_to_function_return) override {
    return false;
  };
  std::string error_message_;
};

void callback(void *raw_context) {}
Word callback2(void *raw_context, Word val) { return val + 100; }

TEST(Wasmtime, CreateVM) {
  auto raw = wat_data::HelloGo;

  wasm_byte_vec_t wat;
  wasm_byte_vec_new_uninitialized(&wat, raw.size());
  ::memcpy(wat.data, raw.data(), raw.size());

  wasm_byte_vec_t source;
  wasmtime_error_t *error = wasmtime_wat2wasm(&wat, &source);
  EXPECT_TRUE(error == nullptr);
  auto binary = std::string(source.data, source.size);
  wasm_byte_vec_delete(&wat);
  wasm_byte_vec_delete(&source);

  WasmCallVoid<0> run;
  WasmCallWord<1> run2;

  for (int i = 0; i < 1000; i++) {
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
    auto vm = proxy_wasm::createWasmtimeVm();
    vm->integration().reset(new DummyIntegration{});
    vm->load(binary, false);

#define _REGISTER(_fn)                                                                             \
  vm->registerCallback("env", #_fn, &exports::_fn,                                                 \
                       &ConvertFunctionWordToUint32<decltype(exports::_fn),                        \
                                                    exports::_fn>::convertFunctionWordToUint32)
    _REGISTER(pthread_equal);
#undef _REGISTER

#define _REGISTER_WASI(_fn)                                                                        \
  vm->registerCallback(                                                                            \
      "wasi_unstable", #_fn, &exports::wasi_unstable_##_fn,                                        \
      &ConvertFunctionWordToUint32<decltype(exports::wasi_unstable_##_fn),                         \
                                   exports::wasi_unstable_##_fn>::convertFunctionWordToUint32);    \
  vm->registerCallback(                                                                            \
      "wasi_snapshot_preview1", #_fn, &exports::wasi_unstable_##_fn,                               \
      &ConvertFunctionWordToUint32<decltype(exports::wasi_unstable_##_fn),                         \
                                   exports::wasi_unstable_##_fn>::convertFunctionWordToUint32)
    _REGISTER_WASI(fd_write);
#undef _REGISTER_WASI

// Calls with the "proxy_" prefix.
#define _REGISTER_PROXY(_fn)                                                                       \
  vm->registerCallback("env", "proxy_" #_fn, &exports::_fn,                                        \
                       &ConvertFunctionWordToUint32<decltype(exports::_fn),                        \
                                                    exports::_fn>::convertFunctionWordToUint32);
    _REGISTER_PROXY(log);
    _REGISTER_PROXY(get_header_map_pairs);
    _REGISTER_PROXY(set_effective_context);
#undef _REGISTER_PROXY

    vm->link("");

    WasmCallWord<1> malloc_;

    // Calls into the VM.
    WasmCallWord<2> validate_configuration_;
    WasmCallWord<2> on_vm_start_;
    WasmCallWord<2> on_configure_;
    WasmCallVoid<1> on_tick_;

    WasmCallVoid<2> on_context_create_;

    WasmCallWord<1> on_new_connection_;
    WasmCallWord<3> on_downstream_data_;
    WasmCallWord<3> on_upstream_data_;
    WasmCallVoid<2> on_downstream_connection_close_;
    WasmCallVoid<2> on_upstream_connection_close_;

    WasmCallWord<2> on_request_headers_abi_01_;
    WasmCallWord<3> on_request_headers_abi_02_;
    WasmCallWord<3> on_request_body_;
    WasmCallWord<2> on_request_trailers_;
    WasmCallWord<2> on_request_metadata_;

    WasmCallWord<2> on_response_headers_abi_01_;
    WasmCallWord<3> on_response_headers_abi_02_;
    WasmCallWord<3> on_response_body_;
    WasmCallWord<2> on_response_trailers_;
    WasmCallWord<2> on_response_metadata_;

    WasmCallVoid<5> on_http_call_response_;

    WasmCallVoid<3> on_grpc_receive_;
    WasmCallVoid<3> on_grpc_close_;
    WasmCallVoid<3> on_grpc_create_initial_metadata_;
    WasmCallVoid<3> on_grpc_receive_initial_metadata_;
    WasmCallVoid<3> on_grpc_receive_trailing_metadata_;

    WasmCallVoid<2> on_queue_ready_;
    WasmCallVoid<3> on_foreign_function_;

    WasmCallWord<1> on_done_;
    WasmCallVoid<1> on_log_;
    WasmCallVoid<1> on_delete_;

#define _GET_PROXY(_fn) vm->getFunction("proxy_" #_fn, &_fn##_);
#define _GET_PROXY_ABI(_fn, _abi) vm->getFunction("proxy_" #_fn, &_fn##_abi##_);
    _GET_PROXY(validate_configuration);
    _GET_PROXY(on_vm_start);
    _GET_PROXY(on_configure);
    _GET_PROXY(on_tick);

    _GET_PROXY(on_context_create);

    _GET_PROXY(on_new_connection);
    _GET_PROXY(on_downstream_data);
    _GET_PROXY(on_upstream_data);
    _GET_PROXY(on_downstream_connection_close);
    _GET_PROXY(on_upstream_connection_close);

    _GET_PROXY(on_request_body);
    _GET_PROXY(on_request_trailers);
    _GET_PROXY(on_request_metadata);
    _GET_PROXY(on_response_body);
    _GET_PROXY(on_response_trailers);
    _GET_PROXY(on_response_metadata);
    _GET_PROXY(on_http_call_response);
    _GET_PROXY(on_grpc_receive);
    _GET_PROXY(on_grpc_close);
    _GET_PROXY(on_grpc_receive_initial_metadata);
    _GET_PROXY(on_grpc_receive_trailing_metadata);
    _GET_PROXY(on_queue_ready);
    _GET_PROXY(on_done);
    _GET_PROXY(on_log);
    _GET_PROXY(on_delete);

    if (vm->getAbiVersion() == AbiVersion::ProxyWasm_0_1_0) {
      _GET_PROXY_ABI(on_request_headers, _abi_01);
      _GET_PROXY_ABI(on_response_headers, _abi_01);
    } else if (vm->getAbiVersion() == AbiVersion::ProxyWasm_0_2_0 ||
               vm->getAbiVersion() == AbiVersion::ProxyWasm_0_2_1) {
      _GET_PROXY_ABI(on_request_headers, _abi_02);
      _GET_PROXY_ABI(on_response_headers, _abi_02);
      _GET_PROXY(on_foreign_function);
    }
#undef _GET_PROXY_ABI
#undef _GET_PROXY
  }
}

} // namespace
} // namespace proxy_wasm
