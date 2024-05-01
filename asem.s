.section .data

.section .text

.globl _start
_start:
    movl $1, %eax # 1 is the syscall id for exiting
    movl $0, %ebx # this is "passed" into the syscall to exit with 0
    int $0x80 # causes an interupt, transfering to linux (running the code?)
    