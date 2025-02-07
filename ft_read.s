default rel
section .text
    global ft_read
    extern __errno_location


ft_read:
    mov rax, 0
    syscall

    cmp rax, 0
    jge .done

    mov rcx, rax
    neg rcx

    call __errno_location wrt ..plt
    mov dword [rax], ecx

    mov rax, -1
    ret

.done:
    ret
