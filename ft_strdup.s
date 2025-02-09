section .text
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strlen
extern __errno_location


ft_strdup:
    push rdi
    call ft_strlen
    inc rax
    mov rdi, rax

    call malloc wrt ..plt
    pop rdi
    test rax, rax
    jz .error

    xor rcx, rcx

.loop_start:
    mov dl, byte [rdi + rcx]
    mov byte [rax + rcx], dl
    inc rcx
    test dl, dl
    jnz .loop_start

    ret

.error:
    mov rcx, rax
    neg rcx

    call __errno_location wrt ..plt
    mov dword [rax], ecx

    mov rax, 0
    ret

