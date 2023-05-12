COMPILE		=	./i386elfgcc/bin/
CC			=	$(COMPILE)i386-elf-gcc
LD			=	$(COMPILE)i386-elf-ld
GDB			=	$(COMPILE)i386-elf-gdb
NAME		=	expensive_os
BOOT_SRC	=	./src/boot/boot.s
C_SOURCES	=	$(wildcard src/kernel/*.c src/drivers/*.c src/microlib/*.c)
H_SOURCES	=	$(wildcard src/kernel/*.h src/drivers/*.h src/microlib/*.h)
OBJ_SOURCES	=	${C_SOURCES:.c=.o}

all: $(NAME)

$(NAME): boot.bin kernel.bin kernel.elf
	cat $^ > $(NAME).bin

boot.bin:
	fasm $(BOOT_SRC) $@

kernel.bin: $(OBJ_SOURCES)
	$(LD) -o $@ -Ttext 0x1000 $^ --oformat binary

kernel.elf: $(OBJ_SOURCES)
	$(LD) -o $@ -Ttext 0x1000 $^

run: $(NAME)
	bochs

debug: $(NAME)
	$(GDB) $(NAME).bin -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"

%.o: %.c $(H_SOURCES)
	$(CC) -ffreestanding -c $< -o $@

clear:
	rm -rf kernel.bin boot.bin expensive_os.bin kernel.elf $(OBJ_SOURCES)

re: clear all

%.o: %.asm
	fasm $< $@
