.globl day8_part1
.globl day8_part2
.text


# Parametets:
# %rdi: Pointer to string
# %rsi: length of string
# Return length of the string after being parsed
reduced_length:
    xor %rax, %rax
    inc %rdi
    dec %rsi
    dec %rsi
    test %rsi, %rsi
    jz reduced_length_end
    reduced_length_loop:
        xor %r9, %r9
        xor %r10, %r10
        cmpb $'\\', (%rdi)
        sete %r9b
        cmpb $'x', 1(%rdi)
        cmove %r9, %r10
        shl $1, %r10
        
        add %r10, %r9
        add %r9, %rdi
        sub %r9, %rsi
        
        inc %rax
        inc %rdi
        dec %rsi
        jnz reduced_length_loop
    reduced_length_end:
    ret


# Parameters:
# %rdi: Line pointer
# %rsi: Line length
# %rdx: Accumulator
part1_map:
    add %rsi, (%rdx)
    call reduced_length
    sub %rax, (%rdx)
    ret


day8_part1:
    push %rbp
    mov %rsp, %rbp
    sub $8, %rsp
    
    movq $0, (%rsp)
    
    mov $inputfile, %rdi
    mov $40, %rsi
    mov $part1_map, %rdx
    mov %rsp, %rcx
    call file_map_lines
    
    mov (%rsp), %rdi
    call print_int_dec_s
    call newline
    
    leave
    ret


# Parameters:
# %rdi: Pointer to string
# %rsi: length of string
# Return length of the string before being parsed
expanded_length:
    xor %rax, %rax
    inc %rax
    inc %rax
    
    xor %rcx, %rcx
    
    expanded_length_loop:
        mov (%rdi), %r8b
        cmp $'"', %r8b
        sete %cl
        add %rcx, %rax
        
        cmp $'\\', %r8b
        sete %cl
        add %rcx, %rax
        
        inc %rax
        inc %rdi
        dec %rsi
        jnz expanded_length_loop
    ret


# Parameters:
# %rdi: Line pointer
# %rsi: Line length
# %rdx: Accumulator
part2_map:
    sub %rsi, (%rdx)
    call expanded_length
    add %rax, (%rdx)
    ret


day8_part2:
    push %rbp
    mov %rsp, %rbp
    sub $8, %rsp
    
    movq $0, (%rsp)
    
    mov $inputfile, %rdi
    mov $40, %rsi
    mov $part2_map, %rdx
    mov %rsp, %rcx
    call file_map_lines
    
    mov (%rsp), %rdi
    call print_int_dec_s
    call newline
    
    leave
    ret


.data

inputfile:
    .string "inputfiles/day8/input.txt"

teststring:
    .string "\"\\x27\""
