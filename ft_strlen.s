section   .text
global ft_strlen

ft_strlen:
    mov rsi, rdi
    xor rcx, rcx
.loop:
    mov al, byte [rsi]
    test al, al
    jz .end
    inc rcx
    inc rsi
    jmp .loop
.end:
    mov rax, rcx
    ret
