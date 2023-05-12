#include "../drivers/screen.h"
#include "microlib.h"

int	kernel_print_char(char c)
{
	int				offset;
	unsigned char	*vga = (unsigned char*)VIDEO_ADDRESS;
	
	vga[offset] = c;
	vga[offset + 1] = THEME;
	return (offset);
}
