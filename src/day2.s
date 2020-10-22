.globl day2_part1
.globl day2_part2
.text

day2_part1:
    .set buffer_size, 10
    push %r12
    push %r13
    
    # Allocating local variables:
    # %rbp - buffer_size = buffer of substring pointers
    # %rbp - 2 * buffer_size = buffer of substring lengths
    push %rbp
    mov %rsp, %rbp
    sub $buffer_size, %rsp
    sub $buffer_size, %rsp
    
    mov %rbp, %r12
    sub $buffer_size, %r12
    mov %r12, %r13
    sub $buffer_size, %r13
    
    mov $test_string, %rdi
    call print
    call newline
    
    mov $test_string, %rdi
    call strlen
    mov %rax, %rsi
    mov $65, %rdx
    
    mov %rbp, %rcx
    sub $buffer_size, %rcx
    mov %rcx, %r8
    sub $buffer_size, %r8
    
    mov $buffer_size, %r9
    call str_split_char
    
    mov %rax, %rdi
    call print_int_dec_s
    call newline
    
    mov (%r13), %rdi
    call print_int_dec_s
    call newline
    
    mov 16(%r12), %rdi
    mov 16(%r13), %rsi
    call print_n
    call newline
    
    leave
    pop %r13
    pop %r12
    ret

day2_part2:
    ret


.data

test_string:
    .string "ThisAisAsomeAtestAdata"
