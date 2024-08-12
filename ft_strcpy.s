global ft_strcpy

section .text

ft_strcpy:
    mov     rdx, rdi        ; rdx = start pointer dst
   
    cmp     rsi, 0          ; if src == NULL
    je      error

loop_start:

    mov     al, byte [rsi]  ; rsi = source
    mov     byte [rdi], al  ; rdi = dest 

    cmp     byte [rsi], 0   ; check \0
    je      loop_end

    inc     rsi             ; *str++
    inc     rdi             ; i++
    
    jmp     loop_start

loop_end:

    mov     byte [rdi], 0   ; add \0 end
    mov     rax, rdx        ; for ret
    ret

error:
    xor     rax, rax
    ret