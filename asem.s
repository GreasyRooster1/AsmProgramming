.section .data

.section .text

.globl _start

_start:
    pushl $3            # pass 3 as first argument
    pushl $2            # pass 2 as second argument
    call power          # run function
    addl $8 %esp        # move stack pointer back (shift 8 forward)

    pushl %eax          # put result into eax to save it

    pushl $2            # push first argument
    pushl $5            # push second argument
    call power          # call function 
    addl $8 %esp        # move stack pointer back (shift 8 forward)

    popl %ebx           # pop out first answer to ebx

    addl %eax, %ebx     # add them together

    movl $1, %eax
    int 0x80