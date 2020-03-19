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
   */
  virtual ProxyAction onRequestBody() = 0;

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
   */
  virtual ProxyAction onResponseBody() = 0;

  /**
   * Call on a stream context to indicate that the request trailers have arrived.
   */
  virtual ProxyAction onResponseTrailers() = 0;

  /**
   * Call on a stream context to indicate that the request metadata has arrived.
   */
  virtual ProxyAction onResponseMetadata() = 0;

  /**
   * Call when the final status of the stream is available e.g. for logging. Occurs after onDone().
   */
  virtual void onFinalize() = 0;
};

/**
 * NetworkInterface is the interface between the VM host and the VM for network streams.
 */
class NetworkInterface {
public:
  /**
   * Network
   * Note: Body data is obtained by the code in the VM via calls implemented by the
   * proxy-independent host code using the getBuffer() call.
   */

  /**
   * Call on a stream Context to indicate that a new network connection has been been created.
   * Calls onStart().
   */
  virtual ProxyAction onNetworkNewConnection() = 0;

  /**
   * Call on a stream Context to indicate that data has arrived from downstream (e.g. on the
   * incoming port that was accepted and for which the proxy is acting as a server).
   * @return indicates the subsequent behavior of this stream, e.g. continue proxying or pause
   * proxying.
   */
  virtual ProxyAction onDownstreamData() = 0;

  /**
   * Call on a stream Context to indicate that data has arrived from upstream (e.g. on the outgoing
   * port that the proxy connected and for which the proxy is acting as a client).
   * @param data_length the amount of data in the buffer.
   * @param end_of_stream is true if no more data will be arriving.
   * @return indicates the subsequent behavior of this stream, e.g. continue proxying or pause
   * proxying.
   */
  virtual ProxyAction onUpstreamData() = 0;

  /*
   * The source of the close event.
   * Unknown is when the source is not known.
   * Local is when the close was initiated by the proxy.
   * Remote is when the close was received from the peer.
   */
  enum class CloseType : uint32_t {
    Unknown = 0,
    Local = 1,
    Remote = 2,
  };

  /**
   * Call on a stream context to indicate that the downstream connection has closed.
   * @close_type is the source of the close.
   */
  virtual void onDownstreamConnectionClose(CloseType close_type) = 0;

  /**
   * Call on a stream context to indicate that the upstream connection has closed.
   * @close_type is the source of the close.
   */
  virtual void onUpstreamConnectionClose(CloseType close_type) = 0;
};

} // namespace proxy_wasm
