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

#include "include/proxy-wasm/wavm.h"
#include "include/proxy-wasm/wasm_vm.h"

#include <cstdlib>
#include <iostream>
#include <map>
#include <memory>
#include <optional>
#include <unordered_map>
#include <utility>
#include <vector>

#include "WAVM/IR/Module.h"
#include "WAVM/IR/Operators.h"
#include "WAVM/IR/Types.h"
#include "WAVM/IR/Validate.h"
#include "WAVM/IR/Value.h"
#include "WAVM/Inline/Assert.h"
#include "WAVM/Inline/BasicTypes.h"
#include "WAVM/Inline/Errors.h"
#include "WAVM/Inline/Hash.h"
#include "WAVM/Inline/HashMap.h"
#include "WAVM/Inline/IndexMap.h"
#include "WAVM/Inline/IntrusiveSharedPtr.h"
#include "WAVM/Platform/Mutex.h"
#include "WAVM/Platform/Thread.h"
#include "WAVM/Runtime/Intrinsics.h"
#include "WAVM/Runtime/Linker.h"
#include "WAVM/Runtime/Runtime.h"
#include "WAVM/WASM/WASM.h"
#include "WAVM/WASTParse/WASTParse.h"

#ifdef NDEBUG
#define ASSERT(_x) _x
#else
#define ASSERT(_x)                                                                                 \
  do {                                                                                             \
    if (!_x)                                                                                       \
      ::exit(1);                                                                                   \
  } while (0)
#endif

using namespace WAVM;
using namespace WAVM::IR;

namespace WAVM {
namespace IR {
template <> constexpr ValueType inferValueType<proxy_wasm::Word>() { return ValueType::i32; }
} // namespace IR
} // namespace WAVM

namespace proxy_wasm {

// Forward declarations.
template <typename R, typename... Args>
void getFunctionWavm(WasmVm *vm, std::string_view function_name,
                     std::function<R(ContextBase *, Args...)> *function);
template <typename R, typename... Args>
void registerCallbackWavm(WasmVm *vm, std::string_view module_name, std::string_view function_name,
                          R (*)(Args...));
template <typename F, typename R, typename... Args>
void registerCallbackWavm(WasmVm *vm, std::string_view module_name, std::string_view function_name,
                          F, R (*)(Args...));

namespace Wavm {

struct Wavm;

namespace {

#define CALL_WITH_CONTEXT(_x, _context, _wavm)                                                     \
  do {                                                                                             \
    try {                                                                                          \
      SaveRestoreContext _saved_context(static_cast<ContextBase *>(_context));                     \
      WAVM::Runtime::catchRuntimeExceptions(                                                       \
          [&] { _x; },                                                                             \
          [&](WAVM::Runtime::Exception *exception) {                                               \
            auto description = describeException(exception);                                       \
            _wavm->fail(FailState::RuntimeError,                                                   \
                        "Function: " + std::string(function_name) + " failed: " + description);    \
            destroyException(exception);                                                           \
            throw std::exception();                                                                \
          });                                                                                      \
    } catch (...) {                                                                                \
    }                                                                                              \
  } while (0)

struct WasmUntaggedValue : public WAVM::IR::UntaggedValue {
  WasmUntaggedValue() = default;
  WasmUntaggedValue(I32 inI32) { i32 = inI32; }
  WasmUntaggedValue(I64 inI64) { i64 = inI64; }
  WasmUntaggedValue(U32 inU32) { u32 = inU32; }
  WasmUntaggedValue(Word w) { u32 = static_cast<U32>(w.u64_); }
  WasmUntaggedValue(U64 inU64) { u64 = inU64; }
  WasmUntaggedValue(F32 inF32) { f32 = inF32; }
  WasmUntaggedValue(F64 inF64) { f64 = inF64; }
};

class RootResolver : public WAVM::Runtime::Resolver {
public:
  RootResolver(WAVM::Runtime::Compartment *, WasmVm *vm) : vm_(vm) {}

  virtual ~RootResolver() { module_name_to_instance_map_.clear(); }

