use16
org 0x7c00
KERNEL_OFFSET equ 0x1000

_start:
    mov [BOOT_DRIVE], dl
    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call println

    call load_kernel
    call switch_to_pm

    jmp $

include 'print.inc'
include 'disk.inc'
include '32bit_gdt.inc'
include '32bit_print.inc'
include '32bit_switch.inc'

use16
load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call println
    mov bx, KERNEL_OFFSET
    mov dh, 2
    mov dl, [BOOT_DRIVE]
    call disk_load
    ret

use32
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm
    call KERNEL_OFFSET
    jmp $

BOOT_DRIVE: db 0
MSG_REAL_MODE: db 'Demarrage en 16-bits mode reel', 0
MSG_PROT_MODE: db 'Demarrage en 32-bits mode protege', 0
MSG_LOAD_KERNEL: db 'Chargement du kernel en memoire', 0

; Remplie 510 octets 0, depuis l'adresse du début du programme($$) jusqu'à l'adresse actuel du programme($)
times 510-($-$$) db 0
dw 0xaa55
