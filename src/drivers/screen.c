#include "ports.h"
#include "screen.h"

void    clear_screen()
{
    unsigned char    *screen = (unsigned char*)VIDEO_ADDRESS;
    int     screen_size = MAX_COLS * MAX_ROWS;
    int     i;

    for (i = 0; i < screen_size; i++)
    {
        screen[i * 2] = ' ';
        screen[i * 2 + 1] = THEME;
    }
}

void    set_cursor_offset(int offset)
{
    offset /= 2;
    port_byte_out(0x3d4, 0x0F);
    port_byte_out(0x3d5, offset & 0xFF);
    port_byte_out(0x3d4, 0x0E);
    port_byte_out(0x3d5, (offset >> 8) & 0xFF);
}

int print_char(char c, int x, int y, char attr)
{
    unsigned char    *vga = (unsigned char*)VIDEO_ADDRESS;

    if (!attr)
        attr = THEME;
    if (x >= MAX_COLS || y >= MAX_ROWS)
    {
        vga[2 * MAX_COLS * MAX_ROWS - 2] = 'E';
        vga[2 * MAX_COLS * MAX_ROWS - 1] = 0x4f;
        return (get_offset(x, y));
    }
    
    int offset;
    if (x >= 0 && y >= 0)
        offset = get_offset(x, y);
    else
        offset = get_cursor_offset();

    if (c == '\n')
    {
        y = get_offset_row(offset);
        offset = get_offset(0, y + 1);
    }
    else
    {
        vga[offset] = c;
        vga[offset + 1] = attr;
        offset += 2;
    }
    set_cursor_offset(offset);
    return (offset);
}

void    print_string(char *str, int y, int x, char attr)
{
    int offset;
    if (x >= 0 && y >= 0)
        offset = get_offset(x, y);
    else
    {
        offset = get_cursor_offset();
        x = get_offset_col(offset);
        y = get_offset_row(offset);
    }

    for (int i = 0; str[i]; i++)
    {
        offset = print_char(str[i], x, y, attr);
        y = get_offset_row(offset);
        x = get_offset_col(offset);
    }
}

int get_offset(int x, int y)
{
    return (2 * (x + y * MAX_COLS));
}

int get_offset_row(int offset)
{
    return (offset / (2 * MAX_COLS));
}

int get_offset_col(int offset)
{
    return ((offset - (get_offset_row(offset) * 2 * MAX_COLS)) / 2);
}

int get_cursor_offset()
{
    port_byte_out(0x3d4, 0x0e);
    int offset = port_byte_in(0x3d5) << 8;
    port_byte_out(0x3d4, 0x0f);
    offset += port_byte_in(0x3d5);
    return (offset * 2);
}
