COMPILE		=	./i386elfgcc/bin/
CC			=	$(COMPILE)i386-elf-gcc
LD			=	$(COMPILE)i386-elf-ld
GDB			=	$(COMPILE)i386-elf-gdb
NAME		=	expensive_os
BOOT_SRC	=	./src/boot/boot.s

all: $(NAME)

$(NAME): boot.bin
	cat $^ > $(NAME).bin

boot.bin:
	fasm $(BOOT_SRC) $@

run: $(NAME)
	bochs

debug: $(NAME)
	$(GDB) $(NAME).bin -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

%.o: %.c $(H_SOURCES)
	$(CC) -ffreestanding -c $< -o $@

clear:
	rm -rf kernel.bin boot.bin expensive_os.bin kernel.elf $(OBJ_SOURCES)

re: clear all

# bochs
# target remote localhost:1234
# symbol-file kernel.elf
# b main
# c
# layout asm
# ni
# p $eax
