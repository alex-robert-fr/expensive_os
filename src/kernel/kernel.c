#include "../microlib/microlib.h"
#include "../drivers/screen.h"

int    main(void)
{
    clear_screen();
	kernel_print_char('A');
}
