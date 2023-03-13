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
        cmp cx, 4
        je end_hex

        mov ax, dx
        and ax, 0x000f
        add al, 0x30
        cmp al, 0x39
        jle step2
        add al, 7

    step2:
    mov bx, HEX_OUT + 5
    sub bx, cx
    mov [bx], al
    ror dx, 4

    add cx, 1
    jmp hex_loop

    end_hex:
        mov bx, HEX_OUT
        call print

        pop dx
        pop dx
        pop dx
        pop ax
        ret

    HEX_OUT:
        db '0x0000', 0
