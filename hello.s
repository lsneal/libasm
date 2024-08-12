section .data
    helloMessage: db 'Hello, World!', 0xa ; 0xa = \n hexa
	number: db '1', 0xa

section .text
    global _start

_start:
    ; Write the helloMessage to STDOUT
    ;mov eax, 4
    ;mov ebx, 1
    ;lea ecx, [helloMessage]
    ;mov edx, 14
	;
	;int 0x80
    
	;mov rdx, 8    ; this is our exponent
    ;mov rax, 2    ; this is the base
    ;mov rcx, 1    ; our counter

	;loop:
	;	mov rax, 1 ; rax syscall number
	;	mov rdi, 1 ; 
	;	mov rsi, helloMessage
	;	mov rdx, 14 ; length msg
	;	add rax, rax  ; doubles RAX
	;	inc rcx       ; increments our counter
	;	cmp rcx, rdx  ; did we do this enough times?
	;	jl loop       ; if not, jump back to loop

	mov rax, 1 ; rax syscall number
	mov rdi, 1 ; 
	mov rsi, helloMessage
	;inc eax
	mov rdx, 14 ; length msg
	syscall

    ; Exit the program
	mov rax, 60 ; syscall 60 for exit
	mov rdi, 10
    syscall ; return rdi value (10)

	; Exit the program
	;mov eax, 1
	;xor rdi, rdi
	;int 0x80