BITS 32
section .text
global _start

; print:
;     push ebp
;     mov ebp, esp

;     mov eax, 4
;     mov ebx, 1
;     mov ecx, esp+8
;     mov edx, len
;     int 0x80

;     mov esp, ebp
;     pop ebp
;     ret

_start:
    mov ecx, len
    mov esi, sir
    mov edi, key
    ;criptare
loop1_start:
    mov eax, [esi]
    xor eax, [edi]
    mov [esi], eax
    inc esi
    loop loop1_start

    ; push [edi]
    ; call print
    ; pop [edi]
    mov eax, 4
    mov ebx, 1
    mov ecx, sir
    mov edx, len
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    sir db "Vladuceanu Tudor", 0x0a
    len equ $ - sir
    key db 0x55
