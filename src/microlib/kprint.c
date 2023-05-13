#include "microlib.h"
#include "../drivers/screen.h"

int	kputc(char c, int x, int y, char attr)
{
	int				offset;
	unsigned char	*vga = (unsigned char*) VIDEO_ADDRESS;

	offset = get_offset(x, y);
	if (offset > 3998)
		offset = 2;
	vga[offset] = c;
	vga[offset + 1] = attr;
	return (offset);
}

int	kputstr(char *str, int x, int y, char attr)
{
	for (int i = 0; str[i]; i++) {
		kputc(str[i], x, y, attr);
		x++;
	}
	return (0);
}
