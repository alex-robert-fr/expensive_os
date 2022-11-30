use16
org 0x7c00
jmp _start

_start:
	mov bx, HELLO_MSG
	mov ah, 0x0e
	call putstr

	HELLO_MSG: db 'Hello world!', 0ah, 0dh, 0

putstr:
	pusha
.loop:
	mov al, [bx]
	int 0x10
	cmp al, 0
	jne .iter
	popa
	ret
.iter:
	add bx, 1
	jmp .loop

	times 510-($-$$) db 0
	dw 0xaa55

