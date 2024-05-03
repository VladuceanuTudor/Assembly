
BITS 32

section .text
global _start

int_to_ascii:

	; prolog
	push    ebp
	mov     ebp, esp
	;parametrul (int)
	mov eax, [ebp+8]

	mov ecx, 0
    mov ebx, 10
loop_spargere:	;spargem int-ul in cifre si pe rand incarcam cifra cu cifra in stiva(push edx)
    inc ecx
    xor edx, edx 
    div ebx
	add edx, 0x30
    push edx
    cmp eax, 0
    jne loop_spargere

	push ecx
						;afisam din stiva(optional)
	mov     eax, 4
	mov     ebx, 1
	mov     ecx, esp
	mov     edx, 20		;valoare hardcodata in acest caz pentru test
	int     0x80

	pop ecx

	mov edi, ecx
    mov eax, 0

	
loop_pop_in_suma:
    pop edx 
    mov byte [rezultat+eax], dl		;punerea valorii in format ascii in variabila globala rezultat
    ;pop edx
    inc eax
    loop loop_pop_in_suma

	; epilog
	mov     esp, ebp
	pop     ebp
	ret

;-------------------------------------------------------------
putere:
    ; prolog
	push    ebp
	mov     ebp, esp
	
	;alocam var locala
	sub esp, 4
	mov ecx, [ebp+8]
	mov ebx, [ebp+12]
	mov eax, 1

inmultire:
	mul ebx			;edx se face 0 dupa mul!
	loop inmultire
	
	; epilog
	mov     esp, ebp
	pop     ebp
	ret

;----------------------------------------------------------------------------------------------------------------------
_start:
	; a = 5 si b = 5
	push    5
	push    5
	call    putere
    add esp, 8 ;echivalentul a da e doua ori pop
	
	push eax
	call 	int_to_ascii
	add esp, 4
    inc edi

	; mov     eax, 4
	; mov     ebx, 1
	; mov     ecx, rezultat
	; mov     edx, edi
	; int     0x80
 
	mov     eax, 1
	xor     ebx, ebx
	int     0x80

    section .data
    rezultat dd 0
    newline db 0xa