  bool resolve(const std::string &module_name, const std::string &export_name, ExternType type,
               WAVM::Runtime::Object *&out_object) override {
    auto named_instance = module_name_to_instance_map_.get(module_name);
    if (named_instance) {
      out_object = getInstanceExport(*named_instance, export_name);
      if (out_object) {
        if (isA(out_object, type)) {
          return true;
        } else {
          vm_->fail(FailState::UnableToInitializeCode,
                    "Failed to load WASM module due to a type mismatch in an import: " +
                        std::string(module_name) + "." + export_name + " " +
                        asString(WAVM::Runtime::getExternType(out_object)) +
                        " but was expecting type: " + asString(type));
          return false;
        }
      }
    }
    for (auto r : resolvers_) {
      if (r->resolve(module_name, export_name, type, out_object)) {
        return true;
      }
    }
    vm_->fail(FailState::MissingFunction,
              "Failed to load Wasm module due to a missing import: " + std::string(module_name) +
                  "." + std::string(export_name) + " " + asString(type));
    return false;
  }

  HashMap<std::string, WAVM::Runtime::Instance *> &moduleNameToInstanceMap() {
    return module_name_to_instance_map_;
  }

  void addResolver(WAVM::Runtime::Resolver *r) { resolvers_.push_back(r); }

private:
  WasmVm *vm_;
  HashMap<std::string, WAVM::Runtime::Instance *> module_name_to_instance_map_;
  std::vector<WAVM::Runtime::Resolver *> resolvers_;
};

const uint64_t WasmPageSize = 1 << 16;

bool loadModule(const std::string &code, IR::Module &out_module) {
  // If the code starts with the WASM binary magic number, load it as a binary IR::Module.
  static const uint8_t WasmMagicNumber[4] = {0x00, 0x61, 0x73, 0x6d};
  if (code.size() >= 4 && !memcmp(code.data(), WasmMagicNumber, 4)) {
    return WASM::loadBinaryModule(reinterpret_cast<const unsigned char *>(code.data()), code.size(),
                                  out_module);
  } else {
    // Load it as a text IR::Module.
    std::vector<WAST::Error> parseErrors;
    if (!WAST::parseModule(code.c_str(), code.size() + 1, out_module, parseErrors)) {
      return false;
    }
    return true;
  }
}

} // namespace

template <typename T> struct NativeWord { using type = T; };
template <> struct NativeWord<Word> { using type = uint32_t; };

template <typename T> typename NativeWord<T>::type ToNative(const T &t) { return t; }
template <> typename NativeWord<Word>::type ToNative(const Word &t) { return t.u32(); }

struct PairHash {
  template <typename T, typename U> std::size_t operator()(const std::pair<T, U> &x) const {
    return std::hash<T>()(x.first) + std::hash<U>()(x.second);
  }
};

struct Wavm : public WasmVm {
  Wavm() : WasmVm() {}
  ~Wavm() override;

  // WasmVm
  std::string_view runtime() override { return "wavm"; }
  Cloneable cloneable() override { return Cloneable::InstantiatedModule; };
  std::unique_ptr<WasmVm> clone() override;
  bool load(const std::string &code, bool allow_precompiled) override;
  bool link(std::string_view debug_name) override;
  uint64_t getMemorySize() override;
  std::optional<std::string_view> getMemory(uint64_t pointer, uint64_t size) override;
  bool setMemory(uint64_t pointer, uint64_t size, const void *data) override;
  bool getWord(uint64_t pointer, Word *data) override;
  bool setWord(uint64_t pointer, Word data) override;
  std::string_view getCustomSection(std::string_view name) override;
  std::string_view getPrecompiledSectionName() override;
  AbiVersion getAbiVersion() override;

#define _GET_FUNCTION(_T)                                                                          \
  void getFunction(std::string_view function_name, _T *f) override {                               \
    getFunctionWavm(this, function_name, f);                                                       \
  };
  FOR_ALL_WASM_VM_EXPORTS(_GET_FUNCTION)
#undef _GET_FUNCTION

#define _REGISTER_CALLBACK(_T)                                                                     \
  void registerCallback(std::string_view module_name, std::string_view function_name, _T,          \
                        typename ConvertFunctionTypeWordToUint32<_T>::type f) override {           \
    registerCallbackWavm(this, module_name, function_name, f);                                     \
  };
  FOR_ALL_WASM_VM_IMPORTS(_REGISTER_CALLBACK)
#undef _REGISTER_CALLBACK

