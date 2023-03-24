COMPILE		=	/usr/local/i386elfgcc/bin/
CC			=	$(COMPILE)i386-elf-gcc
LD			=	$(COMPILE)i386-elf-ld
GDB			=	$(COMPILE)i386-elf-gdb
NAME		=	expensive_os
BOOT_SRC	=	./src/boot/boot.s
KERNEL_SRC	=	./src/kernel/kernel.c
PORTS_SRC	=	./src/drivers/ports.c
SCREEN_SRC	=	./src/drivers/screen.c

all: $(NAME)

$(NAME): boot.bin kernel.bin kernel.elf
	cat $^ > $(NAME).bin

boot.bin:
	fasm $(BOOT_SRC) $@

kernel.bin: kernel.o ports.o screen.o
	$(LD) -o $@ -Ttext 0x1000 $^ --oformat binary

kernel.elf: kernel.o ports.o screen.o
	$(LD) -o $@ -Ttext 0x1000 $^

kernel.o:
	$(CC) -ffreestanding -c $(KERNEL_SRC) -o $@

ports.o:
	$(CC) -ffreestanding -c $(PORTS_SRC) -o $@

screen.o:
	$(CC) -ffreestanding -c $(SCREEN_SRC) -o $@

run: $(NAME)
	bochs

debug: $(NAME)
	$(GDB) $(NAME).bin -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

clear:
	rm kernel.o kernel.bin boot.bin expensive_os.bin kernel.elf ports.o screen.o

re: clear all

# bochs
# target remote localhost:1234
# symbol-file kernel.elf
# b main
# c
# layout asm
# ni
# p $eax