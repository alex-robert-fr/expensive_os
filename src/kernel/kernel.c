#include "../drivers/screen.h"
#include "../drivers/ports.h"

void    main()
{
    char    *vga = (char*) 0xb8000;
    int     offset_from_vga;
    int     x = 2;
    int     y = 0;
    int     position = x + y * MAX_COLS;

    clear_screen();
    print_string("Bienvenue sur :\nExpensiveOS", 0, 0, 0x2e);
    print_string("Cree par Alex Robert !!!", 0, 3, 0x0f);
}
