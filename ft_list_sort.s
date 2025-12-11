section .data
    fmt: db "Data: %s, Next: %p", 10, 0
    hello: db "Hello, World!", 10, 0
adios: db "Adios, World!", 10, 0

section .text
extern printf
global ft_list_sort

    ;push r8
    ;push rdx
    ;xor rax, rax ; Clear rax
    ;lea rdi, [rel fmt] ; Load the format string
    ;mov rsi, [rcx + LIST_DATA] ; Load the data of the current element
    ;mov rdx, [rcx + LIST_NEXT] ; Load the next element
    ;push rcx
    ;call printf wrt ..plt
    ;pop rcx
    ;pop rdx
;;
    ;pop r8
    ;push r8
    ;push rdx
    ;xor rax, rax ; Clear rax
    ;lea rdi, [rel fmt] ; Load the format string
    ;mov rsi, [rdx + LIST_DATA] ; Load the data of the current element
    ;mov rdx, [rdx + LIST_NEXT] ; Load the next element
    ;push rcx
    ;call printf wrt ..plt
    ;pop rcx
    ;pop rdx
    ;pop r8


; struct s_list {
;     void *data;
;     struct s_list *next;
; };

%define LIST_DATA 0
%define LIST_NEXT 8
%define LIST_SIZE 16

; Parameters:
    ; rdi: The address of the pointer to the first element of the list
        ; **begin_list
    ; rsi: The address of the function to compare the elements:
        ; (*cmp)(void *, void *) -> int


ft_list_sort:
    push r12
    push r13
    mov r13, rsi ; Save the address of the comparison function
    mov r9, rdi ; Save the address of the first element

.set_vars:
    xor r12, r12 ; Clear r12
    xor r10, r10 ; Clear r10 (previous element)
    mov rcx, [r9] ; Save the address of the first element
.sort_bubble:
    test rcx, rcx ; Check if the current element is NULL
    jz .done_sort ; If it is, the list is sorted

    mov rdx, [rcx + LIST_NEXT] ; Load the next element
    test rdx, rdx ; Check if it's NULL
    jz .check_if_sorted ; If it is, the list is sorted

    mov rdi, [rcx + LIST_DATA] ; Load the data of the current element
    mov rsi, [rdx + LIST_DATA] ; Load the data of the next element

    push rcx
    push rdx
    push r9
    push r10
    call r13 ; Call the comparison function
    pop r10
    pop r9
    pop rdx
    pop rcx

    test rax, rax ; Check if rax is 0, positive, or negative
    jle .jump_next ; If it's negative or 0, the list is sorted

.swap:
    mov r12, 1 ; Set r12 to indicate that a swap was made
    mov rax, [rdx + LIST_NEXT] ; Save the next element
    mov [rdx + LIST_NEXT], rcx
    mov [rcx + LIST_NEXT], rax ; Set the next element of the current element
    mov rcx, rdx ; Move to the first element


    test r10, r10 ; Check if the address of the previous element is NULL
    jz .swap_first ; If it is, the current element is the first element

    mov [r10 + LIST_NEXT], rdx ; Set the next element of the previous element

.jump_next:
    mov r10, rcx ; Save the address of the current element
    mov rcx, [r10 + LIST_NEXT]
    jmp .sort_bubble

.swap_first:
    mov [r9], rcx ; Set the new first element of the list
    jmp .jump_next

.check_if_sorted:
    test r12, r12 ; Check if any swaps were made
    jnz .set_vars ; If swaps were made, repeat the sorting

.done_sort:
    pop r13
    pop r12
    xor rax, rax
    ret
