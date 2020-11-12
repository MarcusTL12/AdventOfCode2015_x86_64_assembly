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
    imul $1000, %rcx
    add %rcx, %rdx
    
    set_grid_loop:
        
        
        dec %r9
        jnz set_grid_loop
    ret


day6_part1:
    .set num_buffer, 4 * 8
    push %rbp
    mov %rsp, %rbp
    sub $num_buffer, %rsp
    
    
    mov $teststring3, %rdi
    call strlen
    mov %rax, %rsi
    mov $teststring3, %rdi
    lea -num_buffer(%rbp), %rdx
    call parse_input_numbers
    
    mov -num_buffer(%rbp), %rdi
    call print_int_dec_s
    call newline
    
    mov -num_buffer + 8(%rbp), %rdi
    call print_int_dec_s
    call newline
    
    mov -num_buffer + 2 * 8(%rbp), %rdi
    call print_int_dec_s
    call newline
    
    mov -num_buffer + 3 * 8(%rbp), %rdi
    call print_int_dec_s
    call newline
    
    leave
    
    ret


day6_part2:
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


teststring1:
    .string "turn off 499,499 through 500,500"

teststring2:
    .string "turn on 0,0 through 999,999"

teststring3:
    .string "toggle 0,0 through 999,0"
