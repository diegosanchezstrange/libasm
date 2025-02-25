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

    mov r10, rcx

    xor rcx, rcx ; Clear rcx
    xor rax, rax ; Clear rax

.skip_spaces:
    mov al, byte [rdi + rcx] ; Load the current character

    test al, al
    jz .end ; If it's the null terminator, return 0

    cmp al, 32 ; Check if the character is ' '
    je .skip_spaces ; Repeat the loop if it is
    cmp al, 9
    jl .check_sign ; If it's a control character, check the sign
    cmp al, 13
    jle .skip_spaces ; If it's a control character, skip it

.check_sign:

    cmp al, 43 ; Check if the character is '+'
    je .positive ; If it is, the number is positive
    cmp al, 45 ; Check if the character is '-'
    je .negative ; If it is, the number is negative

    jmp .parse_number ; If it's not a sign, parse the number

.positive:
    mov rax, 1 ; Set the sign to positive
    inc rcx ; Move to the next character
    jmp .parse_number

.negative:
    mov rax, -1 ; Set the sign to negative
    inc rcx ; Move to the next character
    jmp .parse_number

.parse_number:
    mov r8, rax ; Save the sign in r8
    xor rax, rax ; Clear rax
    xor rbx, rbx ; Clear rbx

.parse_loop:
    mov dl, byte [rdi + rcx] ; Load the current character

    test dl, dl ; Check if it's the null terminator
    jz .end ; If it is, return the number

    xor rbx, rbx ; Clear rbx

.check_if_char_in_base:
    mov r9b, byte [rsi + rbx] ; Load the current character from the base
    test r9b, r9b ; Check if it's the null terminator
    jz .end ; If it is, return the number
    inc rbx ; Move to the next character
    cmp dl, r9b ; Compare the characters
    jne .check_if_char_in_base ; Repeat the loop if they are different

.update_res:
    dec rbx ; Move back to the current character
    imul rax, r10 ; Multiply the result by the base
    add rax, rbx ; Add the current character
    inc rcx ; Move to the next character
    jmp .parse_loop

.end:
    ret
