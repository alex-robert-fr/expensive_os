use16
org 0x7c00
jmp _start

include 'puthexa.asm'
include 'putstr.asm'
include 'disk_load.asm'

_start:
	mov [BOOT_DRIVE], dl

	mov bp, 0x8000
	mov sp, bp

	mov bx, 0x9000
	mov dh, 5
	mov dl, [BOOT_DRIVE]
	call disk_load

	mov ax, [0x9000]
	mov bx, HEX_OUT
	call puthexa
	call putstr
	
	mov dx, [0x9000 + 512]
	mov ax, dx
	mov bx, HEX_OUT
	call puthexa
	call putstr

	jmp $

	HELLO_MSG: db 'Hello world!', 0ah, 0dh, 0
	HEX_OUT: db '0x0000', 0ah, 0dh, 0
	BOOT_DRIVE: db 0

	times 510-($-$$) db 0
	dw 0xaa55
	
	times 256 dw 0xdada
	times 256 dw 0xface

