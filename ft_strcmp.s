section .text
global ft_strcmp

; The ft_strcmp function compares two strings.
; Arguments:
;   rdi - first string pointer
;   rsi - second string pointer

ft_strcmp:
    xor rax, rax
.loop:
    mov al, byte [rdi]    ; Load the byte at the address in rdi into al (current character)
    mov dl, byte [rsi]    ; Load the byte at the address in rsi into dl (current character)
    cmp al, dl            ; Compare the characters
    jne .different          ; If the first character is greater than the second,
    test al, al            ; If the first character is null,
    jz .done              ; Return 0
    inc rdi               ; Move the first string pointer to the next character
    inc rsi               ; Move the second string pointer to the next character
    jmp .loop            ; Repeat the loop

.different:
    sub al, dl            ; Subtract the characters
    movsx rax, al         ; Move the result to rax
    ret

.done:
    xor rax, rax
    ret


