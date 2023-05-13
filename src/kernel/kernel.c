#include "../microlib/microlib.h"
#include "../drivers/screen.h"

int    main(void)
{
	char *word = "Alex";

	clear_screen();
	kputc('X', 0, 0, 0xfC);
	kputc(word[0], 5, 4, 0xfC);
	return (0);
}
