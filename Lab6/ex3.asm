BITS 32
;CMMMDC
section .text
global _start
cmmdc:
    ; prolog
	push    ebp
	mov     ebp, esp
	
    mov esi, [ebp+8]
    mov edi, [ebp+12]

    cmmdc_loop_start:

        cmp esi, edi
        je done_calculating
        jl f_smaller
            sub esi, edi
            jmp dupa_f_smaller
        f_smaller: 
            sub edi, esi
        dupa_f_smaller:
        jmp cmmdc_loop_start

    done_calculating:

        mov [rezultat], esi

	; epilog
	mov     esp, ebp
	pop     ebp
	ret
;-------------------------------------------------------------------
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

    mov eax, ecx
    mov edi, 4
    mul edi
    mov edi, eax

	push ecx
						;afisam din stiva(optional)
	mov     eax, 4
	mov     ebx, 1
	lea     ecx, [esp+4]
	mov     edx, edi		;valoare hardcodata in acest caz pentru test
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
;-------------------------------------------------------------------
_start:
	; a = 26, b = 39
	push    39
	push    26
	call    cmmdc
    add esp, 8 ;echivalentul a da e doua ori pop
    
    mov eax, [rezultat]
    push eax

    call int_to_ascii
    add esp, 4
    
	mov     eax, 1
	xor     ebx, ebx
	int     0x80

section .data
    rezultat dd 0
    newline db 0xa