; ax hexa value
; bx "0x0000" string

puthexa:
	pusha
	mov cx, 6
	add bx, cx 
.comp:
	cmp cx, 2
	jg .loop
	jmp .end

.loop:
	
	mov dx, ax	; reinitialise dx
	cmp cx, 6
	je .next
	cmp cx, 5
	je .if4
	cmp cx, 4
	je .if3
	shr dx, 12	
.next:
	and dl, 0x0f	; recuperer les 4-bits bas
	cmp dl, 9
	jg .letter
	add dl, 48	; caste en char
.display:
	sub bx, 1 	; decremente bx
	mov [bx], dl	; remplace par la bonne lettre
	sub cx, 1	; decremente le compteur
	jmp .comp

.if4:
	shr dx, 4
	jmp .next
.if3:
	shr dx, 8
	jmp .next
.letter:
	add dl, 87
	jmp .display
.end:
	popa
	ret
