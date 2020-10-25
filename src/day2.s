.globl day2_part1
.globl day2_part2
.text

# Parameters
# %rdi: pointer to string
# %rsi: length of string
# %rdx: %pointer to buffer to put the numbers
split_numbers:
    .set buffer_size, 3 * 8
    
    push %r12
    push %r13
    
    mov %rdx, %r13
    
    push %rbp
    mov %rsp, %rbp
    sub $buffer_size * 2, %rsp
    
    mov $'x', %rdx
    lea -buffer_size(%rbp), %rcx
    lea -buffer_size * 2(%rbp), %r8
    mov $3, %r9
    call str_split_char
    
    xor %r12, %r12
    split_numbers_loop:
        mov -buffer_size(%rbp, %r12, 8), %rdi
        mov -buffer_size * 2(%rbp, %r12, 8), %rsi
        call parse_str_int_n
        
        mov %rax, (%r13, %r12, 8)
        
        inc %r12
        cmp $3, %r12
        jl split_numbers_loop
    
    leave
    
    pop %r13
    pop %r12
    
    ret

day2_part1:
    .set buffer_size, 3 * 8
    
    push %r12
    
    push %rbp
    mov %rsp, %rbp
    sub $buffer_size, %rsp
    
    lea -buffer_size(%rbp), %r12
    
    mov $test_nums, %rdi
    call strlen
    
    mov $test_nums, %rdi
    mov %rax, %rsi
    mov %r12, %rdx
    call split_numbers
    
    mov 0(%r12), %rdi
    call print_int_dec_s
    call newline
    
    mov 8(%r12), %rdi
    call print_int_dec_s
    call newline
    
    mov 16(%r12), %rdi
    call print_int_dec_s
    call newline
    
    
    leave
    
    pop %r12
    
    ret

day2_part2:
    .set buffer_size, 4
    push %r12
    push %r13
    push %r14
    
    # Open file and save id to %r12
    mov $filename, %rdi
    call open_file_r
    mov %rax, %r12
    
    # Local variables:
    # -buffered_file_reader_size(%rbp) Buffered file reader object
    # -buffered_file_reader_size - buffer_size(%rbp) local buffer
    push %rbp
    mov %rsp, %rbp
    sub $40 + buffer_size, %rsp
    
    # Save pointer to buffered file reader object to %r13
    lea -40(%rbp), %r13
    
    # Save pointer to local buffer in %r14
    lea -40 - 4(%rbp), %r14
    
    mov %r13, %rdi
    mov %r12, %rsi
    mov %r14, %rdx
    mov $buffer_size, %rcx
    call make_buffered_file_reader
    
    mov %r13, %rdi
    mov %r14, %rsi
    mov $buffer_size, %rdx
    call read_buffered_file
    
    mov %r14, %rdi
    mov $buffer_size, %rsi
    call print_n
    call newline
    
    leave
    
    mov %r12, %rdi
    call close_file
    
    pop %r14
    pop %r13
    pop %r12
    ret


.data

test_nums:
    .string "6x26x20"

filename:
    .string "inputfiles/day2.txt"
