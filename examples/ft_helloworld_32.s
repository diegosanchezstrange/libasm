
section .text:
    global _start

_start:
    mov edx, len    ; message length
    mov ecx, msg    ; message to write
    mov ebx, 1      ; file descriptor 1 is stdout
    mov eax, 4      ; syscall number for sys_write
    int 0x80        ; invoke the kernel
    mov ebx, 60     ; syscall number for sys_exit
    xor eax, eax    ; exit code 0
    int 0x80        ; invoke the kernel

section .data:
    msg db "Hello, World!", 0xb
    len equ $ - msg
