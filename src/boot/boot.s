use16
org 0x7c00

_start:
    mov [BOOT_DRIVE], dl
    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call println

    mov bx, MSG_ALEX
    call println

    jmp $

include 'print.inc'

BOOT_DRIVE: db 0
MSG_REAL_MODE: db 'Demarrage en 16-bits mode reel', 0
MSG_ALEX : db 'Produit par Alex Robert', 0

; Remplie 510 octets 0, depuis l'adresse du début du programme($$) jusqu'à l'adresse actuel du programme($)
times 510-($-$$) db 0
dw 0xaa55
