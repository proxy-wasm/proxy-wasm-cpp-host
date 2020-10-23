
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

#include "include/proxy-wasm/wasmtime.h"
#include "include/proxy-wasm/wasm_vm.h"
#include "src/wasmtime/pointers.h"

#include <array>
#include <cassert>
#include <cstring>
#include <memory>
#include <optional>
#include <string>
#include <string_view>
#include <utility>
#include <vector>

#include "wasmtime/include/wasm.h"

namespace proxy_wasm {
namespace wasmtime {

struct FuncData {
  FuncData(std::string name) : name_(std::move(name)) {}

  std::string name_;
  WasmFuncPtr callback_;
  void *raw_func_;
};

using FuncDataPtr = std::unique_ptr<FuncData>;

wasm_engine_t *engine() {
  static const auto engine = WasmEnginePtr(wasm_engine_new());
  return engine.get();
}

class Wasmtime : public WasmVm {
public:
  Wasmtime(){};
  std::string_view runtime() override { return "wasmtime"; }
  Cloneable cloneable() override { return Cloneable::CompiledBytecode; }
  std::string_view getPrecompiledSectionName() { return ""; }

  bool load(const std::string &code, bool allow_precompiled = false) override;
  AbiVersion getAbiVersion() override;
  std::string_view getCustomSection(std::string_view name);
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

  std::string source_;
  WasmStorePtr store_;
  WasmModulePtr module_;
  WasmSharedModulePtr shared_module_;
  WasmInstancePtr instance_;

  WasmMemoryPtr memory_;
  WasmTablePtr table_;

  std::unordered_map<std::string, FuncDataPtr> host_functions_;
  std::unordered_map<std::string, WasmFuncPtr> module_functions_;
};

bool Wasmtime::load(const std::string &code, bool allow_precompiled) {
  source_ = code;
  store_ = WasmStorePtr(wasm_store_new(engine()));
  // Wasm file header is 8 bytes (magic number + version).
  static const uint8_t magic_number[4] = {0x00, 0x61, 0x73, 0x6d};
  if (source_.size() < 8 || ::memcmp(source_.data(), magic_number, 4) != 0) {
    return false;
  }

  wasm_byte_vec_t source_vec;
  wasm_byte_vec_new_uninitialized(&source_vec, source_.size());
  ::memcpy(source_vec.data, source_.data(), source_.size());

  wasm_module_t *module_ptr;
  assert(wasmtime_module_new(engine(), &source_vec, &module_ptr) == nullptr);
  shared_module_ = WasmSharedModulePtr{wasm_module_share(module_ptr)};
  module_ = WasmModulePtr{module_ptr};

  wasm_byte_vec_delete(&source_vec);
  assert(shared_module_ != nullptr);
  return module_ != nullptr;
}

std::unique_ptr<WasmVm> Wasmtime::clone() {
  assert(shared_module_ != nullptr);
  auto clone = std::make_unique<Wasmtime>();

  clone->integration().reset(integration()->clone());
  clone->store_ = WasmStorePtr{wasm_store_new(engine())};
  clone->module_ = wasm_module_obtain(clone->store_.get(), shared_module_.get());
  return clone;
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

  wasm_importtype_vec_t import_types;
  wasm_module_imports(module_.get(), &import_types);

  std::vector<const wasm_extern_t *> imports;
  for (size_t i = 0; i < import_types.size; i++) {
    // the followings are owned by `import_types` so no need to release by ourselves
    const wasm_name_t *module_name_ptr = wasm_importtype_module(import_types.data[i]);
    const wasm_name_t *name_ptr = wasm_importtype_name(import_types.data[i]);
    const wasm_externtype_t *extern_type = wasm_importtype_type(import_types.data[i]);

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

      const wasm_functype_t *exp_type =
          wasm_externtype_as_functype_const(extern_type); // this is owned by `import_types`
      const WasmFunctypePtr actual_type = wasm_func_type(it->second->callback_.get());
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
      auto a = wasm_func_as_extern(it->second->callback_.get());
      imports.push_back(a);
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
      memory_ = WasmMemoryPtr{wasm_memory_new(store_.get(), memory_type)};
      imports.push_back(wasm_memory_as_extern(memory_.get()));
    } break;
    case WASM_EXTERN_TABLE: {
      assert(table_ == nullptr);
      const wasm_tabletype_t *table_type =
          wasm_externtype_as_tabletype_const(extern_type); // owned by `extern_type`
      table_ = WasmTablePtr{wasm_table_new(store_.get(), table_type, nullptr)};
      imports.push_back(wasm_table_as_extern(table_.get()));
    } break;
    }
  }

