#include "microlib.h"

int	kernel_print_char()
{
	unsigned char* vga = (unsigned char*) 0xb8000;
	vga[0] = 'l';
	vga[1] = 0x02;
	return (0);
}
