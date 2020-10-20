.globl day1_part1
.globl day1_part2
.text

# Parameters:
# %rdi: pointer to buffer
# %rsi: length of buffer
# Returns:
# resulting floor
part1_get_floor:
    xor %rax, %rax
    get_floor_loop:
        cmp $0, %rsi
        je get_floor_loop_end
        
        xor %r8, %r8
        movb (%rdi), %r8b
        sub $40, %r8
        shl $1, %r8
        dec %r8
        
        sub %r8, %rax
        
        inc %rdi
        dec %rsi
        
        jmp get_floor_loop
    get_floor_loop_end:
    ret

day1_part1:
    .set buffer_size, 512
    # Open file
    push %r12
    mov $filename, %rdi
    call open_file_r
    mov %rax, %r12
    
    # Allocating local varables
    # rbp -buffer_size: character buffer
    push %rbp
    mov %rsp, %rbp
    sub $buffer_size, %rsp
    
    xor %r9, %r9
    
    part1_loop:
        mov %r12, %rdi
        mov %rbp, %rsi
        sub $buffer_size, %rsi
        mov $buffer_size, %rdx
        call read_file
        
        cmp $0, %rax
        je part1_loop_end
        
        mov %rbp, %rdi
        sub $buffer_size, %rdi
        mov %rax, %rsi
        call part1_get_floor
        add %rax, %r9
        jmp part1_loop
    part1_loop_end:
    
    mov %r9, %rdi
    call print_int_dec_s
    call newline
    
    # Freeing local variables
    leave
    
    mov %r12, %rdi
    call close_file
    
    pop %r12
    ret

day1_part2:
    .set buffer_size, 512
    # Open file
    push %r12
    mov $filename, %rdi
    call open_file_r
    mov %rax, %r12
    
    # Allocate local variables
    # char buffer = %rbp - buffer_size
    push %rbp
    mov %rsp, %rbp
    sub $buffer_size, %rsp
    
    xor %r8, %r8
    xor %r9, %r9
    xor %r10, %r10
    xor %rbx, %rbx
    
    part2_loop:
        cmp %r8, %r9
        jl part2_dont_load_more
            mov %r12, %rdi
            mov %rbp, %rsi
            sub $buffer_size, %rsi
            mov $buffer_size, %rdx
            call read_file
            mov %rax, %r8
            xor %r9, %r9
        part2_dont_load_more:
        
        mov %rbp, %r11
        sub $buffer_size, %r11
        add %r9, %r11
        movb (%r11), %r11b
        and $0xff, %r11
        sub $40, %r11
        shl $1, %r11
        dec %r11
        sub %r11, %r10
        
        inc %r9
        inc %rbx
        
        cmp $-1, %r10
        jne part2_loop
    
    mov %rbx, %rdi
    call print_int_dec
    call newline
    
    leave
    
    mov %r12, %rdi
    call close_file
    
    pop %r12
    ret

.data

filename:
    .string "inputfiles/day1.txt"
