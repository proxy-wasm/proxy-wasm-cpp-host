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

#[no_mangle]
pub extern "C" fn proxy_abi_version_0_2_0() {}

#[no_mangle]
pub extern "C" fn proxy_on_memory_allocate(_: usize) -> *mut u8 {
    std::ptr::null_mut()
}

#[no_mangle]
pub extern "C" fn trigger() {
    one();
}

#[no_mangle]
pub extern "C" fn trigger2(_val: i32) -> i32 {
    three();
    0
}

#[inline(never)]
fn one() {
    two();
}

// Proxy-Wasm only prints up to 9 stack frames in V8.
// Ensure that we can see the `one` frame in the stack trace for assertions by inlining two and
// three.
#[inline(always)]
fn two() {
    three();
}

#[inline(always)]
fn three() {
    panic!("trap!");
}
