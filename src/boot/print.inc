print:
    push ax
    push bx

    mov ah, 0x0e    ; Ecrit un caractère en mode TTY
    start:
        mov al, [bx]
        cmp al, 0
        je done

        int 0x10        ; Interruption système

        add bx, 1
        jmp start
    
    done:
        pop bx
        pop ax
        ret

println:
    push ax
    push bx

    call print

    mov ah, 0x0e
    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10

    pop bx
    pop ax
    ret

print_hex:
    push ax
    push bx
    push bx
    push dx

    mov cx, 0

    hex_loop:
        cmp cx, 4           ; si CX == 4 jump vers 'end_hex'
        je end_hex

        mov ax, dx          ; copie DX dans AX
        and ax, 0x000f      ; utilise un masque sur AX grâce à AND (0x73a6 & 0x000f = 0x6)
        add al, 0x30        ; ajoute 0x30 à AL (0x6 + 0x30 = 0x36 = '6')
        cmp al, 0x39        ; si AL >= 0x30 && AL <= 0x39 == 0..=9
        jle step2
        add al, 7           ; sinon AL == a..=f donc on ajoute 7

    step2:
        mov bx, HEX_OUT + 5 ; chaine + longueur (HEX_OUT + 5 = 0x0000 = 0x73a6 | HEX_OUT + 4 = 0x0000 = 073a60)
        sub bx, cx          ; index bx -= cx                        ^                              ^
        mov [bx], al        ; copie AL dans la string BX au bon index
        ror dx, 4           ; A chaque passage dx subit un bit shit vers la droite
                            ; ce qui permet de passer en revu tout les chiffres pour le masque
                            ; 0x73a6 & 0x000f = 0x6
                            ; 0x73a6 >> 1 = 0x673a
                            ; 0x673a & 0x000f = 0xa
                            ; ...
        add cx, 1
        jmp hex_loop

    end_hex:
        mov bx, HEX_OUT
        call println

        pop dx
        pop dx
        pop dx
        pop ax
        ret

    HEX_OUT:
        db '0x0000', 0
