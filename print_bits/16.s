global asm_func16         ; first we declare that my_func will be accessible
                        ; from outside: other programs will be able to call it.

section .text

asm_func16:
  mov ax, 200  ; 10 billion (doesn't fit in a 32-bit int)
  ret   