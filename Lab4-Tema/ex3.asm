; Inversarea unui vector de octeți aflat în memorie. Considerăm un vector care conține
;  numele și prenumele programatorului sub forma „Nume Prenume“. 
; String-ul va fi modificat sub forma „PRENUME Nume“, în memorie. Afișați în terminal noul string.

section .text

global _start
_start:
    mov ecx, len
    mov esi, string
loop_start:
    inc esi
    cmp byte [esi], ' '
    je foud_space
    loop loop_start

foud_space:
    inc esi

    mov edi, string2
loop_copiere_prenume:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp byte [esi], 0xa
    jne loop_copiere_prenume

    mov byte [edi], ' '
    inc edi
    mov esi, string

loop_copiere_nume:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    cmp byte [esi], ' '
    jne loop_copiere_nume

    mov esi, string
    mov edi, string2

    mov ecx, len
loop_copiere_string2_string:
    mov al, [edi]
    mov [esi], al
    inc edi
    inc esi
    loop loop_copiere_string2_string

    mov al, 0xa
    mov [esi], al


    mov eax, 4
    mov ebx, 1
    mov ecx, string
    mov edx, len+1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
section .data
    string db "Vladuceanu Tudor", 0xa
    len equ $ - string
    string2 db len