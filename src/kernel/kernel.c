#include "../drivers/screen.h"
#include "../drivers/ports.h"

int    main(void)
{
    char    *vga = (char*) 0xb8000;
    int     offset_from_vga;
    int     x = 2;
    int     y = 0;
    int     position = x + y * MAX_COLS;

    clear_screen();
}
