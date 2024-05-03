; Calculați suma elementelor ultimei coloane a unei matrice de 64 octeți (4×4 DD). 
; Afișați valoarea sumei în terminal utilizând algoritmul de transformare a valorii 
; binare în string de afișare. Utilizați 
; adresare indirectă prin registru bază, registru index (cu factor de scală) și deplasament.

 BITS 32

 section .data
    matr dd 1, 2, 3, 4
         dd 5, 6, 7, 8
         dd 9, 10, 11, 12
         dd 130, 140, 150, 160
    sum db 4 dup(0)

section .text
global _start

_start:
    mov ecx, 4
    mov ebx, 0
    mov eax, 0
loop_start:
    add eax, [matr+ebx*4+12] ; e stric: unregistru  nu are voie sa fie inmultitdecat cu 2 4 si 8
    add ebx, 4
    loop loop_start

    mov ecx, 0
    mov ebx, 10
loop_spargere:
    inc ecx
    xor edx, edx 
    div ebx
    push edx
    cmp eax, 0
    jne loop_spargere

    mov edi, ecx
    mov eax, 0
loop_pop_in_suma:
    pop edx ;de intrebat de ce la ultimul 5 da push de doua ori
    add edx, 0x30
    mov byte [sum+eax], dl
    ;pop edx
    inc eax
    loop loop_pop_in_suma

    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, edi
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80