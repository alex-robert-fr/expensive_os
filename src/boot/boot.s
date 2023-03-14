org 0x7c00

jmp _start
include 'print.inc'
include 'disk.inc'
_start:
    mov bp, 0x8000
    mov sp, bp

    mov bx, 0x9000
    mov dh, 2
    call disk_load

    mov dx, [0x9000]
    call print_hex

    mov dx, [0x9000 + 512]
    call print_hex

    jmp $

    ; Remplie 510 octets 0, depuis l'adresse du début du programme($$) jusqu'à l'adresse actuel du programme($)
    times 510-($-$$) db 0
    dw 0xaa55

    times 256 dw 0xdada
    times 256 dw 0xface