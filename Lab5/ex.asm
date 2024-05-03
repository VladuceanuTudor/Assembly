BITS 32
 
    section .text
    global _start
_start:    
    mov     eax, 1
    xor     ebx, ebx
    int     0x80

section .data
    vector dw 10 dup (0)
    matrice dw 5*3 dup (0)