org 0x7c00

xor ax, ax
mov ds, ax
cld				; CLear Direction flag, met le flag DF à 0. Ainsi, l'index de la chaîne sera incrémenté (non indécrementé.

mov si, msg
call bios_print

_start:
	jmp _start

msg	db 'Hello World', 13, 10, 0

bios_print:
	lodsb		; Charge l'élément pointé par DS dans AX.
	or al, al	; Verifie la fin de la chaine
	jz done
	mov ah, 0x0e
	mov bh, 0
	int 0x10
	jmp bios_print
done:

	ret
	times 510-($-$$) db 0
	dw 0xaa55
