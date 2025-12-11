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

    mov rbx, rdi
    mov r12, rsi
    mov r13, rdx
    mov r14, rcx

    mov rcx, [rbx]
    xor r8, r8 ; This will store the last element

.loop:
    test rcx, rcx
    jz .done

    mov rdi, [rcx + 0]
    mov rsi, r12

    push r8
    call r13 ; Call the comparison function
    pop r8

    test rax, rax
    jz .remove

    mov r8, rcx
    mov rcx, [rcx + LIST_NEXT]
    jmp .loop

.remove:
    mov rax, [rcx + LIST_NEXT] ; Save the next element

    test r8, r8
    jz .first_element

    mov [r8 + LIST_NEXT], rax

.first_element:

    ;call free for the element at rcx
    ;free_fct(rcx->data)
    push rax
    push r8
    mov rdi, [rcx + 0]
    push rcx
    call r14 ; Call the free function
    pop rcx
    pop r8
    pop rax

    ;call free for the element at rcx
    ;free(rcx)
    push rax
    push r8
    mov rdi, rcx
    call free wrt ..plt ; Call the free function
    pop r8
    pop rax

    mov rcx, rax
    jmp .loop

.done:
    pop r14
    pop r13
    pop r12
    pop rbx
    ret
    
