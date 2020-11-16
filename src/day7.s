.globl day7_part1
.globl day7_part2
.text


# Hashmap program struct
# Size: 35 bytes (only key: 16 bytes)
# [0, 8): length of key
# [8, 16): pointer to key
# [16, 24): length of instruction string
# [24, 32): pointer to instruction string
# [32, 33): bool: has the answer been found?
# [33, 35): answer


# Parameters:
# %rdi: program hashmap
# %rsi: pointer to line
# %rdx: length of line
parse_line:
    push %rbx
    mov %rdi, %rbx
    
    .set token_iter, 17
    .set token_pointer, token_iter + 8
    .set prog_struct, token_pointer + 35
    push %rbp
    mov %rsp, %rbp
    sub $prog_struct, %rsp
    
    lea -token_iter(%rbp), %rdi
    mov $'>', %rcx
    call str_make_token_iterator
    
    lea -token_iter(%rbp), %rdi
    lea -token_pointer(%rbp), %rsi
    call str_next_token
    
    sub $2, %rax
    mov %rax, -prog_struct + 16(%rbp)
    mov -token_pointer(%rbp), %rcx
    mov %rcx, -prog_struct + 24(%rbp)
    
    lea -token_iter(%rbp), %rdi
    lea -token_pointer(%rbp), %rsi
    call str_next_token
    
    dec %rax
    mov %rax, -prog_struct(%rbp)
    mov -token_pointer(%rbp), %rcx
    inc %rcx
    mov %rcx, -prog_struct + 8(%rbp)
    
    mov %rbx, %rdi
    lea -prog_struct(%rbp), %rsi
    call hashmap_set
    
    leave
    
    pop %rbx
    ret


# Paramaters
# %rdi: pointer to input data
# %rsi: length of data
# Returns program map
parse_input:
    .set token_iter, 17
    .set token_pointer, token_iter + 8
    .set program_map, token_pointer + 8
    push %rbp
    mov %rsp, %rbp
    sub $program_map, %rsp
    
    push %rdi
    push %rsi
    
    mov $41, %rdi
    xor %rsi, %rsi
    mov $generic_hash, %rdx
    mov $generic_compare, %rcx
    call custom_hashmap_new
    mov %rax, -program_map(%rbp)
    
    pop %rsi
    pop %rdi
    
    mov %rsi, %rdx
    mov %rdi, %rsi
    lea -token_iter(%rbp), %rdi
    mov $'\n', %rcx
    call str_make_token_iterator
    
    parse_loop:
        lea -token_iter(%rbp), %rdi
        lea -token_pointer(%rbp), %rsi
        call str_next_token
        test %rax, %rax
        jz parse_loop_end
        
        mov -program_map(%rbp), %rdi
        mov -token_pointer(%rbp), %rsi
        mov %rax, %rdx
        call parse_line
        
        jmp parse_loop
    parse_loop_end:
    
    mov -program_map(%rbp), %rax
    
    leave
    ret


# Parameters:
# %rdi: pointer to struct
# returns true
prog_map_iter:
    push %rbx
    mov %rdi, %rbx
    mov 8(%rbx), %rdi
    mov (%rbx), %rsi
    call print_n
    
    mov $arrow, %rdi
    call print
    
    mov 24(%rbx), %rdi
    mov 16(%rbx), %rsi
    call print_n
    call newline
    
    mov $1, %rax
    pop %rbx
    ret


# Parameters:
# %rdi: pointer to struct
# returns true
prog_map_iter_vals:
    push %rbx
    mov %rdi, %rbx
    mov 8(%rbx), %rdi
    mov (%rbx), %rsi
    call print_n
    
    mov $arrow, %rdi
    call print
    
    xor %r8, %r8
    dec %r8
    
    xor %rdi, %rdi
    mov 33(%rbx), %di
    mov 32(%rbx), %cl
    test %cl, %cl
    cmovz %r8, %rdi
    call print_int_dec_s
    call newline
    
    mov $1, %rax
    pop %rbx
    ret


# Parameters:
# %rdi: program map
# %rsi: pointer to instruction string
# %rdx: length of instruction string
# Returns 16 bit instruction result
eval_instruction:
    .set substr_ptrs, 8 * 3
    .set substr_lens, substr_ptrs + 8 * 3
    push %rbp
    mov %rsp, %rbp
    sub $substr_lens, %rsp
    
    push %rbx
    mov %rdi, %rbx
    
    
    
    pop %rbx
    
    mov $0, %ax
    leave
    ret


# Parameters:
# %rdi: program map
# %rsi: wire string pointer
# %rdx: wire string length
# Returns the 16 bit value of the wire
eval_wire:
    .set prog_struct, 16
    push %rbp
    mov %rsp, %rbp
    sub $prog_struct, %rsp
    
    push %rbx
    mov %rdi, %rbx
    
    mov %rsi, -prog_struct + 8(%rbp)
    mov %rdx, -prog_struct(%rbp)
    
    lea -prog_struct(%rbp), %rsi
    call hashmap_get
    
    mov %rbx, %rdi
    pop %rbx
    
    mov 32(%rax), %cl
    test %cl, %cl
    jnz eval_wire_precomputed
    
    push %rbx
    mov %rax, %rbx
    
    mov 24(%rbx), %rsi
    mov 16(%rbx), %rdx
    call eval_instruction
    
    movb $1, 32(%rbx)
    mov %ax, 33(%rbx)
    
    pop %rbx
    
    leave
    ret
    
    eval_wire_precomputed:
    mov 33(%rax), %ax
    leave
    ret


day7_part1:
    push %rbx
    
    .set input_buffer, 8
    .set input_size, input_buffer + 8
    push %rbp
    mov %rsp, %rbp
    sub $input_size, %rsp
    
    mov $inputfile, %rdi
    call file_size
    mov %rax, -input_size(%rbp)
    mov %rax, %rdi
    call malloc
    mov %rax, -input_buffer(%rbp)
    
    mov $inputfile, %rdi
    call open_file_r
    mov %rax, %rbx
    
    mov %rbx, %rdi
    mov -input_buffer(%rbp), %rsi
    mov -input_size(%rbp), %rdx
    call read_file
    
    mov %rbx, %rdi
    call close_file
    
    mov -input_buffer(%rbp), %rdi
    mov -input_size(%rbp), %rsi
    call parse_input
    
    mov %rax, %rbx
    
    # mov %rbx, %rdi
    # mov $prog_map_iter, %rsi
    # call hashmap_scan
    
    mov %rbx, %rdi
    mov $target_wire, %rsi
    mov $1, %rdx
    call eval_wire
    
    xor %rdi, %rdi
    mov %ax, %di
    call print_int_dec_s
    call newline
    
    mov %rbx, %rdi
    mov $prog_map_iter_vals, %rsi
    call hashmap_scan
    
    mov %rbx, %rdi
    call hashmap_free
    
    mov -input_buffer(%rbp), %rdi
    call free
    
    leave
    
    pop %rbx
    ret


day7_part2:
    ret


.data

inputfile:
    .string "inputfiles/day7/ex1.txt"

target_wire:
    .string "i"

arrow:
    .string " => "
