.globl day6_part1
.globl day6_part2
.text


# Parameters
# %rdi: pointer to string
# Returns 1, -1 or 2 depending on the command
# turn on: 1
# turn on: -1
# turn on: 2
identify_type:
    push %r12
    push %r13
    mov %rdi, %r12
    
    mov $on, %rsi
    mov $on_length, %rdx
    call memcmp
    xor %r8, %r8
    inc %r8
    test %al, %al
    cmovz %r8, %r13
    jz ident_type_done
    
    mov %r12, %rdi
    mov $off, %rsi
    mov $off_length, %rdx
    call memcmp
    xor %r8, %r8
    dec %r8
    test %al, %al
    cmovz %r8, %r13
    
    # Naivly do not check for toggle and assume it is
    inc %r8
    inc %r8
    inc %r8
    test %al, %al
    cmovnz %r8, %r13
    
    ident_type_done:
    
    mov %r13, %rax
    
    pop %r13
    pop %r12
    ret


# Parameters:
# %rdi: Pointer to begining of line
# %rsi: length of line
# %rdx: Pointer to number buffer (4 * 8 bytes)
# Returns command type
parse_input_numbers:
    push %r12
    push %r13
    push %r14
    push %r15
    
    .set substring_pointers, 3 * 8
    .set length_pointers, substring_pointers + 3 * 8
    .set num_str_pointers, length_pointers + 2 * 8
    .set num_str_len_pointers, num_str_pointers + 2 * 8
    push %rbp
    mov %rsp, %rbp
    sub $num_str_len_pointers, %rsp
    
    mov %rdi, %r12
    mov %rsi, %r13
    mov %rdx, %r14
    
    # Identifying type and clipping header from string
    call identify_type
    mov %rax, %r15
    
    xor %r9, %r9
    
    mov $on_length + 1, %r8
    cmp $1, %r15
    cmove %r8, %r9
    
    mov $off_length + 1, %r8
    cmp $-1, %r15
    cmove %r8, %r9
    
    mov $toggle_length + 1, %r8
    cmp $2, %r15
    cmove %r8, %r9
    
    add %r9, %r12
    sub %r9, %r13
    
    # Splitting string on space
    mov %r12, %rdi
    mov %r13, %rsi
    mov $' ', %rdx
    lea -substring_pointers(%rbp), %rcx
    lea -length_pointers(%rbp), %r8
    mov $3, %r9
    call str_split_char
    
    # Splitting first pair of numbers and parsing into num buffer
    mov -substring_pointers(%rbp), %rdi
    mov -length_pointers(%rbp), %rsi
    mov $',', %rdx
    lea -num_str_pointers(%rbp), %rcx
    lea -num_str_len_pointers(%rbp), %r8
    mov $2, %r9
    call str_split_char
    
    mov -num_str_pointers(%rbp), %rdi
    mov -num_str_len_pointers(%rbp), %rsi
    call parse_str_int_n
    mov %rax, (%r14)
    
    mov -num_str_pointers + 8(%rbp), %rdi
    mov -num_str_len_pointers + 8(%rbp), %rsi
    call parse_str_int_n
    mov %rax, 8(%r14)
    
    # Splitting and parsing second pair
    mov -substring_pointers + 2 * 8(%rbp), %rdi
    mov -length_pointers + 2 * 8(%rbp), %rsi
    mov $',', %rdx
    lea -num_str_pointers(%rbp), %rcx
    lea -num_str_len_pointers(%rbp), %r8
    mov $2, %r9
    call str_split_char
    
    mov -num_str_pointers(%rbp), %rdi
    mov -num_str_len_pointers(%rbp), %rsi
    call parse_str_int_n
    mov %rax, 2 * 8(%r14)
    
    mov -num_str_pointers + 8(%rbp), %rdi
    mov -num_str_len_pointers + 8(%rbp), %rsi
    call parse_str_int_n
    mov %rax, 3 * 8(%r14)
    
    leave
    
    mov %r15, %rax
    
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    ret


