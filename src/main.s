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
    
    mov %rax, %rdi
    call print_int_dec_s
    call newline

exit:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

.data

argc_incorrect_message:
    .string "Give day and part as command line arguments"


