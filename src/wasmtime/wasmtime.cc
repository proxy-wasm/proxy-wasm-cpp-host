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

#include <array>
#include <cassert>
#include <cstring>
#include <memory>
#include <optional>
#include <string>
#include <string_view>
#include <unordered_map>
#include <vector>

#include "include/proxy-wasm/wasm_vm.h"
#include "src/wasmtime/types.h"
#include "wasmtime/include/wasm.h"

namespace proxy_wasm {
namespace wasmtime {

struct HostFuncData {
  HostFuncData(std::string name) : name_(std::move(name)) {}

  std::string name_;
  WasmFuncPtr callback_;
  void *raw_func_;
  WasmVm *vm_;
};

using HostFuncDataPtr = std::unique_ptr<HostFuncData>;

wasm_engine_t *engine() {
  static const auto engine = WasmEnginePtr(wasm_engine_new());
  return engine.get();
}

class Wasmtime : public WasmVm {
public:
  Wasmtime() {}

  std::string_view runtime() override { return "wasmtime"; }
  Cloneable cloneable() override { return Cloneable::CompiledBytecode; }
  std::string_view getPrecompiledSectionName() override { return ""; }

  bool load(const std::string &code, bool allow_precompiled = false) override;
  AbiVersion getAbiVersion() override;
  std::string_view getCustomSection(std::string_view name) override;
  bool link(std::string_view debug_name) override;
  std::unique_ptr<WasmVm> clone() override;
  uint64_t getMemorySize() override;
  std::optional<std::string_view> getMemory(uint64_t pointer, uint64_t size) override;
  bool setMemory(uint64_t pointer, uint64_t size, const void *data) override;
  bool getWord(uint64_t pointer, Word *word) override;
  bool setWord(uint64_t pointer, Word word) override;

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
private:
  bool getStrippedSource(WasmByteVec *out);

  template <typename... Args>
  void registerHostFunctionImpl(std::string_view module_name, std::string_view function_name,
                                void (*function)(void *, Args...));

  template <typename R, typename... Args>
  void registerHostFunctionImpl(std::string_view module_name, std::string_view function_name,
                                R (*function)(void *, Args...));

  template <typename... Args>
  void getModuleFunctionImpl(std::string_view function_name,
                             std::function<void(ContextBase *, Args...)> *function);

  template <typename R, typename... Args>
  void getModuleFunctionImpl(std::string_view function_name,
                             std::function<R(ContextBase *, Args...)> *function);

  WasmByteVec source_;
  WasmStorePtr store_;
  WasmModulePtr module_;
  WasmSharedModulePtr shared_module_;
  WasmInstancePtr instance_;

  WasmMemoryPtr memory_;
  WasmTablePtr table_;

