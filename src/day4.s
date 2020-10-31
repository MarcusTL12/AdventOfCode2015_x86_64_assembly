.globl day4_part1
.globl day4_part2
.text


# Parameters
# %rdi: Pointer to string
# %rsi: number of zeros to check for
# Returns true/false
check_for_zeros:
    xor %rax, %rax
    inc %rax
    xor %r8, %r8
    check_loop:
        xor %r9, %r9
        movb (%rdi), %r9b
        cmp $'0', %r9
        cmovne %r8, %rax
        jne check_loop_end
        inc %rdi
        dec %rsi
        jnz check_loop
    check_loop_end:
    ret

# Parameters:
# %rdi: amount of zeros
# Returns coin
find_coin:
    push %r12
    push %r13
    push %r14
    push %r15
    
    mov %rdi, %r15
    
    # Local variables
    .set hex_buf, 32
    .set inp_buf, hex_buf + 32
    push %rbp
    mov %rsp, %rbp
    sub $inp_buf, %rsp
    
    mov $input, %rdi
    call strlen
    mov %rax, %r12
    
    lea -inp_buf(%rbp), %rdi
    mov $input, %rsi
    mov %r12, %rdx
    call memcpy
    
    xor %r14, %r14
    
    coin_loop:
        inc %r14
        mov %r14, %rdi
        lea -inp_buf(%rbp, %r12, 1), %rsi
        call int_to_dec
        mov %rax, %r13
        add %r12, %r13
        
        lea -inp_buf(%rbp), %rdi
        mov %r13, %rsi
        lea -hex_buf(%rbp), %rdx
        call md5_str
        
        lea -hex_buf(%rbp), %rdi
        mov %r15, %rsi
        call check_for_zeros
        test %rax, %rax
        
        jz coin_loop
    
    mov %r14, %rax
    
    leave
    
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    ret

day4_part1:
    mov $5, %rdi
    call find_coin
    mov %rax, %rdi
    call print_int_dec
    call newline
    ret

day4_part2:
    mov $6, %rdi
    call find_coin
    mov %rax, %rdi
    call print_int_dec
    call newline
    ret

.data


input:
    .string "ckczppom"
    # .string "abcdef"
