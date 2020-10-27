#[no_mangle]
pub extern "C" fn trigger() {
    one();
}
#[no_mangle]
pub extern "C" fn trigger2(val: i32) -> i32 {
    three();
    0
}

fn one() {
    two();
}

fn two() {
    three();
}

fn three(){
    panic!("trap!");
}
