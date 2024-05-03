; Calculați suma unui vector de 5 întregi și afișați valoarea în terminal. 
; Fiecare element ocupă 4 octeți. Transformați valoarea binară a sumei într-un 
; string de afișare corespunzător, e.g., valoarea 0x0C va fi transformată în 
; string-ul de afișare 0x3132 („12“).
;  Utilizați adresare indirectă prin registru index (cu factor de scală) și deplasament.

BITS 32

section .data
    vector dd 10, 20, 30, 40, 50
    suma db 10 dup(0)
section .text
    global _start

_start:
    mov edi, 0
    mov ecx, 5
    mov ebx, 0
loop_sum:
    mov eax, [vector+4*ebx]
    add edi, eax
    inc ebx
    loop loop_sum

    mov ebx, 0
    mov eax, edi
loop_nr_cif:
    inc ebx
    mov ecx, 10
    xor edx, edx
    div ecx
    cmp eax, 0
    jne loop_nr_cif


    mov ecx, ebx
    mov esi, ebx
    mov ebx, 10
    mov eax, edi
loop_int_to_string:
    
    xor edx, edx
    div ebx
    add edx, 0x30
    mov byte [suma+ecx-1], dl
    loop loop_int_to_string

    mov eax, 4
    mov ebx, 1
    mov ecx, suma
    mov edx, esi
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80






