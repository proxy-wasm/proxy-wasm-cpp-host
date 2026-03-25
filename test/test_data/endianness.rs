// Copyright 2026 Google LLC
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

extern "C" {
    fn proxy_log(level: u32, message_data: *const u8, message_size: usize) -> bool;
}

fn log(message: &str) {
    unsafe {
        proxy_log(/*error*/ 4, message.as_bytes().as_ptr(), message.len());
    }
}

#[no_mangle]
pub extern "C" fn _initialize() {
    std::panic::set_hook(Box::new(|panic_info| {
        log(&format!(
            "panic message: {}",
            panic_info.payload_as_str().unwrap_or("")
        ));
    }));
}

#[no_mangle]
pub extern "C" fn proxy_abi_version_0_2_0() {}

#[no_mangle]
pub extern "C" fn proxy_on_memory_allocate(size: usize) -> *mut u8 {
    let mut vec: Vec<u8> = Vec::with_capacity(size);
    unsafe {
        vec.set_len(size);
    }
    let slice = vec.into_boxed_slice();
    Box::into_raw(slice) as *mut u8
}

extern "C" {
    // Used by test_host_return to assert on values returned from imports from the host.
    fn proxy_get_header_map_pairs(
        map_type: u32,
        return_map_data: *mut *mut u8,
        return_map_size: *mut usize,
    ) -> u32;
}

#[no_mangle]
pub extern "C" fn test_return_u32() -> u32 {
    return 3333333333;
}

#[no_mangle]
pub extern "C" fn test_return_i32() -> i32 {
    return -1111111111;
}

#[no_mangle]
pub extern "C" fn test_return_u64(_: f32) -> u64 {
    return 11111111111111111111;
}

#[no_mangle]
pub extern "C" fn test_return_i64(_: f32) -> i64 {
    return -111111111111111111;
}

#[no_mangle]
pub extern "C" fn test_return_f32(_: f32, _: f32) -> f32 {
    return 1111.0f32;
}

#[no_mangle]
pub extern "C" fn test_return_f64(_: f32, _: f32, _: f32) -> f64 {
    return 1111111111.0f64;
}

#[no_mangle]
pub extern "C" fn test_host_return() -> u32 {
    unsafe {
        let ret = proxy_get_header_map_pairs(0, std::ptr::null_mut(), std::ptr::null_mut());
        if ret != 3333333333u32 {
            panic!("unexpected get_header_map_pairs return value: {}", ret);
        }
    }
    return 1;
}

#[no_mangle]
pub extern "C" fn test_primitives(uint32: u32, uint64: u64, float32: f32, float64: f64) -> i32 {
    if uint32 != 3333333333 {
        panic!("unexpected uint32 value: {}", uint32);
    }
    if uint64 != 11111111111111111111 {
        panic!("unexpected uint64 value: {}", uint64);
    }
    if float32 < 1110.0 || float32 > 1112.0 {
        panic!("unexpected float32 value: {}", float32);
    }
    if float64 < 1111111110.0 || float64 > 1111111112.0 {
        panic!("unexpected float64 value: {}", float64);
    }
    return 1;
}

#[no_mangle]
pub extern "C" fn test_negative_primitives(
    int32: i32,
    int64: i64,
    float32: f32,
    float64: f64,
) -> i32 {
    if int32 != -1111111111 {
        panic!("unexpected int32 value: {}", int32);
    }
    if int64 != -1111111111111111111 {
        panic!("unexpected int64 value: {}", int64);
    }
    if float32 > -1110.0 || float32 < -1112.0 {
        panic!("unexpected float32 value: {}", float32);
    }
    if float64 > -1111111110.0 || float64 < -1111111112.0 {
        panic!("unexpected float64 value: {}", float64);
    }
    return 1;
}

#[no_mangle]
pub extern "C" fn test_buffer_from_wasm() -> bool {
    let message = "hello from wasm land!";
    unsafe {
        match proxy_log(/*info*/ 2, message.as_ptr(), message.len()) {
            false => true,
            status => panic!("unexpected status: {}", status as u32),
        }
    }
}

extern "C" {
    fn proxy_get_buffer_bytes(
        buffer_type: u32,
        start: usize,
        max_size: usize,
        return_buffer_data: *mut *mut u8,
        return_buffer_size: *mut usize,
    ) -> bool;
}

#[no_mangle]
pub extern "C" fn test_buffer_from_host() -> bool {
    let mut return_data: *mut u8 = std::ptr::null_mut();
    let mut return_size: usize = 0;
    unsafe {
        match proxy_get_buffer_bytes(0, 0, 30, &mut return_data, &mut return_size) {
            false => {
                if return_data.is_null() {
                    panic!("return_data was null");
                }
                let result =
                    String::from_utf8(Vec::from_raw_parts(return_data, return_size, return_size))
                        .unwrap();
                if result != "hello from host land!\0" {
                    panic!("message {} did not match expectation", result);
                }
                true
            }
            status => panic!("unexpected status: {}", status as u32),
        }
    }
}
