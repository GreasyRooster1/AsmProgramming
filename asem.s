.section .data

.section .text

.globl _start

_start:
    pushl $3            # pass 3 as first argument
    pushl $2            # pass 2 as second argument
    call power          # run function
    addl $8, %esp        # move stack pointer back (shift 8 forward)

    pushl %eax          # put result into eax to save it

    pushl $2            # push first argument
    pushl $5            # push second argument
    call power          # call function 
    addl $8, %esp        # move stack pointer back (shift 8 forward)

    popl %ebx           # pop out first answer to ebx

    addl %eax, %ebx     # add them together

    movl $1, %eax
    int $0x80

.type power, @function
power:
    pushl %ebp              #save old base pointer
    movl %esp, %ebp         #make stack pointer the base pointer
    subl $4, %esp           #get room for our local storage
    movl 8(%ebp), %ebx      #put first argument in %eax
    movl 12(%ebp), %ecx     #put second argument in %ecx
    movl %ebx, -4(%ebp)     #store current result

power_loop_start:
    cmpl $1, %ecx           #if the power is 1, we are done
    je end_power
    movl -4(%ebp), %eax     #move the current result into %eax
    imull %ebx, %eax        #multiply the current result by the base number
    movl %eax, -4(%ebp)     #store the current result
    decl %ecx #decrease the power
    jmp power_loop_start    #run for the next power
end_power:
    movl -4(%ebp), %eax     #return value goes in %eax
    movl %ebp, %esp         #restore the stack pointer
    popl %ebp               #restore the base pointer
    ret
