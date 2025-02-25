section .text
global ft_list_size



; struct s_list {
;     void *data;
;     struct s_list *next;
; };

%define LIST_DATA 0
%define LIST_NEXT 8
%define LIST_SIZE 16

; Parameters:
    ; rdi: The address of the first element of the list


ft_list_size:
    sub rsp, 8 ; Align the stack

    mov rax, rdi ; Save the address of the first element
    push rdi

    xor rcx, rcx ; Clear rcx
.loop:
    test rax, rax ; Check if the current element is NULL
    jz .done ; If it is, return

    mov rax, [rax + LIST_NEXT] ; Move to the next element
    inc rcx ; Increment the size of the list
    jmp .loop ; Repeat the loop

.done:
    mov rax, rcx ; Return the size of the list
    pop rdi
    add rsp, 8 ; Restore the stack
    ret


