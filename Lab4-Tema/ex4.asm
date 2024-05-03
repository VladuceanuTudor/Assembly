
section .text

global _start

_start:

    mov esi, string
    mov ecx, len
start_loop:
    mov bl, [esi]
    and bl, 1

    cmp byte bl, 1
    je odd
    inc eax

odd:
    inc esi
    loop start_loop

    add eax, '0'
    push eax

    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 1
    int 0x80

    pop eax

    mov eax, 0xa
    push eax

    mov eax, 4
    mov ebx, 1
    mov ecx, esp
    mov edx, 1
    int 0x80

    pop eax

    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    string db 1,2,3,4,5,6,7,8,9
    len equ $ - string