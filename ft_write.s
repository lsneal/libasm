global ft_write

section .text

extern __errno_location

ft_write:
    
    cmp     rsi, 0
    je      error_null

    mov     rax, 1              ; syscall write
    syscall                     ; syscall return errno value 
                                ; (error == neg number -> send errno_location)
    cmp rax, 0
    jl  error                   ; if rax < 0
    ret

error:
    neg		rax			        ; negation rax (if syscall return error code)
    mov		rdi, rax		    ; rdi = temp -> rax
    call	__errno_location	; return pointer on errno
    mov		[rax], rdi		    ; rax = address of errno
    mov		rax, -1
    ret

error_null:
    mov     rax, 14             ; 14 (EFAULT) = BAD_ADDRESS
                                ; 22 (EINVAL) = INVALID_ARGUMENT
    mov     rdi, rax
    call    __errno_location
    mov     [rax], rdi

    mov     rax, -1
    ret