  if (import_types.size != imports.size()) {
    return false;
  }

  instance_ = wasm_instance_new(store_.get(), module_.get(), imports.data(), nullptr);
  assert(instance_ != nullptr);

  wasm_exporttype_vec_t export_types;
  wasm_module_exports(module_.get(), &export_types);

  wasm_extern_vec_t exports;
  wasm_instance_exports(instance_.get(), &exports);
  assert(exports.size == export_types.size);

  for (size_t i = 0; i < export_types.size; i++) {
    const wasm_externtype_t *exp_extern_type = wasm_exporttype_type(export_types.data[i]);
    wasm_extern_t *actual_extern = exports.data[i];

    wasm_externkind_t kind = wasm_extern_kind(actual_extern);
    assert(kind == wasm_externtype_kind(exp_extern_type));
    switch (kind) {
    case WASM_EXTERN_FUNC: {
      wasm_func_t *func = wasm_extern_as_func(actual_extern);
      const wasm_name_t *name_ptr = wasm_exporttype_name(export_types.data[i]);
      module_functions_.insert_or_assign(std::string(name_ptr->data, name_ptr->size), func);
    } break;
    case WASM_EXTERN_GLOBAL: {
      // TODO(mathetake): add support when/if needed.
    } break;
    case WASM_EXTERN_MEMORY: {
      assert(memory_ == nullptr);
      memory_ = wasm_extern_as_memory(actual_extern);
      assert(memory_ != nullptr);
    } break;
    case WASM_EXTERN_TABLE: {
      // TODO(mathetake): add support when/if needed.
    } break;
    }
  }

  wasm_importtype_vec_delete(&import_types);
  wasm_exporttype_vec_delete(&export_types);
  // TODO(mathetake): there seems like a bug or a flaw in wasm-c-api documentation/implementation:
  // `wasm_extern_as_func` and `wasm_extern_as_memory` above take ownership of these arguments
  // which are originally from `exports`, and therefore delete &exports here would cause double
  // free() when instance exits. We need further investigation, or at least should consult wasmtime
  // folks.
  // wasm_extern_vec_delete(&exports);
  return true;
}

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

std::string_view Wasmtime::getCustomSection(std::string_view name) {
  const byte_t *pos = source_.data() + 8 /* Wasm header */;
  const byte_t *end = source_.data() + source_.size();
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

#define MEMORY_SIZE(memory) wasm_memory_data_size(memory.get())
#define MEMORY_DATA(memory) wasm_memory_data(memory.get())

uint64_t Wasmtime::getMemorySize() { return MEMORY_SIZE(memory_); }

std::optional<std::string_view> Wasmtime::getMemory(uint64_t pointer, uint64_t size) {
  assert(memory_ != nullptr);
  if (pointer + size > MEMORY_SIZE(memory_)) {
    return std::nullopt;
  }
  return std::string_view(MEMORY_DATA(memory_) + pointer, size);
}

bool Wasmtime::setMemory(uint64_t pointer, uint64_t size, const void *data) {
  assert(memory_ != nullptr);
  if (pointer + size > MEMORY_SIZE(memory_)) {
    return false;
  }
  ::memcpy(MEMORY_DATA(memory_) + pointer, data, size);
  return true;
}

bool Wasmtime::getWord(uint64_t pointer, Word *word) {
  assert(memory_ != nullptr);
  constexpr auto size = sizeof(uint32_t);
  if (pointer + size > MEMORY_SIZE(memory_)) {
    return false;
  }

  uint32_t word32;
  ::memcpy(&word32, MEMORY_DATA(memory_) + pointer, size);

  word->u64_ = word32;
  return true;
}

bool Wasmtime::setWord(uint64_t pointer, Word word) {
  constexpr auto size = sizeof(uint32_t);
  if (pointer + size > MEMORY_SIZE(memory_)) {
    return false;
  }
  uint32_t word32 = word.u32();
  ::memcpy(MEMORY_DATA(memory_) + pointer, &word32, size);
  return true;
}

#undef MEMORY_DATA
#undef MEMORY_SIZE

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
}

