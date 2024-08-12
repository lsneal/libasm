global ft_strlen

section .text

ft_strlen:

    xor     rcx, rcx        ; count = 0

loop_start:
    mov     al, byte [rdi]  ; rdi = str

    cmp     al, 0           ; if al == '\0' 
    je      loop_end        

    inc     rdi             ; *str++
    inc     rcx             ; count++

    jmp     loop_start

loop_end:

    mov     rax, rcx ; rcx = len 
    ret