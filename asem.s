.global _start
.intel_syntax noprefix

_start:

    //sys write
    mov eax, 1
    mov edi, 1
    lea esi, [hello_world]
    mov edx, 14
    syscall

    //sys exit
    mov eax, 60
    mov edi, 0
    syscall

hello_world:
    .asciz "Hello World!\n"
