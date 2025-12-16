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

    test rbx, rbx
    jz .done

    test r12, r12
    jz .done

    test r13, r13
    jz .done

    test r14, r14
    jz .done

.set_vars:
    mov rcx, [rbx]
    xor r15, r15 ; This will store the last element

.loop:
    test rcx, rcx
    jz .done

    mov rdi, [rcx + LIST_DATA] ; Load the data of the current element
    mov rsi, r12

    push rcx
    call r13 ; Call the comparison function
    pop rcx

    test rax, rax ; If diference is 0, we need to remove the element
    jz .remove

    mov r15, rcx ; Store the last element
    mov rcx, [rcx + LIST_NEXT]
    jmp .loop

.remove:
    
    mov rax, [rcx + LIST_NEXT] ; Save the next element SIGSEGV

    test r15, r15
    jz .first_element

    ; Link the previous element to the next element
    mov [r15 + LIST_NEXT], rax

.first_element:

    ;call free for the element at rcx
    ;free_fct(rcx->data)
    push rax
    mov rdi, [rcx + LIST_DATA]
    push rcx
    call r14 ; Call the free function
    pop rcx
    pop rax

    ;call free for the element at rcx
    ;free(rcx)
    push rax
    mov rdi, rcx
    call free wrt ..plt ; Call the free function
    pop rax

    ; Save the new first element if we removed the first first_element
    test r15, r15
    jz .update_head

    mov rcx, rax
    jmp .loop

.update_head:
    mov [rbx], rax
    mov rcx, rax
    jmp .loop

.done:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    ret
    
