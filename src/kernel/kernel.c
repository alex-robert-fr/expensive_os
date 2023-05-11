#include "../drivers/screen.h"
#include "../drivers/ports.h"
#include "../microlib/microlib.h"

int    main(void)
{
    clear_screen();
	printchar('a', 0, 0);
	//printstr("yolo", 0, 1);
}
