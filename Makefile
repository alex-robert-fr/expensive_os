COMPILE		=	./i386elfgcc/bin/
CC			=	$(COMPILE)i386-elf-gcc
LD			=	$(COMPILE)i386-elf-ld
GDB			=	$(COMPILE)i386-elf-gdb
NAME		=	expensive_os
BOOT_SRC	=	./src/boot/boot.s
KERNEL_SRC	=	./src/kernel/kernel.c
PORTS_SRC	=	./src/drivers/ports.c
SCREEN_SRC	=	./src/drivers/screen.c
MICROLIB_SRC=	./src/microlib/printchar.c
OBJ			=	${KERNEL_SRC:.c=.o} ${PORTS_SRC:.c=.o} ${SCREEN_SRC:.c=.o} ${MICROLIB_SRC:.c=.o}

all: $(NAME)

$(NAME): boot.bin kernel.bin kernel.elf
	cat $^ > $(NAME).bin

boot.bin:
	fasm $(BOOT_SRC) $@

kernel.bin: $(OBJ)
	$(LD) -o $@ -Ttext 0x1000 $^ --oformat binary

kernel.elf: $(OBJ)
	$(LD) -o $@ -Ttext 0x1000 $^

%.o: %.c
	$(CC) -ffreestanding -c $^ -o $@

run: $(NAME)
	bochs

debug: $(NAME)
	$(GDB) $(NAME).bin -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

clear:
	rm -rf kernel.bin boot.bin expensive_os.bin kernel.elf $(OBJ)

re: clear all

%.o: %.asm
	fasm $< $@
