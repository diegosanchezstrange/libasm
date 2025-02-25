section .text
global ft_list_push_front
    extern malloc

; struct s_list {
;     void *data;
;     struct s_list *next;
; };

%define LIST_DATA 0
%define LIST_NEXT 8
%define LIST_SIZE 16

; Parameters:
    ; rdi: The address of the pointer to the first element of the list
    ; rsi: The address of the element to add to the list

ft_list_push_front:
    sub rsp, 8 ; Align the stack
    push rdi
    push rsi

    mov rdi, LIST_SIZE ; Load the size of the struct
    call malloc wrt ..plt ; Allocate memory for the new element

    test rax, rax ; Check if malloc failed
    jz .done ; If it did, return

    pop rsi ; Restore the parameters
    pop rdi

    mov [rax + LIST_DATA], rsi    ; new_node->data = data;
    mov rdx, [rdi]                ; rdx = *head (old head)
    mov [rax + LIST_NEXT], rdx    ; new_node->next = old head;
    mov [rdi], rax                ; *head = new_node;

    mov [rdi], rax ; Set the new element as the first element of the list

.done:
    add rsp, 8 ; Restore the stack
    ret
    
