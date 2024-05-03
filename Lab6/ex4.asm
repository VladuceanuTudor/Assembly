BITS 32

section .text

global _start

interschimbare_prin_adresa:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    mov ebx, [ebp+12]
    mov ecx, [eax]
    mov edx, [ebx]
    mov [eax], edx
    mov [ebx], ecx

    mov esp, ebp
    pop ebp
    ret

interschimbare_prin_valoare:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    mov ebx, [ebp+12]
    lea ecx, [ebp+8]
    lea edx, [ebp+12]
    mov [ecx], ebx
    mov [edx], eax

    mov esp, ebp
    pop ebp
    ret

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, var1
    mov edx, 2
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, var2
    mov edx, 2
    int 0x80

    push var2
    push var1
    call interschimbare_prin_adresa
    add esp, 8

    mov eax, 4
    mov ebx, 1
    mov ecx, var1
    mov edx, 2
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, var2
    mov edx, 2
    int 0x80

    push dword [var2]
    push dword [var1]
    call interschimbare_prin_valoare
    add esp, 8

    mov eax, 4
    mov ebx, 1
    mov ecx, var1
    mov edx, 2
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, var2
    mov edx, 2
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80


section .data
    var1 db "10"
    var2 db "20"