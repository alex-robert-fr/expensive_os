void main(void);

void test(void)
{
	unsigned char	*vga = (unsigned char*)0xb8000;

	vga[0] = 'E';
	vga[1] = 0x0f;

}

void    main(void)
{
	unsigned char	*vga = (unsigned char*)0xb8000;

	vga[0] = 'H';
	vga[1] = 0x0f;
}
