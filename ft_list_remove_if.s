section .text
global ft_list_remove_if

extern free
; struct s_list
; {
;   void *data;
;   struct s_list *next;
; };

; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void
    ; (*free_fct)());

%define LIST_DATA 0
%define LIST_NEXT 8
%define LIST_SIZE 16


ft_list_remove_if:

    push rbx
    push r12
    push r13
    push r14
    push r15

    mov rbx, rdi ; t_list **begin_list
    mov r12, rsi ; void *data_ref
    mov r13, rdx ; int (*cmp)()
    mov r14, rcx ; void (*free_fct)()

.set_vars:
    mov rcx, [rbx]
    xor r15, r15 ; This will store the last element

.loop:
    test rcx, rcx
    jz .done

    mov rdi, [rcx + 0]
    mov rsi, r12

    call r13 ; Call the comparison function

    test rax, rax
    jz .remove

    mov r15, rcx
    mov rcx, [rcx + LIST_NEXT]
    jmp .loop

.remove:
    mov rax, [rcx + LIST_NEXT] ; Save the next element

    test r15, r15
    jz .first_element

    mov [r15 + LIST_NEXT], rax

.first_element:

    ;call free for the element at rcx
    ;free_fct(rcx->data)
    push rax
    push r15
    mov rdi, [rcx + 0]
    push rcx
    call r14 ; Call the free function
    pop rcx
    pop r15
    pop rax

    ;call free for the element at rcx
    ;free(rcx)
    push rax
    push r15
    mov rdi, rcx
    call free wrt ..plt ; Call the free function
    pop r15
    pop rax

    mov rcx, rax
    jmp .loop

.done:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    ret
    
