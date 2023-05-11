#ifndef SCREEN_H
#define SCREEN_H

#define VIDEO_ADDRESS 0xb8000
#define MAX_ROWS 25
#define MAX_COLS 80

void    clear_screen();
void    set_cursor_offset(int offset);
int     print_char(char c, int x, int y, char attr);
void    print_string(char *str, int x, int y, char attr);
int     get_offset(int x, int y);
int     get_cursor_offset();
int     get_offset_row(int offset);
int     get_offset_col(int offset);

#endif
