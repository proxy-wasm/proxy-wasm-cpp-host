#include "include/proxy-wasm/wasm_vm.h"

#include "gtest/gtest.h"
#include "include/proxy-wasm/null.h"
#include "include/proxy-wasm/null_vm_plugin.h"

namespace proxy_wasm {

class TestNullVmPlugin : public NullVmPlugin {
public:
  TestNullVmPlugin() = default;
  ~TestNullVmPlugin() override = default;
};

TestNullVmPlugin *test_null_vm_plugin_ = nullptr;
RegisterNullVmPluginFactory register_test_null_vm_plugin("test_null_vm_plugin", []() {
  auto plugin = std::make_unique<TestNullVmPlugin>();
  test_null_vm_plugin_ = plugin.get();
  return plugin;
});

TEST(WasmVm, Compat) {
  string_view foo = "foo";
  std::string bar = "bar";

  EXPECT_NE(foo, bar);
  EXPECT_EQ(foo, "foo");

  optional<int> o = PROXY_WASM_NULLOPT;
  EXPECT_FALSE(o);

  o = 1;
  EXPECT_TRUE(o);
}

TEST(WasmVm, Word) {
  Word w(1);
  EXPECT_EQ(w.u32(), 1);
  EXPECT_EQ(sizeof(w.u32()), sizeof(uint32_t));
  EXPECT_EQ(w, 1);
  EXPECT_EQ(sizeof(w), sizeof(uint64_t));
}

class BaseVmTest : public testing::Test {
public:
  BaseVmTest() {}
};

TEST_F(BaseVmTest, NullVmStartup) {
  auto wasm_vm = createNullVm();
  EXPECT_TRUE(wasm_vm != nullptr);
  EXPECT_TRUE(wasm_vm->runtime() == "null");
  EXPECT_TRUE(wasm_vm->cloneable() == Cloneable::InstantiatedModule);
  auto wasm_vm_clone = wasm_vm->clone();
  EXPECT_TRUE(wasm_vm_clone != nullptr);
  EXPECT_TRUE(wasm_vm->getCustomSection("user").empty());
}

} // namespace proxy_wasm
