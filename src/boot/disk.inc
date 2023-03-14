disk_load:
    push ax
    push bx
    push cx
    push dx

    push dx

    mov ah, 0x02            ; read int 0x13
    mov al, dh              ; nombre de secteur a lire
    mov cl, 0x02            ; numero du secteur, 0x01 secteur de démarrage, 0x02 premier secteur "disponible"
    mov ch, 0x00            ; numero du cylindre
    mov dh, 0x00            ; numero de tête
    int 0x13
    jc disk_error           ; si erreur carry != 0 (bit de retenu)

    pop dx
    cmp al, dh              ; le BIOS renvoie le nombre de secteur lu dans AL
                            ; on compare donc AL et DH pour savoir s'il y a une erreur
    jne sectors_error
    pop dx
    pop cx
    pop bx
    pop ax
    ret

disk_error:
    mov bx, DISK_ERROR
    call println
    mov dh, ah
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call println

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0
