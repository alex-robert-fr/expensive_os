org 0x7c00

jmp _start
include 'print.inc'
_start:
    mov bx, titre
    call println

    mov bx, title
    call println

    mov dx, 0x73a6
    call print_hex

    jmp $

    titre:
        db 'Bienvenu sur ExpensiveOS', 0
    title:
        db 'Welcome to ExpensiveOS', 0

    ; Remplie 510 octets 0, depuis l'adresse du début du programme($$) jusqu'à l'adresse actuel du programme($)
    times 510-($-$$) db 0
    dw 0xaa55