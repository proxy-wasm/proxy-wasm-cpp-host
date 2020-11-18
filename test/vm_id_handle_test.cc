#include "src/vm_id_handle.h"

#include <thread>

#include "gtest/gtest.h"

namespace proxy_wasm {

TEST(VmIdHandle, Basic) {
  auto vm_id = "vm_id";
  auto handle = getVmIdHandle(vm_id);
  EXPECT_TRUE(handle);

  bool called = false;
  registerVmIdHandleCallback([&called](std::string_view vm_id) { called = true; });

  handle.reset();
  EXPECT_TRUE(called);

  handle = getVmIdHandle(vm_id);
  auto handle2 = getVmIdHandle(vm_id);
  called = false;
  handle.reset();
  EXPECT_FALSE(called);
  handle2.reset();
  EXPECT_TRUE(called);
}

} // namespace proxy_wasm
