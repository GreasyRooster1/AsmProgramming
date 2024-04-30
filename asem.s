.global _start

_start:

    ;sys write
    mov %eax, 1
    mov %edi, 1
    lea %esi, [hello_world]
    mov %edx, 13
    syscall

    ;sys exit
    mov %eax, 60
    mov %edi, 69
    syscall

hello_world:
    .asciz "Hello World!\n"
