#include "screen.h"

void clear_screen()
{
    char    *screen = VIDEO_ADDRESS;
    int     screen_size = MAX_COLS * MAX_ROWS;
    int     i;

    for (i = 0; i < screen_size; i++)
    {
        screen[i * 2] = 'a';
        screen[i * 2 + 1] = 0x4c;
    }
}