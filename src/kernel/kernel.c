#include "../drivers/screen.h"
#include "../drivers/ports.h"
#include "../microlib/microlib.h"

int    main(void)
{
    clear_screen();
	print_string("Hello world", 10, 2, 0x3b);
}
