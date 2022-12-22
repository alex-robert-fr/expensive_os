; prend en parametre le nombre en hexadecimal dans le registre ax
; prend en parametre une chaine de caractere "0x0000" dans le registre bx
puthexa:
	pusha
	call .divided
; divise le nombre du registre ax
divide:
	push bx
	xor dx, dx		; dx = 0 / modulo
	xor bx, bx
 	mov bx, 16		; diviseur
	div bx			; ax = result
	pop bx
	call compare
	ret
compare:
	cmp dx, 16
	jl putinbx
putinbx:
	pusha
	add bx
	xor ax, ax
	mov ah, 0x0e
;	popa
;	ret
;compare:
;	pusha
;	mov bx, HEXASCCI
;	cmp dx, 16
;	jl .find
;	add bx, 1
;	jmp compare
;.end:
;	popa
;	ret
;.find:
;	call putchar
;	jmp .end
;putchar:
;	pusha
;	xor ax, ax
;	mov bx, HEXASCCI	
;	mov ah, 0x0e
;	;call putstr
;	add bx, dx
;	mov al, [bx]  
;	int 0x10
;	popa
;	ret

	
HEXASCCI db '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 0
