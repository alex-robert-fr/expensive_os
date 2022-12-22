; bx MESSAGE string

putstr:
	pusha
	mov ah, 0x0e
.loop:
	mov al, [bx]
	cmp al, 0
	jne .iter
	popa
	ret
.iter:
	int 0x10
	add bx, 1
	jmp .loop

