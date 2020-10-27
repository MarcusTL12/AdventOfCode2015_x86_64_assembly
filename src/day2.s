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

# Parameters
# %rdi: pointer to array of length, width and height
wrapping_paper:
    # %r8 = a * b
    mov 0(%rdi), %r8
    imul 8(%rdi), %r8
    
    # %r9 = b * c
    mov 8(%rdi), %r9
    imul 16(%rdi), %r9
    
    # %r10 = c * a
    mov 16(%rdi), %r10
    imul 0(%rdi), %r10
    
    mov %r8, %rdi
    mov %r9, %rsi
    mov %r10, %rdx
    call min_3
    
    add %r9, %r8
    add %r10, %r8
    shl $1, %r8
    
    add %r8, %rax
    ret

day2_part1:
    .set fr_size, 40
    .set num_buf_size, 3 * 8
    .set file_buf_size, 512
    .set line_buf_size, 16
    
    push %r12
    push %r13
    push %r14
    push %r15
    
    push %rbp
    mov %rsp, %rbp
    sub $fr_size + num_buf_size + file_buf_size + line_buf_size, %rsp
    
    # Open file and store id in %rsi for making file reader
    mov $filename, %rdi
    call open_file_r
    mov %rax, %rsi
    
    # Store file reader pointer in %r12
    lea -fr_size(%rbp), %r12
    
    # Store line buffer pointer in %r13
    lea -fr_size - num_buf_size - file_buf_size - line_buf_size(%rbp), %r13
    
    # Store num buffer pointer in %r14
    lea -fr_size - num_buf_size(%rbp), %r14
    
    # Store final answer in %r15
    xor %r15, %r15
    
    # Make file reader
    mov %r12, %rdi
    lea -fr_size - num_buf_size - file_buf_size(%rbp), %rdx
    mov $file_buf_size, %rcx
    call make_buffered_file_reader
    
    part1_loop:
        mov %r12, %rdi
        mov %r13, %rsi
        call read_buf_file_line
        test %rax, %rax
        jz part1_loop_end
        
        mov %r13, %rdi
        mov %rax, %rsi
        mov %r14, %rdx
        call split_numbers
        
        mov %r14, %rdi
        call wrapping_paper
        
        add %rax, %r15
        
        jmp part1_loop
    part1_loop_end:
    
    mov %r15, %rdi
    call print_int_dec_s
    call newline
    
    # Close file
    mov (%r12), %rdi
    call close_file
    
    leave
    
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    
    ret

# Parameters:
# %rdi: Array of length, width and height
ribbon:
    mov 0(%rdi), %r8
    mov 8(%rdi), %r9
    mov 16(%rdi), %r10
    
    # Bubble sort the three values
    cmp %r8, %r9
    cmovl %r8, %r11
    cmovl %r9, %r8
    cmovl %r11, %r9
    
    cmp %r9, %r10
    cmovl %r9, %r11
    cmovl %r10, %r9
    cmovl %r11, %r10
    
    cmp %r8, %r9
    cmovl %r8, %r11
    cmovl %r9, %r8
    cmovl %r11, %r9
    
    # Add the two lowes sides together and multiply by 2
    mov %r8, %rax
    add %r9, %rax
    shl %rax
    
    # Multiply together the sides and add to ans
    imul %r8, %r10
    imul %r9, %r10
    add %r10, %rax
    
    ret

day2_part2:
    .set fr_size, 40
    .set num_buf_size, 3 * 8
    .set file_buf_size, 512
    .set line_buf_size, 16
    
    push %r12
    push %r13
    push %r14
    push %r15
    
    push %rbp
    mov %rsp, %rbp
    sub $fr_size + num_buf_size + file_buf_size + line_buf_size, %rsp
    
    # Open file and store id in %rsi for making file reader
    mov $filename, %rdi
    call open_file_r
    mov %rax, %rsi
    
    # Store file reader pointer in %r12
    lea -fr_size(%rbp), %r12
    
    # Store line buffer pointer in %r13
    lea -fr_size - num_buf_size - file_buf_size - line_buf_size(%rbp), %r13
    
    # Store num buffer pointer in %r14
    lea -fr_size - num_buf_size(%rbp), %r14
    
    # Store final answer in %r15
    xor %r15, %r15
    
    # Make file reader
    mov %r12, %rdi
    lea -fr_size - num_buf_size - file_buf_size(%rbp), %rdx
    mov $file_buf_size, %rcx
    call make_buffered_file_reader
    
    part2_loop:
        mov %r12, %rdi
        mov %r13, %rsi
        call read_buf_file_line
        test %rax, %rax
        jz part1_loop_end
        
        mov %r13, %rdi
        mov %rax, %rsi
        mov %r14, %rdx
        call split_numbers
        
        mov %r14, %rdi
        call ribbon
        
        add %rax, %r15
        
        jmp part2_loop
    part2_loop_end:
    
    mov %r15, %rdi
    call print_int_dec_s
    call newline
    
    # Close file
    mov (%r12), %rdi
    call close_file
    
    leave
    
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    
    ret


.data

test_nums:
    .string "6x26x20"

filename:
    .string "inputfiles/day2/input.txt"

space:
    .string " "
