;Afișarea unui vector de 30 octeți din memorie. 
;Se vor printa doar octeții care se află la adrese 
;pare, începând cu primul octet din segmentul de date.
;Considerăm că primul octet se află la o adresă pară.
;Utilizati apelul de sistem sys_write pentru 
;afișarea vectorului în terminal.


BITS 32

section .text

global _start

print_function:

    push ebp
    mov ebp, esp

    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, 1
    int 0x80
    pop ecx

    mov esp, ebp
    pop ebp 
    ret


_start:
    mov ecx, 30
    mov edi, vector
loop_start:
    call print_function
    add edi, 2
    loop loop_start

    mov eax, 1
    mov ebx, 0
    int 0x80

section .data

    vector db "abXdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabd", 0xa
    ;len equ $ - vector