template <typename T, typename Is = std::make_index_sequence<std::tuple_size<T>::value>>
void convertArgsTupleToValTypes(wasm_valtype_vec_t *types) {
  convertArgsTupleToValTypesImpl<T>(types, Is());
}

template <typename R, typename T> WasmFunctypePtr newWasmNewFuncType() {
  wasm_valtype_vec_t params, results;
  convertArgsTupleToValTypes<T>(&params);
  convertArgsTupleToValTypes<std::tuple<R>>(&results);
  // wasm_functype_new takes the ownership of params and results
  return WasmFunctypePtr{wasm_functype_new(&params, &results)};
}

template <typename T> WasmFunctypePtr newWasmNewFuncType() {
  wasm_valtype_vec_t params, results;
  convertArgsTupleToValTypes<T>(&params);
  convertArgsTupleToValTypes<std::tuple<>>(&results);
  // wasm_functype_new takes the ownership of params and results
  return WasmFunctypePtr{wasm_functype_new(&params, &results)};
}

template <typename... Args>
void Wasmtime::registerHostFunctionImpl(std::string_view module_name,
                                        std::string_view function_name,
                                        void (*function)(void *, Args...)) {

  auto data =
      std::make_unique<FuncData>(std::string(module_name) + "." + std::string(function_name));

  WasmFunctypePtr type = newWasmNewFuncType<std::tuple<Args...>>();
  wasm_func_t *func = wasm_func_new_with_env(
      store_.get(), type.release(),
      [](void *data, const wasm_val_t params[], wasm_val_t results[]) -> wasm_trap_t * {
        auto func_data = reinterpret_cast<FuncData *>(data);
        auto args_tuple = convertValTypesToArgsTuple<std::tuple<Args...>>(params);
        auto args = std::tuple_cat(std::make_tuple(current_context_), args_tuple);
        auto fn = reinterpret_cast<void (*)(void *, Args...)>(func_data->raw_func_);
        std::apply(fn, args);
        return nullptr;
      },
      data.get(), nullptr);
  data->callback_ = WasmFuncPtr{func};
  data->raw_func_ = reinterpret_cast<void *>(function);
  host_functions_.insert_or_assign(std::string(module_name) + "." + std::string(function_name),
                                   std::move(data));
};

template <typename R, typename... Args>
void Wasmtime::registerHostFunctionImpl(std::string_view module_name,
                                        std::string_view function_name,
                                        R (*function)(void *, Args...)) {
  auto data =
      std::make_unique<FuncData>(std::string(module_name) + "." + std::string(function_name));
  WasmFunctypePtr type = newWasmNewFuncType<R, std::tuple<Args...>>();

  // wasm_func_new_with_env takes the ownership of `type`
  wasm_func_t *func = wasm_func_new_with_env(
      store_.get(), type.release(),
      [](void *data, const wasm_val_t params[], wasm_val_t results[]) -> wasm_trap_t * {
        auto func_data = reinterpret_cast<FuncData *>(data);
        auto args_tuple = convertValTypesToArgsTuple<std::tuple<Args...>>(params);
        auto args = std::tuple_cat(std::make_tuple(current_context_), args_tuple);
        auto fn = reinterpret_cast<R (*)(void *, Args...)>(func_data->raw_func_);
        R res = std::apply(fn, args);
        assignVal<R>(res, results[0]);
        return nullptr;
      },
      data.get(), nullptr);

  data->callback_ = WasmFuncPtr{func};
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

  wasm_valtype_vec_t exp_args, exp_returns;
  convertArgsTupleToValTypes<std::tuple<Args...>>(&exp_args);
  convertArgsTupleToValTypes<std::tuple<>>(&exp_returns);
  wasm_func_t *func = it->second.get();
  WasmFunctypePtr func_type = wasm_func_type(func);

  if (!equalValTypes(wasm_functype_params(func_type.get()), &exp_args) ||
      !equalValTypes(wasm_functype_results(func_type.get()), &exp_returns)) {
    fail(FailState::UnableToInitializeCode,
         "Bad function signature for: " + std::string(function_name) +
             ", want: " + printValTypes(&exp_args) + " -> " + printValTypes(&exp_returns) +
             ", but the module exports: " + printValTypes(wasm_functype_params(func_type.get())) +
             " -> " + printValTypes(wasm_functype_results(func_type.get())));
    return;
  }

  wasm_valtype_vec_delete(&exp_args);
  wasm_valtype_vec_delete(&exp_returns);

  *function = [func, function_name, this](ContextBase *context, Args... args) -> void {
    wasm_val_t params[] = {makeVal(args)...};
    SaveRestoreContext saved_context(context);
    WasmTrapPtr trap{wasm_func_call(func, params, nullptr)};
    if (trap) {
      wasm_byte_vec_t error_message;
      wasm_trap_message(trap.get(), &error_message);
      fail(FailState::RuntimeError, "Function: " + std::string(function_name) + " failed:\n" +
                                        std::string(error_message.data, error_message.size));
      wasm_byte_vec_delete(&error_message);
    }
  };
}; // namespace wasmtime

