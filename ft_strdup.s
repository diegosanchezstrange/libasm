; Documentation:
; Function: ft_strdup
; Description: Allocates memory for a new string and duplicates the content of the input string into it.
; Parameters:
; - rdi: Address of the input string to be duplicated.
; Returns: A pointer to the newly allocated string, or NULL if memory allocation fails. Sets the appropriate error number on failure.

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

