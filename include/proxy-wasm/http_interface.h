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

#pragma once

#include "include/proxy-wasm/compat.h"

#include <time.h>
#include <atomic>
#include <chrono>
#include <functional>
#include <iostream>
#include <map>
#include <memory>
#include <vector>

#include "include/proxy-wasm/proxy_action.h"

namespace proxy_wasm {

/**
 * HttpInterface is the interface between the VM host and the VM for HTTP streams.
 */
class HttpInterface {
public:
  /**
   * Calls into the VM.
   * These are implemented by the proxy-independent host code. They are virtual to support some
   * types of testing.
   */

  /*
   * HTTP
   * Note: headers and trailers are obtained by the code in the VM via the XXXHeaderMapXXX set of
   * functions. Body data is obtained by the code in the VM via calls implemented by the
   * proxy-independent host code using the getBuffer() call.
   */

  /**
   * Call on a stream context to indicate that the request headers have arrived.  Calls onCreate().
   */
  virtual ProxyAction onRequestHeaders() = 0;

  /**
   * Call on a stream context to indicate that body data has arrived.
   * @param body_buffer_length the amount of data in the body buffer.
   * @param end_of_stream is true if no more body data will be arriving.
   */
  virtual ProxyAction onRequestBody(uint32_t body_buffer_length, bool end_of_stream) = 0;

  /**
   * Call on a stream context to indicate that the request trailers have arrived.
   */
  virtual ProxyAction onRequestTrailers() = 0;

  /**
   * Call on a stream context to indicate that the request metadata has arrived.
   */
  virtual ProxyAction onRequestMetadata() = 0;

  /**
   * Call on a stream context to indicate that the request trailers have arrived.
   */
  virtual ProxyAction onResponseHeaders() = 0;

  /**
   * Call on a stream context to indicate that body data has arrived.
   * @param body_buffer_length the amount of data in the body buffer.
   * @param end_of_stream is true if no more body data will be arriving.
   */
  virtual ProxyAction onResponseBody(uint32_t body_buffer_length, bool end_of_stream) = 0;

  /**
   * Call on a stream context to indicate that the request trailers have arrived.
   */
  virtual ProxyAction onResponseTrailers() = 0;

  /**
   * Call on a stream context to indicate that the request metadata has arrived.
   */
  virtual ProxyAction onResponseMetadata() = 0;

  /**
   * Call when a stream should log the final status of the stream. Occurs after onDone().
   */
  virtual void onLog() = 0;
};

} // namespace proxy_wasm