template <typename R, typename... Args>
void Wasmtime::getModuleFunctionImpl(std::string_view function_name,
                                     std::function<R(ContextBase *, Args...)> *function) {
  auto it = module_functions_.find(std::string(function_name));
  if (it == module_functions_.end()) {
    *function = nullptr;
    return;
  }
  wasm_valtype_vec_t exp_args, exp_returns;
  convertArgsTupleToValTypes<std::tuple<Args...>>(&exp_args);
  convertArgsTupleToValTypes<std::tuple<R>>(&exp_returns);
  wasm_func_t *func = it->second.get();
  WasmFunctypePtr func_type{wasm_func_type(func)};
  if (!equalValTypes(wasm_functype_params(func_type.get()), &exp_args) ||
      !equalValTypes(wasm_functype_results(func_type.get()), &exp_returns)) {
    fail(FailState::UnableToInitializeCode,
         "Bad function signature for: " + std::string(function_name) +
             ", want: " + printValTypes(&exp_args) + " -> " + printValTypes(&exp_returns) +
             ", but the module exports: " + printValTypes(wasm_functype_params(func_type.get())) +
             " -> " + printValTypes(wasm_functype_results(func_type.get())));
    return;
  }

  wasm_valtype_vec_delete(&exp_args);
  wasm_valtype_vec_delete(&exp_returns);

  *function = [func, function_name, this](ContextBase *context, Args... args) -> R {
    wasm_val_t params[] = {makeVal(args)...};
    wasm_val_t results[1];
    SaveRestoreContext saved_context(context);
    WasmTrapPtr trap{wasm_func_call(func, params, results)};
    if (trap) {
      wasm_byte_vec_t error_message;
      wasm_trap_message(trap.get(), &error_message);
      fail(FailState::RuntimeError, "Function: " + std::string(function_name) + " failed:\n" +
                                        std::string(error_message.data, error_message.size));
      wasm_byte_vec_delete(&error_message);
      return R{};
    }
    R ret = convertValueTypeToArg<R>(results[0]);
    return ret;
  };
};

AbiVersion Wasmtime::getAbiVersion() {
  assert(module_ != nullptr);
  wasm_exporttype_vec_t export_types;
  wasm_module_exports(module_.get(), &export_types);

  for (size_t i = 0; i < export_types.size; i++) {
    const wasm_externtype_t *exp_extern_type = wasm_exporttype_type(export_types.data[i]);
    if (wasm_externtype_kind(exp_extern_type) == WASM_EXTERN_FUNC) {
      const wasm_name_t *name_ptr = wasm_exporttype_name(export_types.data[i]);
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
  wasm_exporttype_vec_delete(&export_types);
  return AbiVersion::Unknown;
}

} // namespace wasmtime

std::unique_ptr<WasmVm> createWasmtimeVm() { return std::make_unique<wasmtime::Wasmtime>(); }

} // namespace proxy_wasm
