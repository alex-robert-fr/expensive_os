; bx MESSAGE string

putstr:
	push ebp
	mov ebp, esp
	push ax
	mov ah, 0x0e
.loop:
	mov al, [bx]
	cmp al, 0
	jne .iter
	pop ax
	mov esp, ebp
	pop ebp
	ret
.iter:
	int 0x10
	add bx, 1
	jmp .loop