  bool has_instantiated_module_ = false;
  IR::Module ir_module_;
  WAVM::Runtime::ModuleRef module_ = nullptr;
  WAVM::Runtime::GCPointer<WAVM::Runtime::Instance> module_instance_;
  WAVM::Runtime::Memory *memory_;
  WAVM::Runtime::GCPointer<WAVM::Runtime::Compartment> compartment_;
  WAVM::Runtime::GCPointer<WAVM::Runtime::Context> context_;
  std::map<std::string, Intrinsics::Module> intrinsic_modules_;
  std::map<std::string, WAVM::Runtime::GCPointer<WAVM::Runtime::Instance>>
      intrinsic_module_instances_;
  std::vector<std::unique_ptr<Intrinsics::Function>> envoyFunctions_;
  uint8_t *memory_base_ = nullptr;
  AbiVersion abi_version_ = AbiVersion::Unknown;
};

Wavm::~Wavm() {
  module_instance_ = nullptr;
  context_ = nullptr;
  intrinsic_module_instances_.clear();
  intrinsic_modules_.clear();
  envoyFunctions_.clear();
  if (compartment_) {
    ASSERT(tryCollectCompartment(std::move(compartment_)));
  }
}

std::unique_ptr<WasmVm> Wavm::clone() {
  auto wavm = std::make_unique<Wavm>();
  wavm->integration().reset(integration()->clone());

  wavm->compartment_ = WAVM::Runtime::cloneCompartment(compartment_);
  wavm->memory_ = WAVM::Runtime::remapToClonedCompartment(memory_, wavm->compartment_);
  wavm->memory_base_ = WAVM::Runtime::getMemoryBaseAddress(wavm->memory_);
  wavm->context_ = WAVM::Runtime::createContext(wavm->compartment_);
  wavm->abi_version_ = abi_version_;
  for (auto &p : intrinsic_module_instances_) {
    wavm->intrinsic_module_instances_.emplace(
        p.first, WAVM::Runtime::remapToClonedCompartment(p.second, wavm->compartment_));
  }
  wavm->module_instance_ =
      WAVM::Runtime::remapToClonedCompartment(module_instance_, wavm->compartment_);
  return wavm;
}

bool Wavm::load(const std::string &code, bool allow_precompiled) {
  ASSERT(!has_instantiated_module_);
  has_instantiated_module_ = true;
  compartment_ = WAVM::Runtime::createCompartment();
  context_ = WAVM::Runtime::createContext(compartment_);
  if (!loadModule(code, ir_module_)) {
    return false;
  }
  getAbiVersion(); // Cache ABI version.
  const CustomSection *precompiled_object_section = nullptr;
  if (allow_precompiled) {
    for (const CustomSection &customSection : ir_module_.customSections) {
      if (customSection.name == getPrecompiledSectionName()) {
        precompiled_object_section = &customSection;
        break;
      }
    }
  }
  if (!precompiled_object_section) {
    module_ = WAVM::Runtime::compileModule(ir_module_);
  } else {
    module_ = WAVM::Runtime::loadPrecompiledModule(ir_module_, precompiled_object_section->data);
  }
  return true;
}

AbiVersion Wavm::getAbiVersion() {
  if (abi_version_ != AbiVersion::Unknown) {
    return abi_version_;
  }
  for (auto &e : ir_module_.exports) {
    if (e.name == "proxy_abi_version_0_1_0") {
      abi_version_ = AbiVersion::ProxyWasm_0_1_0;
      return abi_version_;
    }
    if (e.name == "proxy_abi_version_0_2_0") {
      abi_version_ = AbiVersion::ProxyWasm_0_2_0;
      return abi_version_;
    }
    if (e.name == "proxy_abi_version_0_2_1") {
      abi_version_ = AbiVersion::ProxyWasm_0_2_1;
      return abi_version_;
    }
  }
  return AbiVersion::Unknown;
}

bool Wavm::link(std::string_view debug_name) {
  RootResolver rootResolver(compartment_, this);
  for (auto &p : intrinsic_modules_) {
    auto instance = Intrinsics::instantiateModule(compartment_, {&intrinsic_modules_[p.first]},
                                                  std::string(p.first));
    intrinsic_module_instances_.emplace(p.first, instance);
    rootResolver.moduleNameToInstanceMap().set(p.first, instance);
  }
  WAVM::Runtime::LinkResult link_result = linkModule(ir_module_, rootResolver);
  if (!link_result.missingImports.empty()) {
    for (auto &i : link_result.missingImports) {
      error("Missing Wasm import " + i.moduleName + " " + i.exportName);
    }
    fail(FailState::MissingFunction, "Failed to load Wasm module due to a missing import(s)");
    return false;
  }
  module_instance_ = instantiateModule(
      compartment_, module_, std::move(link_result.resolvedImports), std::string(debug_name));
  memory_ = getDefaultMemory(module_instance_);
  memory_base_ = WAVM::Runtime::getMemoryBaseAddress(memory_);
  return true;
}

uint64_t Wavm::getMemorySize() { return WAVM::Runtime::getMemoryNumPages(memory_) * WasmPageSize; }

std::optional<std::string_view> Wavm::getMemory(uint64_t pointer, uint64_t size) {
  auto memory_num_bytes = WAVM::Runtime::getMemoryNumPages(memory_) * WasmPageSize;
  if (pointer + size > memory_num_bytes) {
    return std::nullopt;
  }
  return std::string_view(reinterpret_cast<char *>(memory_base_ + pointer), size);
}

bool Wavm::setMemory(uint64_t pointer, uint64_t size, const void *data) {
  auto memory_num_bytes = WAVM::Runtime::getMemoryNumPages(memory_) * WasmPageSize;
  if (pointer + size > memory_num_bytes) {
    return false;
  }
  auto p = reinterpret_cast<char *>(memory_base_ + pointer);
  memcpy(p, data, size);
  return true;
}

bool Wavm::getWord(uint64_t pointer, Word *data) {
  auto memory_num_bytes = WAVM::Runtime::getMemoryNumPages(memory_) * WasmPageSize;
  if (pointer + sizeof(uint32_t) > memory_num_bytes) {
    return false;
  }
  auto p = reinterpret_cast<char *>(memory_base_ + pointer);
  uint32_t data32;
  memcpy(&data32, p, sizeof(uint32_t));
  data->u64_ = data32;
  return true;
}

bool Wavm::setWord(uint64_t pointer, Word data) {
  uint32_t data32 = data.u32();
  return setMemory(pointer, sizeof(uint32_t), &data32);
}

std::string_view Wavm::getCustomSection(std::string_view name) {
  for (auto &section : ir_module_.customSections) {
    if (section.name == name) {
      return {reinterpret_cast<char *>(section.data.data()), section.data.size()};
    }
  }
  return {};
}

std::string_view Wavm::getPrecompiledSectionName() { return "wavm.precompiled_object"; }

} // namespace Wavm

std::unique_ptr<WasmVm> createWavmVm() { return std::make_unique<proxy_wasm::Wavm::Wavm>(); }

template <typename R, typename... Args>
IR::FunctionType inferEnvoyFunctionType(R (*)(void *, Args...)) {
  return IR::FunctionType(IR::inferResultType<R>(), IR::TypeTuple({IR::inferValueType<Args>()...}),
                          IR::CallingConvention::intrinsic);
}

using namespace Wavm;

template <typename R, typename... Args>
void registerCallbackWavm(WasmVm *vm, std::string_view module_name, std::string_view function_name,
                          R (*f)(Args...)) {
  auto wavm = static_cast<proxy_wasm::Wavm::Wavm *>(vm);
  wavm->envoyFunctions_.emplace_back(new Intrinsics::Function(
      &wavm->intrinsic_modules_[std::string(module_name)], function_name.data(),
      reinterpret_cast<void *>(f), inferEnvoyFunctionType(f)));
}

template void registerCallbackWavm<void, void *>(WasmVm *vm, std::string_view module_name,
                                                 std::string_view function_name, void (*f)(void *));
template void registerCallbackWavm<void, void *, U32>(WasmVm *vm, std::string_view module_name,
                                                      std::string_view function_name,
                                                      void (*f)(void *, U32));
template void registerCallbackWavm<void, void *, U32, U32>(WasmVm *vm, std::string_view module_name,
                                                           std::string_view function_name,
                                                           void (*f)(void *, U32, U32));
template void registerCallbackWavm<void, void *, U32, U32, U32>(WasmVm *vm,
                                                                std::string_view module_name,
                                                                std::string_view function_name,
                                                                void (*f)(void *, U32, U32, U32));
template void
registerCallbackWavm<void, void *, U32, U32, U32, U32>(WasmVm *vm, std::string_view module_name,
                                                       std::string_view function_name,
                                                       void (*f)(void *, U32, U32, U32, U32));
template void registerCallbackWavm<void, void *, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    void (*f)(void *, U32, U32, U32, U32, U32));
template void registerCallbackWavm<void, void *, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    void (*f)(void *, U32, U32, U32, U32, U32, U32));
template void registerCallbackWavm<void, void *, U32, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    void (*f)(void *, U32, U32, U32, U32, U32, U32, U32));
template void registerCallbackWavm<void, void *, U32, U32, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    void (*f)(void *, U32, U32, U32, U32, U32, U32, U32, U32));
template void registerCallbackWavm<void, void *, U32, U32, U32, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    void (*f)(void *, U32, U32, U32, U32, U32, U32, U32, U32, U32));
template void registerCallbackWavm<void, void *, U32, U32, U32, U32, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    void (*f)(void *, U32, U32, U32, U32, U32, U32, U32, U32, U32, U32));

