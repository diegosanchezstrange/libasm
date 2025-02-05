default rel
section   .text            ; Define the code section
    global ft_write
    extern __errno_location

ft_write:
    mov rax, 1
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
