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

#include "include/proxy-wasm/wasmtime.h"

#include <cassert>
#include <cstring>
#include <limits>
#include <memory>
#include <optional>
#include <string>
#include <string_view>
#include <unordered_map>
#include <variant>

#include "include/proxy-wasm/limits.h"

#include "crates/c-api/include/wasmtime.hh" // IWYU pragma: keep

namespace wasmtime::detail {
// Defines how wasmtime serializes proxy_wasm::Word.
template <> struct WasmType<proxy_wasm::Word> {
  static const bool valid = true;
  static const ValKind kind = ValKind::I32;
  static void store(Store::Context cx, wasmtime_val_raw_t *p, const proxy_wasm::Word &t) {
    p->i32 = t;
  }
  static proxy_wasm::Word load(Store::Context cx, wasmtime_val_raw_t *p) { return p->i32; }
};
} // namespace wasmtime::detail

namespace proxy_wasm {
namespace wasmtime {
namespace {

using ::wasmtime::Config;
using ::wasmtime::Engine;
using ::wasmtime::ExportType;
using ::wasmtime::Extern;
using ::wasmtime::Instance;
using ::wasmtime::Linker;
using ::wasmtime::Memory;
using ::wasmtime::Module;
using ::wasmtime::Result;
using ::wasmtime::Span;
using ::wasmtime::Store;
using ::wasmtime::Table;
using ::wasmtime::TrapResult;

} // namespace

static Engine *engine() {
  static auto *const engine = []() {
    Config config;
    config.epoch_interruption(true);
    return new Engine(std::move(config));
  }();
  return engine;
}

class Wasmtime : public WasmVm {
public:
  Wasmtime() : linker_(*engine()){};

  std::string_view getEngineName() override { return "wasmtime"; }
  Cloneable cloneable() override { return Cloneable::CompiledBytecode; }
  std::string_view getPrecompiledSectionName() override { return ""; }

  bool load(std::string_view bytecode, std::string_view precompiled,
            const std::unordered_map<uint32_t, std::string> &function_names) override;
  bool link(std::string_view debug_name) override;
  std::unique_ptr<WasmVm> clone() override;
  uint64_t getMemorySize() override;
  std::optional<std::string_view> getMemory(uint64_t pointer, uint64_t size) override;
  bool setMemory(uint64_t pointer, uint64_t size, const void *data) override;
  bool getWord(uint64_t pointer, Word *word) override;
  bool setWord(uint64_t pointer, Word word) override;
  size_t getWordSize() override { return sizeof(uint32_t); };

#define _REGISTER_HOST_FUNCTION(T)                                                                 \
  void registerCallback(std::string_view module_name, std::string_view function_name, T,           \
                        typename ConvertFunctionTypeWordToUint32<T>::type f) override {            \
    registerHostFunctionImpl(module_name, function_name, f);                                       \
  };
  FOR_ALL_WASM_VM_IMPORTS(_REGISTER_HOST_FUNCTION)
#undef _REGISTER_HOST_FUNCTION

#define _GET_MODULE_FUNCTION(T)                                                                    \
  void getFunction(std::string_view function_name, T *f) override {                                \
    getModuleFunctionImpl(function_name, f);                                                       \
  };
  FOR_ALL_WASM_VM_EXPORTS(_GET_MODULE_FUNCTION)
#undef _GET_MODULE_FUNCTION

  void warm() override;

  void terminate() override { engine()->increment_epoch(); }

  bool usesWasmByteOrder() override { return true; }

private:
  template <typename... Args>
  void registerHostFunctionImpl(std::string_view module_name, std::string_view function_name,
                                void (*function)(Args...));

  template <typename R, typename... Args>
  void registerHostFunctionImpl(std::string_view module_name, std::string_view function_name,
                                R (*function)(Args...));

  template <typename... Args>
  void getModuleFunctionImpl(std::string_view function_name,
                             std::function<void(ContextBase *, Args...)> *function);

  template <typename R, typename... Args>
  void getModuleFunctionImpl(std::string_view function_name,
                             std::function<R(ContextBase *, Args...)> *function);

  // Initialize the Wasmtime store if necessary.
  void initStore();

  std::optional<Store> store_;
  std::optional<Module> module_;
  std::optional<Instance> instance_;
  std::optional<Memory> memory_;
  std::optional<Table> table_;
  Linker linker_;

