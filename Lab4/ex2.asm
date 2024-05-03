BITS 32
section .text
    global _start
 
_start:
    mov ebx, 15   ; exit status is 15
    mov eax, 1    ; sys_exit system call
    jmp forward   ; jump
    mov ebx, 13   ; exit status is 13
forward:
    int 0x80