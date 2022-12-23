use16
org 0x7c00

;include 'puthexa.asm'
;include 'disk_load.asm'

_start:
	mov bp, 0x9000
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call putstr

	call switch_to_pm

	jmp $

	include 'putstr.asm'
	include 'gdt.asm'
	include 'switch_to_pm.asm'
	include 'print_string_pm.asm'

use32
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	;mov ebx, 0xb8000
	;mov al, '!'
	;mov ah, 0x0f
	;mov [ebx], ax
	call print_string_pm

	jmp $
	
	MSG_REAL_MODE: db "Started in 16-bit Real Mode", 0
	MSG_PROT_MODE: db "Successfully landed in 32-bit Protected Mode", 0

	times 510-($-$$) db 0
	dw 0xaa55
