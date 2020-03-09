#include "include/proxy-wasm/wasm_vm.h"

#include "gtest/gtest.h"

namespace proxy_wasm {
namespace {

TEST(WasmVm, Load) {
  string_view foo = "foo";
  std::string bar = "bar";

  EXPECT_NE(foo, bar);
  EXPECT_EQ(foo, "foo");
}

} // namespace
} // namespace proxy_wasm
