.globl _start
.text

_start:
    mov $-1234, %rdi
    call print_int_dec_s
    call newline

exit:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

.data
