.globl _start
.text

_start:
    # Check if 2 or more command line arguments was passed
    mov (%rsp), %r8
    cmp $3, %r8
    jge argc_correct
    mov $argc_incorrect_message, %rdi
    call print
    call newline
    jmp exit
    
    argc_correct:
    mov 16(%rsp), %rdi
    call parse_str_int
    
    dec %rax
    test %rax, %rax
    jnz skip1
    call day1_part1
    jmp exit
    skip1:
    
    dec %rax
    test %rax, %rax
    jnz skip2
    call day1_part2
    jmp exit
    skip2:
    
    mov $not_implemented_message, %rdi
    call print
    call newline

exit:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

.data

argc_incorrect_message:
    .string "Give day and part as command line arguments"

not_implemented_message:
    .string "Day/part does not exist"