# Parameters
# %rdi: Pointer to 1000 x 1000 grid of bytes
# %sil: Value to set
# %rdx: x coord of top-left corner
# %rcx: y coord -||-
# %r8: width
# %r9: height
set_grid:
    push %r12
    push %r13
    push %r14
    push %r15
    
    imul $1000, %rcx
    add %rcx, %rdx
    add %rdx, %rdi
    mov %rdi, %r12
    
    mov %r8, %r13
    mov %r9, %r14
    
    mov %rsi, %r15
    
    set_grid_loop:
        mov %r12, %rdi
        mov %r15, %rsi
        mov %r13, %rdx
        call memset
        
        add $1000, %r12
        dec %r14
        jnz set_grid_loop
    
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    ret


# Parameters:
# %rdi: pointer to grid
# %rsi: x coord of top-left corner
# %rdx: y coord -||-
# %rcx: width
# %r8: height
toggle_grid:
    imul $1000, %rdx
    add %rdx, %rsi
    add %rsi, %rdi
    
    xor %r9, %r9
    toggle_outer:
        xor %r10, %r10
        toggle_inner:
            mov %r9, %r11
            imul $1000, %r11
            add %r10, %r11
            
            mov (%rdi, %r11, 1), %dl
            test %dl, %dl
            setz %dl
            mov %dl, (%rdi, %r11, 1)
            
            inc %r10
            cmp %r10, %rcx
            jne toggle_inner
        inc %r9
        cmp %r9, %r8
        jne toggle_outer
    
    ret


# Parameters:
# %rdi: Pointer to 1000 x 1000 grid of bytes
# Returns amount of lights lit
count_lights:
    xor %rax, %rax
    xor %r8, %r8
    
    mov $1000 * 1000, %rcx
    
    count_loop:
        mov (%rdi), %r8b
        add %r8, %rax
        
        inc %rdi
        dec %rcx
        jnz count_loop
    
    ret


# Parameters:
# %rdi: Buffer to the 4 numbers
# Converts the numbers of the format (x1, y1, x2, y2)
# to the format (x1, y1, w, h)
convert_box:
    mov      (%rdi), %r8
    mov 1 * 8(%rdi), %r9
    mov 2 * 8(%rdi), %r10
    mov 3 * 8(%rdi), %r11
    
    sub %r8, %r10
    sub %r9, %r11
    
    inc %r10
    inc %r11
    
    mov %r10, 2 * 8(%rdi)
    mov %r11, 3 * 8(%rdi)
    ret


# Parameters:
# %rdi: Pointer to 1000 x 1000 grid of int64
# %rsi: Integer to add
# %rdx: x coord of top-left corner
# %rcx: y coord -||-
# %r8: width
# %r9: height
add_grid:
    imul $1000, %rcx
    add %rcx, %rdx
    lea (%rdi, %rdx, 8), %rdi
    
    xor %rax, %rax
    
    xor %r10, %r10
    add_outer:
        xor %r11, %r11
        add_inner:
            mov %r10, %rcx
            imul $1000, %rcx
            add %r11, %rcx
            
            mov (%rdi, %rcx, 8), %rdx
            add %rsi, %rdx
            cmp %rax, %rdx
            cmovl %rax, %rdx
            mov %rdx, (%rdi, %rcx, 8)
            
            inc %r11
            cmp %r11, %r8
            jne add_inner
        inc %r10
        cmp %r10, %r9
        jne add_outer
    
    ret


# Parameters:
# %rdi: Pointer to 1000 x 1000 grid of int64
total_brightness:
    xor %rax, %rax
    xor %r8, %r8
    
    mov $1000 * 1000, %rcx
    
    brightness_loop:
        mov (%rdi), %r8
        add %r8, %rax
        
        add $8, %rdi
        dec %rcx
        jnz brightness_loop
    ret


.set buf_size, 1000
.set line_size, 40

