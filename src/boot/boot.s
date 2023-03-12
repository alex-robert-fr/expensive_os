_start:
    mov ah, 0x0e    ; Ecrit un caractère en mode TTY
    mov al, 'H'
    int 0x10        ; Interruption système
    mov al, 'e' 
    int 0x10
    mov al, 'l' 
    int 0x10
    int 0x10        ; 'l' se trouve déjà dans le registre al
    mov al, 'o' 
    int 0x10

    jmp $

    ; Remplie 510 octets 0, depuis l'adresse du début du programme($$) jusqu'à l'adresse actuel du programme($)
    times 510-($-$$) db 0
    dw 0xaa55