NAME			=	expensive_os
ASM_COMPILER	=	fasm
BOOT_SOURCES	=	./src/boot/boot.s
BUILD_DIR		= 	./build/

all: $(NAME)

$(NAME): boot.bin

boot.bin: 
	mkdir -p $(BUILD_DIR)
	$(ASM_COMPILER) $(BOOT_SOURCES) $(BUILD_DIR)$@