  std::unordered_map<std::string, HostFuncDataPtr> host_functions_;
  std::unordered_map<std::string, WasmFuncPtr> module_functions_;
};

// TODO(mathetake): move to proxy_wasm::common::*
static uint32_t parseVarint(const byte_t *&pos, const byte_t *end) {
  uint32_t n = 0;
  uint32_t shift = 0;
  byte_t b;
  do {
    if (pos + 1 > end) {
      abort();
    }
    b = *pos++;
    n += (b & 0x7f) << shift;
    shift += 7;
  } while ((b & 0x80) != 0);
  return n;
}

bool Wasmtime::load(const std::string &code, bool allow_precompiled) {
  store_ = wasm_store_new(engine());

  // Wasm file header is 8 bytes (magic number + version).
  static const uint8_t magic_number[4] = {0x00, 0x61, 0x73, 0x6d};
  if (code.size() < 8 || ::memcmp(code.data(), magic_number, 4) != 0) {
    return false;
  }

  wasm_byte_vec_new_uninitialized(source_.get(), code.size());
  ::memcpy(source_.get()->data, code.data(), code.size());

  WasmByteVec stripped;
  module_ =
      wasm_module_new(store_.get(), getStrippedSource(&stripped) ? stripped.get() : source_.get());

  if (module_) {
    shared_module_ = wasm_module_share(module_.get());
    assert(shared_module_ != nullptr);
  }

  return module_ != nullptr;
}

std::unique_ptr<WasmVm> Wasmtime::clone() {
  assert(shared_module_ != nullptr);
  auto clone = std::make_unique<Wasmtime>();

  clone->integration().reset(integration()->clone());
  clone->store_ = wasm_store_new(engine());
  clone->module_ = wasm_module_obtain(clone->store_.get(), shared_module_.get());
  return clone;
}

// TODO(mathetake): move to proxy_wasm::common::*
bool Wasmtime::getStrippedSource(WasmByteVec *out) {
  std::vector<byte_t> stripped;

  const byte_t *pos = source_.get()->data + 8 /* Wasm header */;
  const byte_t *end = source_.get()->data + source_.get()->size;
  while (pos < end) {
    const auto section_start = pos;
    if (pos + 1 > end) {
      return false;
    }
    const auto section_type = *pos++;
    const auto section_len = parseVarint(pos, end);
    if (section_len == static_cast<uint32_t>(-1) || pos + section_len > end) {
      return false;
    }
    if (section_type == 0 /* custom section */) {
      const auto section_data_start = pos;
      const auto section_name_len = parseVarint(pos, end);
      if (section_name_len == static_cast<uint32_t>(-1) || pos + section_name_len > end) {
        return false;
      }
      auto section_name = std::string_view(pos, section_name_len);
      if (section_name.find("precompiled_") != std::string::npos) {
        // If this is the first "precompiled_" section, then save everything
        // before it, otherwise skip it.
        if (stripped.empty()) {
          const byte_t *start = source_.get()->data;
          stripped.insert(stripped.end(), start, section_start);
        }
      }
      pos = section_data_start + section_len;
    } else {
      pos += section_len;
      // Save this section if we already saw a custom "precompiled_" section.
      if (!stripped.empty()) {
        stripped.insert(stripped.end(), section_start, pos /* section end */);
      }
    }
  }

  if (!stripped.empty()) {
    wasm_byte_vec_new_uninitialized(out->get(), stripped.size());
    ::memcpy(out->get()->data, stripped.data(), stripped.size());
    return true;
  }
  return false;
}

static bool equalValTypes(const wasm_valtype_vec_t *left, const wasm_valtype_vec_t *right) {
  if (left->size != right->size) {
    return false;
  }

  for (size_t i = 0; i < left->size; i++) {
    if (wasm_valtype_kind(left->data[i]) != wasm_valtype_kind(right->data[i])) {
      return false;
    }
  }

  return true;
}

static std::string printValue(const wasm_val_t &value) {
  switch (value.kind) {
  case WASM_I32:
    return std::to_string(value.of.i32);
  case WASM_I64:
    return std::to_string(value.of.i64);
  case WASM_F32:
    return std::to_string(value.of.f32);
  case WASM_F64:
    return std::to_string(value.of.f64);
  default:
    return "unknown";
  }
}

static std::string printValues(const wasm_val_t values[], size_t size) {
  if (size == 0) {
    return "";
  }

  std::string s;
  for (size_t i = 0; i < size; i++) {
    if (i) {
      s.append(", ");
    }
    s.append(printValue(values[i]));
  }
  return s;
}

static const char *printValKind(wasm_valkind_t kind) {
  switch (kind) {
  case WASM_I32:
    return "i32";
  case WASM_I64:
    return "i64";
  case WASM_F32:
    return "f32";
  case WASM_F64:
    return "f64";
  case WASM_ANYREF:
    return "anyref";
  case WASM_FUNCREF:
    return "funcref";
  default:
    return "unknown";
  }
}

static std::string printValTypes(const wasm_valtype_vec_t *types) {
  if (types->size == 0) {
    return "void";
  }

  std::string s;
  s.reserve(types->size * 8 /* max size + " " */ - 1);
  for (size_t i = 0; i < types->size; i++) {
    if (i) {
      s.append(" ");
    }
    s.append(printValKind(wasm_valtype_kind(types->data[i])));
  }
  return s;
}

bool Wasmtime::link(std::string_view debug_name) {
  assert(module_ != nullptr);

  WasmImporttypeVec import_types;
  wasm_module_imports(module_.get(), import_types.get());

  std::vector<const wasm_extern_t *> imports;
  for (size_t i = 0; i < import_types.get()->size; i++) {
    const wasm_name_t *module_name_ptr = wasm_importtype_module(import_types.get()->data[i]);
    const wasm_name_t *name_ptr = wasm_importtype_name(import_types.get()->data[i]);
    const wasm_externtype_t *extern_type = wasm_importtype_type(import_types.get()->data[i]);

    std::string_view module_name(module_name_ptr->data, module_name_ptr->size);
    std::string_view name(name_ptr->data, name_ptr->size);
    assert(name_ptr->size > 0);
    switch (wasm_externtype_kind(extern_type)) {
    case WASM_EXTERN_FUNC: {
      auto it = host_functions_.find(std::string(module_name) + "." + std::string(name));
      if (it == host_functions_.end()) {
        fail(FailState::UnableToInitializeCode,
             std::string("Failed to load Wasm module due to a missing import: ") +
                 std::string(module_name) + "." + std::string(name));
        break;
      }

      auto func = it->second->callback_.get();
      const wasm_functype_t *exp_type = wasm_externtype_as_functype_const(extern_type);
      WasmFunctypePtr actual_type = wasm_func_type(it->second->callback_.get());
      if (!equalValTypes(wasm_functype_params(exp_type), wasm_functype_params(actual_type.get())) ||
          !equalValTypes(wasm_functype_results(exp_type),
                         wasm_functype_results(actual_type.get()))) {
        fail(
            FailState::UnableToInitializeCode,
            std::string("Failed to load Wasm module due to an import type mismatch for function ") +
                std::string(module_name) + "." + std::string(name) +
                ", want: " + printValTypes(wasm_functype_params(exp_type)) + " -> " +
                printValTypes(wasm_functype_results(exp_type)) +
                ", but host exports: " + printValTypes(wasm_functype_params(actual_type.get())) +
                " -> " + printValTypes(wasm_functype_results(actual_type.get())));
        break;
      }
      imports.push_back(wasm_func_as_extern(func));
    } break;
    case WASM_EXTERN_GLOBAL: {
      // TODO(mathetake): add support when/if needed.
      fail(FailState::UnableToInitializeCode,
           "Failed to load Wasm module due to a missing import: " + std::string(module_name) + "." +
               std::string(name));
    } break;
    case WASM_EXTERN_MEMORY: {
      assert(memory_ == nullptr);
      const wasm_memorytype_t *memory_type =
          wasm_externtype_as_memorytype_const(extern_type); // owned by `extern_type`
      memory_ = wasm_memory_new(store_.get(), memory_type);
      imports.push_back(wasm_memory_as_extern(memory_.get()));
    } break;
    case WASM_EXTERN_TABLE: {
      assert(table_ == nullptr);
      const wasm_tabletype_t *table_type =
          wasm_externtype_as_tabletype_const(extern_type); // owned by `extern_type`
      table_ = wasm_table_new(store_.get(), table_type, nullptr);
      imports.push_back(wasm_table_as_extern(table_.get()));
    } break;
    }
  }

  if (import_types.get()->size != imports.size()) {
    return false;
  }

  instance_ = wasm_instance_new(store_.get(), module_.get(), imports.data(), nullptr);
  assert(instance_ != nullptr);

  WasmExportTypeVec export_types;
  wasm_module_exports(module_.get(), export_types.get());

  WasmExternVec exports;
  wasm_instance_exports(instance_.get(), exports.get());

  for (size_t i = 0; i < export_types.get()->size; i++) {
    const wasm_externtype_t *exp_extern_type = wasm_exporttype_type(export_types.get()->data[i]);
    wasm_extern_t *actual_extern = exports.get()->data[i];

    wasm_externkind_t kind = wasm_extern_kind(actual_extern);
    assert(kind == wasm_externtype_kind(exp_extern_type));
    switch (kind) {
    case WASM_EXTERN_FUNC: {
      WasmFuncPtr func = wasm_func_copy(wasm_extern_as_func(actual_extern));
      const wasm_name_t *name_ptr = wasm_exporttype_name(export_types.get()->data[i]);
      module_functions_.insert_or_assign(std::string(name_ptr->data, name_ptr->size),
                                         std::move(func));
    } break;
    case WASM_EXTERN_GLOBAL: {
      // TODO(mathetake): add support when/if needed.
    } break;
    case WASM_EXTERN_MEMORY: {
      assert(memory_ == nullptr);
      memory_ = wasm_memory_copy(wasm_extern_as_memory(actual_extern));
      assert(memory_ != nullptr);
    } break;
    case WASM_EXTERN_TABLE: {
      // TODO(mathetake): add support when/if needed.
    } break;
    }
  }
  return true;
}

std::string_view Wasmtime::getCustomSection(std::string_view name) {
  const byte_t *pos = source_.get()->data + 8 /* Wasm header */;
  const byte_t *end = source_.get()->data + source_.get()->size;
  while (pos < end) {
    if (pos + 1 > end) {
      fail(FailState::UnableToInitializeCode, "Failed to parse corrupted Wasm module");
      return "";
    }
    const auto section_type = *pos++;
    const auto section_len = parseVarint(pos, end);
    if (section_len == static_cast<uint32_t>(-1) || pos + section_len > end) {
      fail(FailState::UnableToInitializeCode, "Failed to parse corrupted Wasm module");
      return "";
    }

    if (section_type == 0 /* custom section */) {
      const auto section_data_start = pos;
      const auto section_name_len = parseVarint(pos, end);
      if (section_name_len == static_cast<uint32_t>(-1) || pos + section_name_len > end) {
        fail(FailState::UnableToInitializeCode, "Failed to parse corrupted Wasm module");
        return "";
      }
      if (section_name_len == name.size() && ::memcmp(pos, name.data(), section_name_len) == 0) {
        pos += section_name_len;
        return {pos, static_cast<size_t>(section_data_start + section_len - pos)};
      }
      pos = section_data_start + section_len;
    } else {
      pos += section_len;
    }
  }

  return "";
}

uint64_t Wasmtime::getMemorySize() { return wasm_memory_data_size(memory_.get()); }

std::optional<std::string_view> Wasmtime::getMemory(uint64_t pointer, uint64_t size) {
  assert(memory_ != nullptr);
  if (pointer + size > wasm_memory_data_size(memory_.get())) {
    return std::nullopt;
  }
  return std::string_view(wasm_memory_data(memory_.get()) + pointer, size);
}

bool Wasmtime::setMemory(uint64_t pointer, uint64_t size, const void *data) {
  assert(memory_ != nullptr);
  if (pointer + size > wasm_memory_data_size(memory_.get())) {
    return false;
  }
  ::memcpy(wasm_memory_data(memory_.get()) + pointer, data, size);
  return true;
}

bool Wasmtime::getWord(uint64_t pointer, Word *word) {
  assert(memory_ != nullptr);
  constexpr auto size = sizeof(uint32_t);
  if (pointer + size > wasm_memory_data_size(memory_.get())) {
    return false;
  }

  uint32_t word32;
  ::memcpy(&word32, wasm_memory_data(memory_.get()) + pointer, size);
  word->u64_ = word32;
  return true;
}

bool Wasmtime::setWord(uint64_t pointer, Word word) {
  constexpr auto size = sizeof(uint32_t);
  if (pointer + size > wasm_memory_data_size(memory_.get())) {
    return false;
  }
  uint32_t word32 = word.u32();
  ::memcpy(wasm_memory_data(memory_.get()) + pointer, &word32, size);
  return true;
}

template <typename T> void assignVal(T t, wasm_val_t &val);
template <> void assignVal<Word>(Word t, wasm_val_t &val) {
  val.kind = WASM_I32;
  val.of.i32 = static_cast<int32_t>(t.u64_);
}
template <> void assignVal(uint32_t t, wasm_val_t &val) {
  val.kind = WASM_I32;
  val.of.i32 = static_cast<int32_t>(t);
}
template <> void assignVal(uint64_t t, wasm_val_t &val) {
  val.kind = WASM_I64;
  val.of.i64 = static_cast<int64_t>(t);
}
template <> void assignVal(double t, wasm_val_t &val) {
  val.kind = WASM_F64;
  val.of.f64 = t;
}

template <typename T> wasm_val_t makeVal(T t) {
  wasm_val_t val{};
  assignVal(t, val);
  return val;
}

template <typename T> struct ConvertWordType {
  using type = T; // NOLINT(readability-identifier-naming)
};
template <> struct ConvertWordType<Word> {
  using type = uint32_t; // NOLINT(readability-identifier-naming)
};

template <typename T> auto convertArgToValTypePtr();
template <> auto convertArgToValTypePtr<Word>() { return wasm_valtype_new_i32(); };
template <> auto convertArgToValTypePtr<uint32_t>() { return wasm_valtype_new_i32(); };
template <> auto convertArgToValTypePtr<int64_t>() { return wasm_valtype_new_i64(); };
template <> auto convertArgToValTypePtr<uint64_t>() { return wasm_valtype_new_i64(); };
template <> auto convertArgToValTypePtr<double>() { return wasm_valtype_new_f64(); };

template <typename T> T convertValueTypeToArg(wasm_val_t val);
template <> uint32_t convertValueTypeToArg<uint32_t>(wasm_val_t val) {
  return static_cast<uint32_t>(val.of.i32);
}
template <> Word convertValueTypeToArg<Word>(wasm_val_t val) { return val.of.i32; }
template <> int64_t convertValueTypeToArg<int64_t>(wasm_val_t val) { return val.of.i64; }
template <> uint64_t convertValueTypeToArg<uint64_t>(wasm_val_t val) {
  return static_cast<uint64_t>(val.of.i64);
}
template <> double convertValueTypeToArg<double>(wasm_val_t val) { return val.of.f64; }

template <typename T, typename U, std::size_t... I>
constexpr T convertValTypesToArgsTupleImpl(const U &arr, std::index_sequence<I...>) {
  return std::make_tuple(
      convertValueTypeToArg<typename ConvertWordType<std::tuple_element_t<I, T>>::type>(arr[I])...);
}

template <typename T, typename U, typename Is = std::make_index_sequence<std::tuple_size<T>::value>>
constexpr T convertValTypesToArgsTuple(const U &arr) {
  return convertValTypesToArgsTupleImpl<T>(arr, Is());
}

template <typename T, std::size_t... I>
void convertArgsTupleToValTypesImpl(wasm_valtype_vec_t *types, std::index_sequence<I...>) {
  auto size = std::tuple_size<T>::value;
  auto ps = std::array<wasm_valtype_t *, std::tuple_size<T>::value>{
      convertArgToValTypePtr<typename std::tuple_element<I, T>::type>()...};
  wasm_valtype_vec_new(types, size, ps.data());
  for (auto i = ps.begin(); i < ps.end(); i++) { // TODO(mathetake): better way to handle?
    wasm_valtype_delete(*i);
  }
}

template <typename T, typename Is = std::make_index_sequence<std::tuple_size<T>::value>>
void convertArgsTupleToValTypes(wasm_valtype_vec_t *types) {
  convertArgsTupleToValTypesImpl<T>(types, Is());
}

template <typename R, typename T> WasmFunctypePtr newWasmNewFuncType() {
  WasmValtypeVec params, results;
  convertArgsTupleToValTypes<T>(params.get());
  convertArgsTupleToValTypes<std::tuple<R>>(results.get());
  return wasm_functype_new(params.get(), results.get());
}

template <typename T> WasmFunctypePtr newWasmNewFuncType() {
  WasmValtypeVec params, results;
  convertArgsTupleToValTypes<T>(params.get());
  convertArgsTupleToValTypes<std::tuple<>>(results.get());
  return wasm_functype_new(params.get(), results.get());
}

template <typename... Args>
void Wasmtime::registerHostFunctionImpl(std::string_view module_name,
                                        std::string_view function_name,
                                        void (*function)(void *, Args...)) {
  auto data =
      std::make_unique<HostFuncData>(std::string(module_name) + "." + std::string(function_name));

  WasmFunctypePtr type = newWasmNewFuncType<std::tuple<Args...>>();
  WasmFuncPtr func = wasm_func_new_with_env(
      store_.get(), type.get(),
      [](void *data, const wasm_val_t params[], wasm_val_t results[]) -> wasm_trap_t * {
        auto func_data = reinterpret_cast<HostFuncData *>(data);
        if (func_data->vm_->cmpLogLevel(LogLevel::trace)) {
          func_data->vm_->integration()->trace("[vm->host] " + func_data->name_ + "(" +
                                               printValues(params, sizeof...(Args)) + ")");
        }
        auto args_tuple = convertValTypesToArgsTuple<std::tuple<Args...>>(params);
        auto args = std::tuple_cat(std::make_tuple(current_context_), args_tuple);
        auto fn = reinterpret_cast<void (*)(void *, Args...)>(func_data->raw_func_);
        std::apply(fn, args);
        if (func_data->vm_->cmpLogLevel(LogLevel::trace)) {
          func_data->vm_->integration()->trace("[vm<-host] " + func_data->name_ + " return: void");
        }
        return nullptr;
      },
      data.get(), nullptr);

  data->vm_ = this;
  data->callback_ = std::move(func);
  data->raw_func_ = reinterpret_cast<void *>(function);
  host_functions_.insert_or_assign(std::string(module_name) + "." + std::string(function_name),
                                   std::move(data));
};

template <typename R, typename... Args>
void Wasmtime::registerHostFunctionImpl(std::string_view module_name,
                                        std::string_view function_name,
                                        R (*function)(void *, Args...)) {
  auto data =
      std::make_unique<HostFuncData>(std::string(module_name) + "." + std::string(function_name));
  WasmFunctypePtr type = newWasmNewFuncType<R, std::tuple<Args...>>();
  WasmFuncPtr func = wasm_func_new_with_env(
      store_.get(), type.get(),
      [](void *data, const wasm_val_t params[], wasm_val_t results[]) -> wasm_trap_t * {
        auto func_data = reinterpret_cast<HostFuncData *>(data);
        if (func_data->vm_->cmpLogLevel(LogLevel::trace)) {
          func_data->vm_->integration()->trace("[vm->host] " + func_data->name_ + "(" +
                                               printValues(params, sizeof...(Args)) + ")");
        }
        auto args_tuple = convertValTypesToArgsTuple<std::tuple<Args...>>(params);
        auto args = std::tuple_cat(std::make_tuple(current_context_), args_tuple);
        auto fn = reinterpret_cast<R (*)(void *, Args...)>(func_data->raw_func_);
        R res = std::apply(fn, args);
        assignVal<R>(res, results[0]);
        if (func_data->vm_->cmpLogLevel(LogLevel::trace)) {
          func_data->vm_->integration()->trace("[vm<-host] " + func_data->name_ +
                                               " return: " + std::to_string(res));
        }
        return nullptr;
      },
      data.get(), nullptr);

  data->vm_ = this;
  data->callback_ = std::move(func);
  data->raw_func_ = reinterpret_cast<void *>(function);
  host_functions_.insert_or_assign(std::string(module_name) + "." + std::string(function_name),
                                   std::move(data));
};

template <typename... Args>
void Wasmtime::getModuleFunctionImpl(std::string_view function_name,
                                     std::function<void(ContextBase *, Args...)> *function) {

  auto it = module_functions_.find(std::string(function_name));
  if (it == module_functions_.end()) {
    *function = nullptr;
    return;
  }

  WasmValtypeVec exp_args, exp_returns;
  convertArgsTupleToValTypes<std::tuple<Args...>>(exp_args.get());
  convertArgsTupleToValTypes<std::tuple<>>(exp_returns.get());
  wasm_func_t *func = it->second.get();
  WasmFunctypePtr func_type = wasm_func_type(func);

  if (!equalValTypes(wasm_functype_params(func_type.get()), exp_args.get()) ||
      !equalValTypes(wasm_functype_results(func_type.get()), exp_returns.get())) {
    fail(FailState::UnableToInitializeCode,
         "Bad function signature for: " + std::string(function_name) + ", want: " +
             printValTypes(exp_args.get()) + " -> " + printValTypes(exp_returns.get()) +
             ", but the module exports: " + printValTypes(wasm_functype_params(func_type.get())) +
             " -> " + printValTypes(wasm_functype_results(func_type.get())));
    return;
  }

  *function = [func, function_name, this](ContextBase *context, Args... args) -> void {
    wasm_val_t params[] = {makeVal(args)...};
    SaveRestoreContext saved_context(context);
    if (cmpLogLevel(LogLevel::trace)) {
      integration()->trace("[host->vm] " + std::string(function_name) + "(" +
                           printValues(params, sizeof...(Args)) + ")");
    }
    WasmTrapPtr trap{wasm_func_call(func, params, nullptr)};
    if (trap) {
      WasmByteVec error_message;
      wasm_trap_message(trap.get(), error_message.get());
      fail(FailState::RuntimeError,
           "Function: " + std::string(function_name) + " failed:\n" +
               std::string(error_message.get()->data, error_message.get()->size));
      return;
    }
    if (cmpLogLevel(LogLevel::trace)) {
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
  WasmValtypeVec exp_args, exp_returns;
  convertArgsTupleToValTypes<std::tuple<Args...>>(exp_args.get());
  convertArgsTupleToValTypes<std::tuple<R>>(exp_returns.get());
  wasm_func_t *func = it->second.get();
  WasmFunctypePtr func_type = wasm_func_type(func);
  if (!equalValTypes(wasm_functype_params(func_type.get()), exp_args.get()) ||
      !equalValTypes(wasm_functype_results(func_type.get()), exp_returns.get())) {
    fail(FailState::UnableToInitializeCode,
         "Bad function signature for: " + std::string(function_name) + ", want: " +
             printValTypes(exp_args.get()) + " -> " + printValTypes(exp_returns.get()) +
             ", but the module exports: " + printValTypes(wasm_functype_params(func_type.get())) +
             " -> " + printValTypes(wasm_functype_results(func_type.get())));
    return;
  }

  *function = [func, function_name, this](ContextBase *context, Args... args) -> R {
    wasm_val_t params[] = {makeVal(args)...};
    wasm_val_t results[1];
    SaveRestoreContext saved_context(context);
    if (cmpLogLevel(LogLevel::trace)) {
      integration()->trace("[host->vm] " + std::string(function_name) + "(" +
                           printValues(params, sizeof...(Args)) + ")");
    }
    WasmTrapPtr trap{wasm_func_call(func, params, results)};
    if (trap) {
      WasmByteVec error_message;
      wasm_trap_message(trap.get(), error_message.get());
      fail(FailState::RuntimeError,
           "Function: " + std::string(function_name) + " failed:\n" +
               std::string(error_message.get()->data, error_message.get()->size));
      return R{};
    }
    R ret = convertValueTypeToArg<R>(results[0]);
    if (cmpLogLevel(LogLevel::trace)) {
      integration()->trace("[host<-vm] " + std::string(function_name) +
                           " return: " + std::to_string(ret));
    }
    return ret;
  };
};

AbiVersion Wasmtime::getAbiVersion() {
  assert(module_ != nullptr);
  WasmExportTypeVec export_types;
  wasm_module_exports(module_.get(), export_types.get());

  for (size_t i = 0; i < export_types.get()->size; i++) {
    const wasm_externtype_t *exp_extern_type = wasm_exporttype_type(export_types.get()->data[i]);
    if (wasm_externtype_kind(exp_extern_type) == WASM_EXTERN_FUNC) {
      const wasm_name_t *name_ptr = wasm_exporttype_name(export_types.get()->data[i]);
      std::string_view name(name_ptr->data, name_ptr->size);
      if (name == "proxy_abi_version_0_1_0") {
        return AbiVersion::ProxyWasm_0_1_0;
      } else if (name == "proxy_abi_version_0_2_0") {
        return AbiVersion::ProxyWasm_0_2_0;
      } else if (name == "proxy_abi_version_0_2_1") {
        return AbiVersion::ProxyWasm_0_2_1;
      }
    }
  }
  return AbiVersion::Unknown;
}

} // namespace wasmtime

std::unique_ptr<WasmVm> createWasmtimeVm() { return std::make_unique<wasmtime::Wasmtime>(); }

} // namespace proxy_wasm
