#include "../drivers/screen.h"

void	printchar(char c, int x, int y)
{
	int				offset;
	unsigned char	*vga = (unsigned char*)VIDEO_ADDRESS;

	offset = get_offset(x, y);
	vga[offset] = c;
	vga[offset + 1] = THEME;
}
