section   .text            ; Define the code section
global ft_strlen          ; Make the function visible to external files

ft_strlen:
    mov rsi, rdi          ; Copy the string pointer from rdi (first function argument) to rsi
    xor rcx, rcx          ; Clear rcx (set it to 0) to use it as a character counter

.loop:
    mov al, byte [rsi]    ; Load the byte at the address in rsi into al (current character)
    test al, al           ; Check if the byte is 0 (null terminator)
    jz .end               ; If it is 0, jump to .end (end of the function)
    inc rcx               ; Increment the counter (character count)
    inc rsi               ; Move the pointer to the next character in the string
    jmp .loop             ; Repeat the loop

.end:
    mov rax, rcx          ; Move the character count from rcx into rax (return value)
    ret                   ; Return to caller (returning the length of the string)

