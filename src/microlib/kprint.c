#include "microlib.h"
#include "../drivers/screen.h"

int	kernel_print_char(char c, int x, int y, char attr)
{
	int				offset;
	unsigned char*	vga = (unsigned char*) 0xb8000;

	offset = get_offset(x, y);
	vga[offset] = c;
	vga[offset + 1] = attr;
	return (0);
}
