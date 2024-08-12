global  ft_strdup

extern __errno_location
extern malloc
extern ft_strlen
extern ft_strcpy

ft_strdup:    
    cmp     rdi, 0          ; if str == NULL
    je      error
    
    push    rdi             ; push rdi on stack for save adress
    xor     rcx, rcx        ; count = 0 

    jmp     loop_size       ; count len

loop_size:
    cmp     byte [rdi], 0   ; byte [rdi] = *str
    je      alloc           ; if str != 0

    inc     rcx             ; i++
    inc     rdi             ; *str++

    jmp     loop_size

alloc:

    inc     rcx             ; size + 1 for '\0'
    mov     rdi, rcx        ; rdi = first argument

    call    malloc          ; malloc return first adress on rax
    cmp     rax, 0          ; if malloc failed
    je      error

    jmp     copy

copy:
    pop     rbx             ; rbx = address of rdi first push (start string)
    mov     rsi, rbx        ; rsi = source (rbx = rdi)
    mov     rdi, rax        ; rdi = dest (strcpy)

    call    ft_strcpy
    ret

error:
   ; neg		rax			; car le syscall renvoie dans rax errno mais en negatif
    ;mov		rdi, rax		; rdi sert de tampon car apres rax prendera le retour de errno location
    ;call		__errno_location	; errno location renvoie un pointeur sur errno
    ;mov		[rax], rdi		; ici rax contient l'adresse de errno donc en faisant ca on met rdi dans errno
    ;mov		rax, 10			; on met rax à -1 pour renvoyer la bonne valeur d'un appel à write
    xor rax, rax
    ret	
