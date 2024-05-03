BITS 32

section .data
 matrice db 0x0, 0x1, 0x2, 0x3
         db 0x4, 0x5, 0x6, 0x7
         db 0x8, 0x9, 0xa, 0xb
         db 0xc, 0xd, 0xe, 0xf
 matrice_t db 16 dup(0)
 newline db 0xa

section .text
    global _start

_start:
    mov ecx, 16
    mov esi, matrice
    mov edi, matrice_t

loop_matr:
    mov al, [esi]
    mov [edi], al
    inc esi
    add edi, 4


    xor edx, edx
    mov eax, ecx
    dec eax
    push ecx
    mov ecx, 4
    div ecx
    pop ecx
    cmp edx, 0
    jne fara_reset
        sub edi, 15
fara_reset:

        loop loop_matr



    mov ecx, 4
  
    mov ebx, 1
    mov edi, matrice_t
    mov edx, 1
loop_print:
    push ecx
    mov ecx, 4
inner_loop_print:
    mov eax, 4
    push ecx
    add byte [edi], 0x30
    mov ecx, edi
    inc edi
    int 0x80
    ;sub byte [edi], 0x30
    pop ecx
    loop inner_loop_print
    mov eax, 4
    mov ecx, newline
    int 0x80
    pop ecx
    loop loop_print

    mov eax,1 
    mov ebx, 0
    int 0x80



