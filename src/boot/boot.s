org 0x7c00

jmp _start
include 'print.inc'
include 'disk.inc'
include '32bit_gdt.inc'
include '32bit_switch.inc'
_start:
    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call println

    call switch_to_pm

    jmp $

use32
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm

    MSG_REAL_MODE: db 'Demarrage en 16-bits mode reel', 0
    MSG_PROT_MODE: db 'Demarrage en 32-bits mode protege', 0

    ; Remplie 510 octets 0, depuis l'adresse du début du programme($$) jusqu'à l'adresse actuel du programme($)
    times 510-($-$$) db 0
    dw 0xaa55
