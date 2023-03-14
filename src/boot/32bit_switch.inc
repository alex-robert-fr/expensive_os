use16
switch_to_pm:
	cli						; 1.désactive les interruption BIOS
	lgdt [gdt_descriptor]	; 2.charge le GDT (Global Desriptor Table)
	mov eax, cr0
	or eax, 0x1				; 3.défini le bit 'mode 32-bits' dans cr0
	mov cr0, eax
	jmp CODE_SEG:init_pm	; 4.saute plus loin dans la mémoire

use32
init_pm:
	mov ax, DATA_SEG
	; 5.met à jours les registres de segements
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000		; 6.met à jour la pile
	mov esp, ebp

	call BEGIN_PM