  std::unordered_map<std::string, ::wasmtime::Func> module_functions_;
};

void Wasmtime::initStore() {
  if (store_.has_value()) {
    return;
  }
  store_.emplace(*engine());
  store_->limiter(PROXY_WASM_HOST_MAX_WASM_MEMORY_SIZE_BYTES,
                  /*table_elements=*/std::numeric_limits<int64_t>::max(),
                  /*instances=*/std::numeric_limits<int64_t>::max(),
                  /*tables=*/std::numeric_limits<int64_t>::max(),
                  /*memories=*/std::numeric_limits<int64_t>::max());
}

bool Wasmtime::load(std::string_view bytecode, std::string_view /*precompiled*/,
                    const std::unordered_map<uint32_t, std::string> & /*function_names*/) {
  initStore();
  if (!store_.has_value()) {
    return false;
  }

  Result<Module> module =
      Module::compile(*engine(), std::span((uint8_t *)bytecode.data(), bytecode.size()));
  if (!module) {
    fail(FailState::UnableToInitializeCode, "Failed to load Wasm code: " + module.err().message());
    return false;
  }
  module_.emplace(module.ok());

  return true;
}

std::unique_ptr<WasmVm> Wasmtime::clone() {
  auto clone = std::make_unique<Wasmtime>();
  if (clone == nullptr) {
    return nullptr;
  }

  clone->store_.emplace(Store(*engine()));
  if (!clone->store_.has_value()) {
    return nullptr;
  }

  clone->module_.emplace(*module_);
  if (!clone->module_.has_value()) {
    return nullptr;
  }

  auto *integration_clone = integration()->clone();
  if (integration_clone == nullptr) {
    return nullptr;
  }
  clone->integration().reset(integration_clone);

  return clone;
}
template <typename T> static std::string printValue(const T &value) {
  return std::to_string(value);
}
template <> std::string printValue(const proxy_wasm::Word &value) {
  return std::to_string(value.u64_);
}

static std::string printValues() { return ""; }
template <typename Arg, typename... Args> static std::string printValues(Arg arg, Args... args) {
  return printValue(arg) + ((", " + printValue(args)) + ... + "");
}

bool Wasmtime::link(std::string_view /*debug_name*/) {
  assert(module_.has_value());

  TrapResult<Instance> instance = linker_.instantiate(store_->context(), *module_);
  if (!instance) {
    fail(FailState::UnableToInitializeCode,
         "Failed to create new Wasm instance: " + instance.err().message());
    return false;
  }
  instance_.emplace(instance.ok());

  ExportType::List export_types = module_->exports();
  for (ExportType::Ref export_type : export_types) {
    std::optional<Extern> actual_extern = instance_->get(store_->context(), export_type.name());
    if (!actual_extern.has_value()) {
      continue;
    }
    if (std::holds_alternative<::wasmtime::Func>(*actual_extern)) {
      module_functions_.insert_or_assign(std::string(export_type.name()),
                                         std::get<::wasmtime::Func>(*actual_extern));
    } else if (std::holds_alternative<Memory>(*actual_extern)) {
      assert(!memory_.has_value());
      memory_.emplace(std::get<Memory>(*actual_extern));
    }
    // TODO: add support for globals and tables and when/if needed.
  }
  return true;
}

uint64_t Wasmtime::getMemorySize() {
  return memory_->size(store_->context()) * PROXY_WASM_HOST_WASM_MEMORY_PAGE_SIZE_BYTES;
}

std::optional<std::string_view> Wasmtime::getMemory(uint64_t pointer, uint64_t size) {
  assert(store_.has_value());
  assert(memory_.has_value());
  ::wasmtime::Span<uint8_t> data = memory_->data(store_->context());
  if (pointer + size > data.size()) {
    return std::nullopt;
  }
  return std::string_view((char *)(data.data() + pointer), size);
}

bool Wasmtime::setMemory(uint64_t pointer, uint64_t size, const void *data) {
  assert(store_.has_value());
  assert(memory_.has_value());
  ::wasmtime::Span<uint8_t> memory = memory_->data(store_->context());
  if (pointer + size > memory.size()) {
    return false;
  }
  ::memcpy(memory.data() + pointer, data, size);
  return true;
}

bool Wasmtime::getWord(uint64_t pointer, Word *word) {
  assert(store_.has_value());
  assert(memory_.has_value());
  ::wasmtime::Span<uint8_t> memory = memory_->data(store_->context());
  constexpr auto size = sizeof(uint32_t);
  if (pointer + size > memory.size()) {
    return false;
  }

  uint32_t word32;
  ::memcpy(&word32, memory.data() + pointer, size);
  word->u64_ = wasmtoh(word32, true);
  return true;
}

bool Wasmtime::setWord(uint64_t pointer, Word word) {
  assert(store_.has_value());
  assert(memory_.has_value());
  ::wasmtime::Span<uint8_t> memory = memory_->data(store_->context());
  constexpr auto size = sizeof(uint32_t);
  if (pointer + size > memory.size()) {
    return false;
  }
  uint32_t word32 = htowasm(word.u32(), true);
  ::memcpy(memory.data() + pointer, &word32, size);
  return true;
}

template <typename... Args>
void Wasmtime::registerHostFunctionImpl(std::string_view module_name,
                                        std::string_view function_name, void (*function)(Args...)) {
  Result<std::monostate> result = linker_.func_wrap(
      module_name, function_name,
      [this, function,
       function_name = std::string(module_name) + "." + std::string(function_name)](Args... args) {
        const bool log = cmpLogLevel(LogLevel::trace);
        if (log) {
          integration()->trace("[vm->host] " + function_name + "(" + printValues(args...) + ")");
        }
        function(std::forward<Args>(args)...);
        if (log) {
          integration()->trace("[vm<-host] " + function_name + " return: void");
        }
      });
  if (!result) {
    fail(FailState::ConfigureFailed, "Failed to register host function: " + result.err().message());
  }
};

template <typename R, typename... Args>
void Wasmtime::registerHostFunctionImpl(std::string_view module_name,
                                        std::string_view function_name, R (*function)(Args...)) {
  Result<std::monostate> result = linker_.func_wrap(
      module_name, function_name,
      [this, function,
       function_name = std::string(module_name) + "." + std::string(function_name)](Args... args) {
        const bool log = cmpLogLevel(LogLevel::trace);
        if (log) {
          integration()->trace("[vm->host] " + function_name + "(" + printValues(args...) + ")");
        }
        R result = function(std::forward<Args>(args)...);
        if (log) {
          integration()->trace("[vm<-host] " + function_name + " return: " + printValue(result));
        }
        return result;
      });
  if (!result) {
    fail(FailState::ConfigureFailed, "Failed to register host function: " + result.err().message());
  }
};

template <typename... Args>
void Wasmtime::getModuleFunctionImpl(std::string_view function_name,
                                     std::function<void(ContextBase *, Args...)> *function) {
  auto it = module_functions_.find(std::string(function_name));
  if (it == module_functions_.end()) {
    *function = nullptr;
    return;
  }
  auto typed_func = it->second.typed<std::tuple<Args...>, std::monostate>(store_->context());
  if (!typed_func) {
    *function = nullptr;
    return;
  }
  *function = [func = typed_func.ok(), function_name, this](ContextBase *context,
                                                            Args... args) -> void {
    const bool log = cmpLogLevel(LogLevel::trace);
    SaveRestoreContext saved_context(context);
    if (log) {
      integration()->trace("[host->vm] " + std::string(function_name) + "(" + printValues(args...) +
                           ")");
    }
    store_->context().set_epoch_deadline(1);
    TrapResult<std::monostate> result = func.call(store_->context(), {args...});
    if (!result) {
      fail(FailState::RuntimeError,
           "Function: " + std::string(function_name) + " failed: " + result.err().message());
    }
    if (log) {
      integration()->trace("[host<-vm] " + std::string(function_name) + " return: void");
    }
  };
};

template <typename R, typename... Args>
void Wasmtime::getModuleFunctionImpl(std::string_view function_name,
                                     std::function<R(ContextBase *, Args...)> *function) {
  auto it = module_functions_.find(std::string(function_name));
  if (it == module_functions_.end()) {
    *function = nullptr;
    return;
  }
  auto typed_func = it->second.typed<std::tuple<Args...>, R>(store_->context());
  if (!typed_func) {
    *function = nullptr;
    return;
  }
  *function = [func = typed_func.ok(), function_name, this](ContextBase *context,
                                                            Args... args) -> R {
    const bool log = cmpLogLevel(LogLevel::trace);
    SaveRestoreContext saved_context(context);
    store_->context().set_epoch_deadline(1);
    if (log) {
      integration()->trace("[host->vm] " + std::string(function_name) + "(" + printValues(args...) +
                           ")");
    }
    TrapResult<R> result = func.call(store_->context(), {args...});
    if (!result) {
      fail(FailState::RuntimeError,
           "Function: " + std::string(function_name) + " failed: " + result.err().message());
      return R{};
    }
    if (log) {
      integration()->trace("[host<-vm] " + std::string(function_name) +
                           " return: " + printValue(result.unwrap()));
    }
    return result.ok();
  };
};

void Wasmtime::warm() { initStore(); }

} // namespace wasmtime

std::unique_ptr<WasmVm> createWasmtimeVm() { return std::make_unique<wasmtime::Wasmtime>(); }

} // namespace proxy_wasm