day6_part1:
    push %r12
    push %r13
    
    .set num_buffer, 4 * 8
    .set file_reader, num_buffer + 40
    .set file_buf, file_reader + buf_size
    .set line_buf, file_buf + line_size
    push %rbp
    mov %rsp, %rbp
    sub $line_buf, %rsp
    
    # Allocate grid
    mov $1000 * 1000, %rdi
    call malloc
    mov %rax, %r12
    
    # Zero grid
    mov %r12, %rdi
    xor %rsi, %rsi
    mov $1000 * 1000, %rdx
    call memset
    
    # Open file and create reader
    mov $inputfile, %rdi
    call open_file_r
    
    lea -file_reader(%rbp), %rdi
    mov %rax, %rsi
    lea -file_buf(%rbp), %rdx
    mov $buf_size, %rcx
    call make_buffered_file_reader
    
    part1_loop:
        lea -file_reader(%rbp), %rdi
        lea -line_buf(%rbp), %rsi
        call read_buf_file_line
        test %rax, %rax
        jz part1_loop_end
        
        lea -line_buf(%rbp), %rdi
        mov %rax, %rsi
        lea -num_buffer(%rbp), %rdx
        call parse_input_numbers
        mov %rax, %r13
        
        lea -num_buffer(%rbp), %rdi
        call convert_box
        
        cmp $2, %r13
        je part1_toggle
        
        cmp $1, %r13
        sete %sil
        
        mov %r12, %rdi
        mov -num_buffer(%rbp), %rdx
        mov -num_buffer + 8(%rbp), %rcx
        mov -num_buffer + 2 * 8(%rbp), %r8
        mov -num_buffer + 3 * 8(%rbp), %r9
        call set_grid
        
        jmp part1_loop
        part1_toggle:
        
        mov %r12, %rdi
        mov -num_buffer(%rbp), %rsi
        mov -num_buffer + 8(%rbp), %rdx
        mov -num_buffer + 2 * 8(%rbp), %rcx
        mov -num_buffer + 3 * 8(%rbp), %r8
        call toggle_grid
        
        jmp part1_loop
    part1_loop_end:
    
    # Count lights and print
    mov %r12, %rdi
    call count_lights
    mov %rax, %rdi
    call print_int_dec_s
    call newline
    
    # close file
    mov -file_reader(%rbp), %rdi
    call close_file
    
    # Free grid
    mov %r12, %rdi
    call free
    
    leave
    
    pop %r13
    pop %r12
    ret


day6_part2:
    push %r12
    push %r13
    
    .set num_buffer, 4 * 8
    .set file_reader, num_buffer + 40
    .set file_buf, file_reader + buf_size
    .set line_buf, file_buf + line_size
    push %rbp
    mov %rsp, %rbp
    sub $line_buf, %rsp
    
    # Allocate grid
    mov $1000 * 1000 * 8, %rdi
    call malloc
    mov %rax, %r12
    
    # Zero grid
    mov %r12, %rdi
    xor %rsi, %rsi
    mov $1000 * 1000 * 8, %rdx
    call memset
    
    # Open file and create reader
    mov $inputfile, %rdi
    call open_file_r
    
    lea -file_reader(%rbp), %rdi
    mov %rax, %rsi
    lea -file_buf(%rbp), %rdx
    mov $buf_size, %rcx
    call make_buffered_file_reader
    
    part2_loop:
        lea -file_reader(%rbp), %rdi
        lea -line_buf(%rbp), %rsi
        call read_buf_file_line
        test %rax, %rax
        jz part2_loop_end
        
        lea -line_buf(%rbp), %rdi
        mov %rax, %rsi
        lea -num_buffer(%rbp), %rdx
        call parse_input_numbers
        mov %rax, %r13
        
        lea -num_buffer(%rbp), %rdi
        call convert_box
        
        mov %r12, %rdi
        mov %r13, %rsi
        mov -num_buffer(%rbp), %rdx
        mov -num_buffer + 8(%rbp), %rcx
        mov -num_buffer + 2 * 8(%rbp), %r8
        mov -num_buffer + 3 * 8(%rbp), %r9
        call add_grid
        
        jmp part2_loop
    part2_loop_end:
    
    # Count lights and print
    mov %r12, %rdi
    call total_brightness
    mov %rax, %rdi
    call print_int_dec_s
    call newline
    
    # close file
    mov -file_reader(%rbp), %rdi
    call close_file
    
    # Free grid
    mov %r12, %rdi
    call free
    
    leave
    
    pop %r13
    pop %r12
    ret


.data

inputfile:
    .string "inputfiles/day6/input.txt"

on:
    .string "turn on"
.set on_length, 7
off:
    .string "turn off"
.set off_length, 8
toggle:
    .string "toggle"
.set toggle_length, 6

