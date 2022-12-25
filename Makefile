NAME=expensive_os
ASMCC=fasm
CC=gcc
BOOT_DIR=boot/
BOOT_SRC=$(BOOT_DIR)boot.asm
KERNEL_DIR=kernel/
KERNEL_SRC=$(KERNEL_DIR)kernel.c
VM=qemu-system-x86_64
SECTOR=32


all: $(NAME)

$(NAME): bootloader kernel.bin
	cat boot.bin kernel.bin > $@.bin
	rm boot.bin kernel.bin kernel.o

bootloader:
	$(ASMCC) $(BOOT_SRC) boot.bin
	dd if=/dev/zero of=$(NAME).bin bs=512 count=$(SECTOR)
	dd if=boot.bin of=$(NAME).bin bs=512 conv=notrunc

kernel.bin:
	$(CC) -ffreestanding -c $(KERNEL_SRC) -o kernel.o
	ld -o $@ -Ttext 0x1000 kernel.o --oformat binary

run: $(NAME)
	$(VM) $(NAME).bin
	
clear:
	rm $(NAME).bin

