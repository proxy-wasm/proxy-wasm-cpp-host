#[no_mangle]
pub extern "C" fn run() {
    unsafe {
        callback();
    }
}

static A : i32 = 100000;

#[no_mangle]
pub extern "C" fn run2(val: i32) -> i32 {
    unsafe {
        callback2(val) + A
    }
}

extern "C" {
    fn callback();
    fn callback2(val: i32) -> i32;
}

