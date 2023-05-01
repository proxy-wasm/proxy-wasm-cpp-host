#include "proxy_wasm_intrinsics.h"

class LoggingStreamContext : public Context {
public:
  explicit LoggingStreamContext(uint32_t id, RootContext *root) : Context(id, root) {}

  void onCreate() override { LOG_INFO("onCreate called"); }
  void onDelete() override { LOG_INFO("onDelete called"); }
  void onDone() override { LOG_INFO("onDone called"); }

  FilterHeadersStatus onRequestHeaders(uint32_t headers, bool end_of_stream) override {
    LOG_INFO("onRequestHeaders called");
    // A real host would implement header getters/setters to be called here.
    return FilterHeadersStatus::Continue;
  }

  FilterHeadersStatus onResponseHeaders(uint32_t headers, bool end_of_stream) override {
    LOG_INFO("onResponseHeaders called");
    // A real host would implement header getters/setters to be called here.
    return FilterHeadersStatus::Continue;
  }
};

static RegisterContextFactory register_StaticContext(CONTEXT_FACTORY(LoggingStreamContext),
                                                     ROOT_FACTORY(RootContext));
