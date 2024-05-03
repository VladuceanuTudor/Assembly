BITS 32

section .text
global _start
sum:
    ; prolog
	push    ebp
	mov     ebp, esp
	; alocare spațiu pentru o variabilă locală
	sub     esp, 4
 
	; adunare și salvare rezultat în variabila locală
	mov     ebx, [ebp + 8]
	add     ebx, [ebp + 12]
	mov     [ebp - 4], ebx
 
	; return rezultat
	mov     eax, [ebp - 4]
 
	; epilog
	mov     esp, ebp
	pop     ebp
	ret
_start:
	; a = 3 si b = 2
	push    2
	push    3
	call    sum
    add esp, 8 ;echivalentul a da e doua ori pop
 
    add eax, 0x30
    mov [rezultat], eax
    ;mov rezultat, eax
	mov     eax, 4
	mov     ebx, 1
	mov     ecx, rezultat
	mov     edx, 4
	int     0x80
 
	mov     eax, 1
	xor     ebx, ebx
	int     0x80

    section .data
    rezultat dd 0
    newline db 0xa