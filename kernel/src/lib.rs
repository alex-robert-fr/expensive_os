#![no_std]
#![feature(lang_items)]

mod panic;

static HELLO: &[u8] = b"Hello World!";

#[no_mangle]
pub extern "C" fn kstart() -> ! {
    let vga_buffer = 0xb8000 as *mut u8;

    for (i, &byte) in HELLO.iter().enumerate() {
        unsafe {
            *vga_buffer.offset(i as isize * 2) = byte;
            *vga_buffer.offset(i as isize * 2 + 1) = 0xb;
        }
    }
    loop {}
}
