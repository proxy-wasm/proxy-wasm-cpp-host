// Copyright 2021 Google LLC
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
#[no_mangle]
pub extern "C" fn proxy_abi_version_0_2_0() {}

#[no_mangle]
pub extern "C" fn proxy_on_memory_allocate(_: usize) -> *mut u8 {
    std::ptr::null_mut()
}

fn send_http_response(status_code: u32) -> u32 {
    let headers = 0u32.to_le_bytes().to_vec();
    unsafe {
        proxy_send_local_response(
            status_code,
            std::ptr::null(),
            0,
            std::ptr::null(),
            0,
            headers.as_ptr(),
            headers.len(),
            -1)
    }
}

#[no_mangle]
pub extern "C" fn run_fail() {
    println!(
        "proxy_send_local_response returned {}",
        send_http_response(404));
}

#[no_mangle]
pub extern "C" fn run_success() {
    println!(
        "proxy_send_local_response returned {}",
        send_http_response(200));
}

extern "C" {
    fn proxy_send_local_response(
        status_code: u32,
        status_code_details_data: *const u8,
        status_code_details_size: usize,
        body_data: *const u8,
        body_size: usize,
        headers_data: *const u8,
        headers_size: usize,
        grpc_status: i32,
    ) -> u32;
}
