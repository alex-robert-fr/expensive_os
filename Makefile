NAME		=	expensive_os
BOOT_SRC	=	./src/boot/boot.s

all: $(NAME)

$(NAME):
	fasm $(BOOT_SRC) $(NAME).bin

run: $(NAME)
	bochs