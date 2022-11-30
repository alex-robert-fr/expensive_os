use16
org 0x7c00
jmp _start

include 'puthexa.asm'
include 'putstr.asm'

_start:
	;print hello world
	mov bx, HELLO_MSG
	mov ah, 0x0e
	call putstr
	
	;print ascci
	mov ax, 0x1fbf
	mov bx, HEX_OUT
	call puthexa

	HELLO_MSG: db 'Hello world!', 0ah, 0dh, 0
	HEX_OUT: db '0x0000', 0ah, 0dh, 0

	times 510-($-$$) db 0
	dw 0xaa55

