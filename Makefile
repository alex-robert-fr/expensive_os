COMPILE		=	/usr/local/i386elfgcc/bin/
CC			=	$(COMPILE)i386-elf-gcc
LD			=	$(COMPILE)i386-elf-ld
NAME		=	expensive_os
BOOT_SRC	=	./src/boot/boot.s

all: $(NAME)

$(NAME): boot.bin kernel.bin
	cat $^ > $(NAME).bin

boot.bin:
	fasm $(BOOT_SRC) $@

kernel.bin: kernel.o
	$(LD) -o $@ -Ttext 0x1000 $^ --oformat binary


kernel.o:
	$(CC) -ffreestanding -c ./src/boot/kernel.c -o $@
	
run: $(NAME)
	bochs

clear:
	rm kernel.o kernel.bin boot.bin expensive_os.bin

re: clear all