use32

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0xce

print_string_pm:
    push eax
    push ebx
    push edx

    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, byte [ebx]
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je print_string_pm_done

    mov word [edx], ax
    add ebx, 1
    add edx, 2

    jmp print_string_pm_loop

print_string_pm_done:
    pop edx
    pop ebx
    pop eax
    ret
