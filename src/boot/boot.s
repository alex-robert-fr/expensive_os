_start:
    jmp $

    ; Remplie 510 octets 0, depuis l'adresse du début du programme($$) jusqu'à l'adresse actuel du programme($)
    times 510-($-$$) db 0
    dw 0xaa55