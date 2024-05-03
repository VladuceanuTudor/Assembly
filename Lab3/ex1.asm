BITS 32
 
    section .text
    global _start
 
_start: mov eax, 1
        xor ebx, ebx
        int 0x80
 
    section .data
 
a_byte      db  42                          ; un octet
a_word      dw  42                          ; un cuvant pe 16 biți
a_string    db "This is a string.", 10, 0   ; un șir de caractere
a_float     dd  3.14                        ; un numar în virgulă mobilă cu precizie simplă
an_array    dw  0x20, 0x43, 0x31            ; un vector de variabile pe 16 biți