template void registerCallbackWavm<U32, void *>(WasmVm *vm, std::string_view module_name,
                                                std::string_view function_name, U32 (*f)(void *));
template void registerCallbackWavm<U32, void *, U32>(WasmVm *vm, std::string_view module_name,
                                                     std::string_view function_name,
                                                     U32 (*f)(void *, U32));
template void registerCallbackWavm<U32, void *, U32, U32>(WasmVm *vm, std::string_view module_name,
                                                          std::string_view function_name,
                                                          U32 (*f)(void *, U32, U32));
template void registerCallbackWavm<U32, void *, U32, U32, U32>(WasmVm *vm,
                                                               std::string_view module_name,
                                                               std::string_view function_name,
                                                               U32 (*f)(void *, U32, U32, U32));
template void
registerCallbackWavm<U32, void *, U32, U32, U32, U32>(WasmVm *vm, std::string_view module_name,
                                                      std::string_view function_name,
                                                      U32 (*f)(void *, U32, U32, U32, U32));
template void registerCallbackWavm<U32, void *, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    U32 (*f)(void *, U32, U32, U32, U32, U32));
template void registerCallbackWavm<U32, void *, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    U32 (*f)(void *, U32, U32, U32, U32, U32, U32));
template void registerCallbackWavm<U32, void *, U32, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    U32 (*f)(void *, U32, U32, U32, U32, U32, U32, U32));
template void registerCallbackWavm<U32, void *, U32, U32, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    U32 (*f)(void *, U32, U32, U32, U32, U32, U32, U32, U32));
template void registerCallbackWavm<U32, void *, U32, U32, U32, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    U32 (*f)(void *, U32, U32, U32, U32, U32, U32, U32, U32, U32));
template void registerCallbackWavm<U32, void *, U32, U32, U32, U32, U32, U32, U32, U32, U32, U32>(
    WasmVm *vm, std::string_view module_name, std::string_view function_name,
    U32 (*f)(void *, U32, U32, U32, U32, U32, U32, U32, U32, U32, U32));

