global ft_strcmp

section .text

ft_strcmp:
    xor     rcx, rcx        ; rcx = 0 (count)

    cmp     rdi, 0          ; s1 == NULL
    je      error

    cmp     rsi, 0          ; s2 == NULL
    je      error
loop_start:
    mov     al, byte [rdi]  ; s1
    mov     bl, byte [rsi]  ; s2

    cmp     al, bl          ; if s1 < s2
    jl      ret_neg

    cmp     al, bl          ; if s1 > s2
    jg      ret_pos

    cmp     bl, 0           ; check end s2
    cmp     al, 0           ; check end s1
    je      ret_zero

    inc     rdi             ; *s1++
    inc     rsi             ; *s2++
 
    jmp      loop_start

ret_zero:
    mov     rax, 0          ; return 0
    ret

ret_pos:
    movzx   eax, al         ; s1
    movzx   ebx, bl         ; s2

    sub     eax, ebx        ; *s1 - *s2
    movsx   rax, eax
    ret

ret_neg:
    movzx   eax, al         ; s1
    movzx   ebx, bl         ; s2

    sub     eax, ebx        ; *s1 - *s2
    movsx   rax, eax        ; movsx (mov 32bits in 64)
    ret

error:
    mov     rax, -1         ; ret -1
    ret