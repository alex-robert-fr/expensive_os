; ax -> 0x1fbf
; if ax >= 16
; 	on divise ax et on rappele la fonction
; recuperer le modulo
;
;	(diviser) 0x1fbf / 16 = 0x01fb  | (modulo) 0x1fbf % 16 = 0xf
;	(diviser) ax / bx = ax 		| (modulo) ax % bx = dx
;
; affiche
; ax -> W  et dx -> R







; prend en parametre le nombre en hexadecimal dans le registre ax
; prend en parametre une chaine de caractere "0x0000" dans le registre bx
puthexa:
	pusha
	xor dx, dx	; dx = 0
	mov bx, 16	; bx = 16
	div bx		; ax / bx = ax
	
	cmp ax, 16
	jge .great
;	jge puthexa
.end:
	popa
	ret
.write:
	pusha
	mov ah, 0x0e
	add dx, 0x30
	mov al, dl
	int 0x10
	mov ax, 0x1f57
	popa
	jmp .end

.great:
	pusha
	mov ah, 0x0e
	mov bx, HEXASCCI
	call putstr
	popa
	cmp dx, 7
	je .write
	HEXASCCI db '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 0ah, 0dh, 0