template void registerCallbackWavm<U64, void *, U32>(WasmVm *vm, std::string_view module_name,
                                                     std::string_view function_name,
                                                     U64 (*f)(void *, U32));
template void registerCallbackWavm<void, void *, U32, I64>(WasmVm *vm, std::string_view module_name,
                                                           std::string_view function_name,
                                                           void (*f)(void *, U32, I64));
template void registerCallbackWavm<void, void *, U32, U64>(WasmVm *vm, std::string_view module_name,
                                                           std::string_view function_name,
                                                           void (*f)(void *, U32, U64));

template <typename R, typename... Args>
IR::FunctionType inferStdFunctionType(std::function<R(ContextBase *, Args...)> *) {
  return IR::FunctionType(IR::inferResultType<R>(), IR::TypeTuple({IR::inferValueType<Args>()...}));
}

static bool checkFunctionType(WAVM::Runtime::Function *f, IR::FunctionType t) {
  return getFunctionType(f) == t;
}

template <typename R, typename... Args>
void getFunctionWavmReturn(WasmVm *vm, std::string_view function_name,
                           std::function<R(ContextBase *, Args...)> *function, uint32_t) {
  auto wavm = static_cast<proxy_wasm::Wavm::Wavm *>(vm);
  auto f =
      asFunctionNullable(getInstanceExport(wavm->module_instance_, std::string(function_name)));
  if (!f)
    f = asFunctionNullable(getInstanceExport(wavm->module_instance_, std::string(function_name)));
  if (!f) {
    *function = nullptr;
    return;
  }
  if (!checkFunctionType(f, inferStdFunctionType(function))) {
    wavm->fail(FailState::UnableToInitializeCode,
               "Bad function signature for: " + std::string(function_name));
  }
  *function = [wavm, f, function_name](ContextBase *context, Args... args) -> R {
    WasmUntaggedValue values[] = {args...};
    WasmUntaggedValue return_value;
    CALL_WITH_CONTEXT(
        invokeFunction(wavm->context_, f, getFunctionType(f), &values[0], &return_value), context,
        wavm);
    if (!wavm->isFailed()) {
      return static_cast<uint32_t>(return_value.i32);
    } else {
      return 0;
    }
  };
}

