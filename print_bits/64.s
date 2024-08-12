global asm_func64         ; first we declare that my_func will be accessible
                        ; from outside: other programs will be able to call it.

section .text

asm_func64:
  mov rax, 200  ; 10 billion (doesn't fit in a 32-bit int)
  ret   