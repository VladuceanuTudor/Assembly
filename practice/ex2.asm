global _start

section .text
_start:
    push mesaj
    call func
    pop mesaj
    mov eax, 1
    mov ebx, 0
    int 0x80

func:
    push ebp
    mov ebp, esp
    
    mov eax, 4
    mov ebx, 1
    mov [ecx], esp+4
    mov edx, lungime

    int 0x80

    mov esp, ebp
    pop ebp

    ret

section .data
    mesaj db "Mesaj de test!", 10
    lungime equ $ - mesaj