global  ft_list_size

section .data
    ; struct t_list
    ; resq allow space quadword (64 bits)
    struc t_list
        .data resq 1    ; pointer to data
        .next resq 1    ; pointer to next
    endstruc

section .text

; rdi = first element (t_list *lst)

ft_list_size:
    
    xor     rcx, rcx ; count = 0
loop_start:

    cmp     rdi, 0                            ; if rdi == NULL 
    je      loop_end 

    inc      rcx                              ; count++

    mov     rdi, qword [rdi + t_list.next]    ; next element

    jmp     loop_start

loop_end:
    mov     rax, rcx                          ; ret count
    ret