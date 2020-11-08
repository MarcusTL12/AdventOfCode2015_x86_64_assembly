.globl day3_part1
.globl day3_part2
.text

# Parameters:
# %rdi: Pointer to 2d int point (8 bytes * 2)
# %rsi: character byte from input file (<>^v)
move_pos:
    # %r8 = Point[0] - 1
    # %r9 = Point[0] + 1
    # %r10 = Point[1] - 1
    # %r11 = Point[1] + 1
    mov (%rdi), %rdx
    mov 8(%rdi), %rcx
    mov %rdx, %r8
    mov %rdx, %r9
    mov %rcx, %r10
    mov %rcx, %r11
    dec %r8
    inc %r9
    dec %r10
    inc %r11
    
    cmp $'<', %rsi
    cmove %r8, %rdx
    
    cmp $'>', %rsi
    cmove %r9, %rdx
    
    
    cmp $'v', %rsi
    cmove %r10, %rcx
    
    cmp $'^', %rsi
    cmove %r11, %rcx
    
    mov %rdx, (%rdi)
    mov %rcx, 8(%rdi)
    ret


# Parameters:
# %rdi: Pointer to point
# %rsi: seed0
# %rdx: seed1
point_hash:
    mov %rdx, %rcx
    mov %rsi, %rdx
    mov $2 * 8, %rsi
    jmp hashmap_sip


# Parameters:
# %rdi: a
# %rsi: b
point_cmp:
    mov $2 * 8, %rdx
    jmp memcmp


# Parameters:
# %rdi: Point pointer
# returns true
iter_points:
    mov %rdi, %r8
    mov (%r8), %rdi
    call print_int_dec_s
    mov $comma, %rdi
    call print
    mov 8(%r8), %rdi
    call print_int_dec_s
    call newline
    mov $1, %rax
    ret


day3_part1:
    .set buf_size, 512
    push %r12
    push %r13
    push %r14
    
    # Local variables
    .set file_reader, 40
    .set file_buf, file_reader + buf_size
    .set position, file_buf + 8 * 2
    push %rbp
    mov %rsp, %rbp
    sub $position, %rsp
    
    mov $inputfile, %rdi
    call open_file_r
    mov %rax, %rsi
    
    lea -file_reader(%rbp), %r12
    mov %r12, %rdi
    lea -file_buf(%rbp), %rdx
    mov $buf_size, %rcx
    call make_buffered_file_reader
    
    lea -position(%rbp), %r13
    
    movq $0, (%r13)
    movq $0, 8(%r13)
    
    # Create hashmap and save pointer to %r14
    mov $8 * 2, %rdi
    xor %rsi, %rsi
    mov $point_hash, %rdx
    mov $point_cmp, %rcx
    call custom_hashmap_new
    mov %rax, %r14
    
    # Insert first point into hashmap
    mov %r14, %rdi
    mov %r13, %rsi
    call hashmap_set
    
    part1_loop:
        mov %r12, %rdi
        call read_buf_file_byte
        jz part1_loop_end
        
        lea (%r13), %rdi
        mov %rax, %rsi
        call move_pos
        
        mov %r14, %rdi
        mov %r13, %rsi
        call hashmap_set
        
        jmp part1_loop
    part1_loop_end:
    
    mov %r14, %rdi
    call hashmap_count
    mov %rax, %rdi
    call print_int_dec_s
    call newline
    
    mov %r14, %rdi
    call hashmap_free
    
    leave
    
    pop %r14
    pop %r13
    pop %r12
    
    ret


day3_part2:
    .set buf_size, 512
    push %r12
    push %r13
    push %r14
    push %r15
    
    # Local variables
    .set file_reader, 40
    .set file_buf, file_reader + buf_size
    .set santa, file_buf + 8 * 2
    .set bot, santa + 8 * 2
    push %rbp
    mov %rsp, %rbp
    sub $bot, %rsp
    
    mov $inputfile, %rdi
    call open_file_r
    mov %rax, %rsi
    
    lea -file_reader(%rbp), %r12
    mov %r12, %rdi
    lea -file_buf(%rbp), %rdx
    mov $buf_size, %rcx
    call make_buffered_file_reader
    
    lea -santa(%rbp), %r13
    lea -bot(%rbp), %r14
    
    movq $0, (%r13)
    movq $0, 8(%r13)
    movq $0, (%r14)
    movq $0, 8(%r14)
    
    # Create hashmap and save pointer to %r14
    mov $8 * 2, %rdi
    xor %rsi, %rsi
    mov $point_hash, %rdx
    mov $point_cmp, %rcx
    call custom_hashmap_new
    mov %rax, %r15
    
    # Insert first point into hashmap
    mov %r15, %rdi
    mov %r13, %rsi
    call hashmap_set
    
    part2_loop:
        mov %r12, %rdi
        call read_buf_file_byte
        jz part2_loop_end
        
        lea (%r13), %rdi
        mov %rax, %rsi
        call move_pos
        
        mov %r15, %rdi
        mov %r13, %rsi
        call hashmap_set
        
        xor %r13, %r14
        xor %r14, %r13
        xor %r13, %r14
        
        jmp part2_loop
    part2_loop_end:
    
    # Print length of hashmap
    mov %r15, %rdi
    call hashmap_count
    mov %rax, %rdi
    call print_int_dec_s
    call newline
    
    mov %r15, %rdi
    call hashmap_free
    
    leave
    
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    
    ret

.data

inputfile:
    .string "inputfiles/day3/input.txt"

comma:
    .string ", "

message:
    .string "Not Implemented!"
