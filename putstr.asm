putstr:
	pusha
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

