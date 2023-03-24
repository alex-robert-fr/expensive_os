#include "../drivers/screen.h"
#include "../drivers/ports.h"

void    main()
{
    char    *vga = (char*) 0xb8000;
    int     offset_from_vga;
    int     position;

    clear_screen();
    port_byte_out(0x3d4, 14);
    position = position << 8;
    port_byte_out(0x3d4, 15);
    position += port_byte_in(0x3d5);
    offset_from_vga = position * 2;
    vga[offset_from_vga] = 'X';
    vga[offset_from_vga + 1] = 0x4b;
}