section .text
global ft_atoi_base


; Parameters:
    ; rdi: The string to convert
    ; rsi: The base to use

ft_atoi_base:

.check_base:
    mov rdx, rsi ; Save the base in rdx
    xor rcx, rcx ; Clear rcx

.loop:
    mov al, byte [rdx + rcx] ; Load the current character
    test al, al ; Check if it's the null terminator
    jz .base_ok ; If it is, the base is valid

    ; +, -, and ' ' are invalid characters
    cmp al, 43 ; Check if the character is '+'
    je .base_ko 
    cmp al, 45 ; Check if the character is '-'
    je .base_ko 
    cmp al, 32 ; Check if the character is ' '
    je .base_ko

    ; Check if the character is already in the base
    mov r8, rcx ; Save the current index

.check_repeat_loop:
    inc rcx
    mov bl, byte [rdx + rcx] ; Load the next character
    test bl, bl ; Check if it's the null terminator
    jz .valid_char ; If it is, the character is valid

    cmp al, bl ; Compare the characters
    jne .check_repeat_loop ; Repeat the loop if they are different
    jmp .base_ko ; If they are the same, the base is invalid

.valid_char:
    mov rcx, r8 ; Restore the current index
    inc rcx ; Move to the next character
    jmp .loop ; Repeat the loop

.base_ko:
    mov rax, -1 ; Return 0
    ret

.base_ok:
    cmp rcx, 2 ; Check if the base is at least 2
    jl .base_ko ; If it's not, the base is invalid

    xor rcx, rcx ; Clear rcx
    xor rax, rax ; Clear rax





    ret
