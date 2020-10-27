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
    .set fr_size, 40
    .set num_buf_size, 3 * 8
    .set file_buf_size, 1024
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
        
        
        
        call newline
        
        jmp part1_loop
    part1_loop_end:
    
    # Close file
    mov (%r12), %rdi
    call close_file
    
    leave
    
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    
    ret

day2_part2:
    .set fr_size, 40
    .set num_buf_size, 3 * 8
    .set file_buf_size, 17
    .set line_buf_size, 4
    
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
    
    # Make file reader
    mov %r12, %rdi
    lea -fr_size - num_buf_size - file_buf_size(%rbp), %rdx
    mov $file_buf_size, %rcx
    call make_buffered_file_reader
    
    part2_loop:
        mov %r12, %rdi
        call read_buf_file_byte
        jz part2_loop_end
        
        movb %al, (%r13)
        mov %r13, %rdi
        mov $1, %rsi
        call print_n
        # call newline
        
        jmp part2_loop
    part2_loop_end:
    
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
    .string "inputfiles/day2/ex1.txt"
    # .string "testfile.txt"

space:
    .string " "
