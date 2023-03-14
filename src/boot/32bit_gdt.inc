; Cette partie là me semble plutôt complexe
; Je vais donc pas mal la commenter pour mon propre apprentissage xD
; C'est partie !
gdt_start:
    ; le GDT commence avec 8 octets null
    dd 0x0 ; 4 octets
    dd 0x0 ; 4 octets
gdt_code:       ;descripteur du segement de code
    ; db 8 octets
    ; dw 16 octets
    dw 0xffff   ; longueur du segment, octets 0-15
    dw 0x0      ; base, octets 0-15
    db 0x0      ; base, octets 16-23
    db 10011010b; flags (8 octets)
    db 11001111b; flags (4 octets) + longueur du segment, octets 16-19
    db 0x0      ; base, octets 24-31

; il est 3h57 du matin je commmenterais le reste plus tard je veux juste voir si ca fonctionne x)
gdt_data:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end:

gdt_descriptor
    dw gdt_end - gdt_start - 1
    dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
