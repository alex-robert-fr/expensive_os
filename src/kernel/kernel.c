#include "../drivers/screen.h"
#include "../microlib/microlib.h"

int    main(void)
{
	unsigned char	*vga = (unsigned char*)0xb8000;

	clear_screen();
	vga[0] = 'H';
	vga[1] = 0x0f;
	kernel_print_char('Y', 79, 24, 0x0C);
	return (0);
}
