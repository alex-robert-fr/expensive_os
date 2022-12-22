NAME=expensive_os
CC=fasm
SRC=boot.asm
VM=qemu-system-x86_64
SECTOR=32


all: $(NAME)

$(NAME):
	$(CC) $(SRC) boot.bin
	dd if=/dev/zero of=$@.bin bs=512 count=$(SECTOR)
	dd if=boot.bin of=$@.bin bs=512 conv=notrunc

run: $(NAME)
	$(VM) $(NAME).bin
	
clear:
	rm $(NAME).bin boot.bin
