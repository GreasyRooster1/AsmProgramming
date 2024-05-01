# edi will hold current position in the list (i)
# ebx will hold the current highest value in the list (max)
# eax will hold the current element (arr[i])

.section .data

data_items:
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0 #some data

.section .text

.globl _start
_start:
    movl $0, %edi                   # move 0 into the index register
    movl data_items(,%edi,4), %eax  # load first byte of data (arr[i])
    movl %eax, %ebx                 # because this is the first time arr[0] will be biggest

_loop:
    cmpl $0, %eax                   # jump to end if the current element is zero (the last one)
    je _exit
    incl %edi                       #load next value (increment i)
    movl data_items(,%edi,4), %eax
    cmpl %ebx, %eax                 # check what value is bigger
    jle _loop                       # loop again if its less
    
    movl %eax, %ebx                 # set new value as largest

    jmp _loop                       # loop back to start

_exit:
    movl $1, %eax # 1 is the syscall id for exiting
    int $0x80 # causes an interupt, transfering to linux (running the code?)
