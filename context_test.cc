#include "include/proxy-wasm/context.h"

#include "gtest/gtest.h"

namespace proxy_wasm {
namespace {

class Context : public ContextBase {
public:
  Context(std::function<void(string_view s)> error_function) : error_function_(error_function) {}
  void error(string_view message) { error_function_(message); }

private:
  std::function<void(string_view s)> error_function_;
};

TEST(Context, IncludeParses) {}

} // namespace
} // namespace proxy_wasm
