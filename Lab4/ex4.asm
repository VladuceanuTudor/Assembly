BITS 32
section .text
    global _start
 
_start:
    mov ebx, 1    ; start ebx at 1
    mov ecx, 5    ; number of iterations
backward:
    add ebx, ebx  ; ebx += ebx
    ;dec ecx       ; ecx -= 1                            }
    ;cmp ecx, 0    ; compare ecx with 0                  }---->loop
    ;jg backward   ; jump to label backward if greater   }    
    loop backward
    mov eax, 1    ; sys_exit system call
    int 0x80