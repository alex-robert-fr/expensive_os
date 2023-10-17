NAME		=	expensive_os
BOOT_SRC	=	./src/boot/boot.s

all: $(NAME)

$(NAME): boot.bin
	cat $^ > $(NAME).bin

boot.bin:
	fasm $(BOOT_SRC) $@

run: $(NAME)
	bochs

clear:
	rm -rf boot.bin expensive_os.bin

re: clear all

# bochs
# target remote localhost:1234
# symbol-file kernel.elf
# b main
# c
# layout asm
# ni
# p $eax