struct Void {};

template <typename R, typename... Args>
void getFunctionWavmReturn(WasmVm *vm, std::string_view function_name,
                           std::function<R(ContextBase *, Args...)> *function, Void) {
  auto wavm = static_cast<proxy_wasm::Wavm::Wavm *>(vm);
  auto f =
      asFunctionNullable(getInstanceExport(wavm->module_instance_, std::string(function_name)));
  if (!f)
    f = asFunctionNullable(getInstanceExport(wavm->module_instance_, std::string(function_name)));
  if (!f) {
    *function = nullptr;
    return;
  }
  if (!checkFunctionType(f, inferStdFunctionType(function))) {
    wavm->fail(FailState::UnableToInitializeCode,
               "Bad function signature for: " + std::string(function_name));
  }
  *function = [wavm, f, function_name](ContextBase *context, Args... args) -> R {
    WasmUntaggedValue values[] = {args...};
    CALL_WITH_CONTEXT(invokeFunction(wavm->context_, f, getFunctionType(f), &values[0]), context,
                      wavm);
  };
}

// NB: Unfortunately 'void' is not treated like every other function type in C++. In
// particular it is not possible to specialize a template based on 'void'. Instead
// we use 'Void' for template matching. Note that the template implementation above
// which matchers on 'bool' does not use 'Void' in the implemenation.
template <typename R, typename... Args>
void getFunctionWavm(WasmVm *vm, std::string_view function_name,
                     std::function<R(ContextBase *, Args...)> *function) {
  typename std::conditional<std::is_void<R>::value, Void, uint32_t>::type x{};
  getFunctionWavmReturn(vm, function_name, function, x);
}

template void getFunctionWavm<void>(WasmVm *, std::string_view,
                                    std::function<void(ContextBase *)> *);
template void getFunctionWavm<void, uint32_t>(WasmVm *, std::string_view,
                                              std::function<void(ContextBase *, uint32_t)> *);
template void
getFunctionWavm<void, uint32_t, uint32_t>(WasmVm *, std::string_view,
                                          std::function<void(ContextBase *, uint32_t, uint32_t)> *);
template void getFunctionWavm<void, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view, std::function<void(ContextBase *, uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<void, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<void(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<void, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<void(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<void, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<void(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t)>
        *);
template void getFunctionWavm<void, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<void(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                       uint32_t)> *);
template void getFunctionWavm<void, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<void(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                       uint32_t, uint32_t)> *);
template void getFunctionWavm<void, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<void(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                       uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<void, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<void(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                       uint32_t, uint32_t, uint32_t, uint32_t)> *);

template void getFunctionWavm<uint32_t>(WasmVm *, std::string_view,
                                        std::function<uint32_t(ContextBase *)> *);
template void
getFunctionWavm<uint32_t, uint32_t>(WasmVm *, std::string_view,
                                    std::function<uint32_t(ContextBase *, uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view, std::function<uint32_t(ContextBase *, uint32_t, uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<uint32_t(ContextBase *, uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<uint32_t(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<uint32_t(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<uint32_t(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                           uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<uint32_t(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                           uint32_t, uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<uint32_t(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                           uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<uint32_t(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                           uint32_t, uint32_t, uint32_t, uint32_t)> *);
template void getFunctionWavm<uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t>(
    WasmVm *, std::string_view,
    std::function<uint32_t(ContextBase *, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t,
                           uint32_t, uint32_t, uint32_t, uint32_t, uint32_t)> *);

template <typename T> T getValue(IR::Value) {}
template <> Word getValue(IR::Value v) { return v.u32; }
template <> int32_t getValue(IR::Value v) { return v.i32; }
template <> uint32_t getValue(IR::Value v) { return v.u32; }
template <> int64_t getValue(IR::Value v) { return v.i64; }
template <> uint64_t getValue(IR::Value v) { return v.u64; }
template <> float getValue(IR::Value v) { return v.f32; }
template <> double getValue(IR::Value v) { return v.f64; }

} // namespace proxy_wasm
