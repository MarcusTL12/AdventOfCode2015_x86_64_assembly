.globl day4_part1
.globl day4_part2
.text

# Parameters
# %rdi: number to be tested
# Returns true if valid false otherwise
part1_valid:
    ret

# Parameters
# %rdi: Pointer to bcd buffer
next_number:
    xor %r8, %r8
    xor %rax, %rax
    next_number_loop:
        movb (%rdi), %r8b
        inc %r8
        cmp $10, %r8
        cmove %rax, %r8
        movb %r8b, (%rdi)
        inc %rdi
        test %r8, %r8
        jz next_number_loop
    ret

day4_part1:
    push %r12
    
    push %rbp
    mov %rsp, %rbp
    sub $6, %rsp
    
    lea -6(%rbp), %r12
    
    movb $9, 0(%r12)
    movb $9, 1(%r12)
    movb $7, 2(%r12)
    
    mov %r12, %rdi
    call next_number
    
    xor %r9, %r9
    
    movb 0(%r12), %r9b
    mov %r9, %rdi
    call print_int_dec_s
    call newline
    
    movb 1(%r12), %r9b
    mov %r9, %rdi
    call print_int_dec_s
    call newline
    
    movb 2(%r12), %r9b
    mov %r9, %rdi
    call print_int_dec_s
    call newline
    
    leave
    pop %r12
    ret


day4_part2:
    ret

.data

range:
    .quad 359282
    .quad 820401
