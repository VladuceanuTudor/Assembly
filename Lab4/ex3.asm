BITS 32
section .text
    global _start
 
_start:
    mov ecx, 95   ; set ecx to 95
    mov ebx, 15   ; exit status is 42
    mov eax, 1    ; sys_exit system call
    cmp ecx, 100  ; compare ecx to 100
    jg forward    ; jump if less than
    mov ebx, 13   ; exit status is 13
forward:
    int 0x80