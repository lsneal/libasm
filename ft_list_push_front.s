global  ft_list_push_front

extern malloc

section .bss
    temp    resb 8                  ; reserve 8 bytes 

section .text

ft_list_push_front:

                                    ; rsi second param
    push    rdi                     ; push rdi on stack ; rdi first param
    mov     [temp], rsi

    mov     rdi, 16                 ; malloc sizeof(t_list)
    call    malloc                  ; ret rax
    cmp     rax, 0                  ; if malloc failed
    je      error

    mov     rsi, [temp]
    pop     rdi
    
    mov     rbx, rax                ; rax = address malloc return -> rbx -> t_list *new_node
    mov     [rbx], rsi              ; address of rbx -> rsi (second param void*)
    mov     rdx, [rdi]              ; rdx = temp -> address of rdi (first param *lst)
    mov     [rbx + 8], rdx          ; size void* = 8bytes ; new_node->next = *lst
    mov     [rdi], rbx              ; *lst = new_node

    ret

error:
    pop     rdi
    xor     rax, rax
    ret