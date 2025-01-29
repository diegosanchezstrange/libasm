section .text
global ft_strcpy


; The ft_strcpy function copies a string from source to destination.
; Arguments:
;   rdi - destination pointer
;   rsi - source pointer


ft_strcpy:
    mov rdx, rdi          ; Copy the destination pointer from rdi to rdx

.loop:
    mov al, byte [rsi]    ; Load the byte at the address in rsi into al (current character)
    mov byte [rdx], al    ; Store the character in al at the address in rdx
    inc rsi               ; Move the source pointer to the next character
    inc rdx               ; Move the destination pointer to the next character
    test al, al           ; Check if the byte is 0 (null terminator)
    jnz .loop             ; If it is not 0, repeat the loop
    mov rax, rdi          ; Move the destination pointer into rax (return value)
    ret                   ; Return to caller (returning the destination pointer)


