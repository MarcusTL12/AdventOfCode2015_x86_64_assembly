.globl day5_part1
.globl day5_part2
.text

.set line_length, 16


# Parameters:
# %dil: character
# returns true if character is a vowel
is_vowel:
    xor %r9, %r9
    inc %r9
    xor %rax, %rax
    mov $vowels, %r8
    
    cmp %dil, (%r8)
    cmove %r9, %rax
    
    cmp %dil, 1(%r8)
    cmove %r9, %rax
    
    cmp %dil, 2(%r8)
    cmove %r9, %rax
    
    cmp %dil, 3(%r8)
    cmove %r9, %rax
    
    cmp %dil, 4(%r8)
    cmove %r9, %rax
    ret

# Parameters:
# %rdi: pointer to string of 2 characters
# returns true if string is in the blacklist
in_blacklist:
    xor %rax, %rax
    xor %r9, %r9
    inc %r9
    mov (%rdi), %r8w
    mov $blacklist, %r10
    
    cmp (%r10), %r8w
    cmove %r9, %rax
    
    cmp 2(%r10), %r8w
    cmove %r9, %rax
    
    cmp 4(%r10), %r8w
    cmove %r9, %rax
    
    cmp 6(%r10), %r8w
    cmove %r9, %rax
    ret


# Parameters:
# %rdi: String (line_length characters)
# returns true if contains >=3 vowels
has_3_vowels:
    # %r10 is save since "is_vowel" does not use it
    mov %rdi, %r10
    
    # amount of vowels
    xor %rdx, %rdx
    
    # loop counter
    mov $line_length, %rcx
    
    xor %r11, %r11
    
    vowel_loop:
        # add one to %rdx if character is vowel
        mov (%r10), %dil
        call is_vowel
        test %rax, %rax
        setnz %r11b
        add %r11, %rdx
        
        inc %r10
        dec %rcx
        jnz vowel_loop
    
    # %rax = (%rdx >= 3)
    xor %rax, %rax
    cmp $3, %rdx
    setge %al
    
    ret


# Parameters:
# %rdi: String (line_length characters)
# Returns true if string contains at least one character twice in a row
has_twin:
    mov $line_length - 1, %rcx
    
    # Last character
    mov (%rdi), %r8b
    inc %rdi
    
    xor %r11, %r11
    inc %r11
    
    xor %rax, %rax
    
    twin_loop:
        mov (%rdi), %r9b
        cmp %r8b, %r9b
        sete %r10b
        or %r10b, %al
        mov %r9, %r8
        
        test %rax, %rax
        cmovnz %r11, %rcx
        
        inc %rdi
        dec %rcx
        jnz twin_loop
    
    ret


# Parameters:
# %rdi: String (line_length characters)
# Returns true if string contains no string that is in the blacklist
has_no_blacklisted:
    mov $line_length - 1, %rcx
    
    xor %r9, %r9
    inc %r9
    
    xor %rdx, %rdx
    
    blacklist_loop:
        call in_blacklist
        test %rax, %rax
        setnz %dl
        cmovnz %r9, %rcx
        
        inc %rdi
        dec %rcx
        jnz blacklist_loop
    
    xor %rax, %rax
    test %rdx, %rdx
    setz %al
    
    ret


# Parameters:
# %rdi: String pointer (line_length bytes)
# Returns true if string is nice
is_nice:
    push %r12
    mov %rdi, %r12
    xor %rsi, %rsi
    inc %rsi
    
    mov %r12, %rdi
    call has_3_vowels
    and %rax, %rsi
    
    mov %r12, %rdi
    call has_twin
    and %rax, %rsi
    
    mov %r12, %rdi
    call has_no_blacklisted
    and %rax, %rsi
    
    mov %rsi, %rax
    
    pop %r12
    ret


day5_part1:
    .set buf_size, 1000
    
    # local varables
    .set file_reader, 40
    .set file_buf, file_reader + buf_size
    .set line_buf, file_buf + line_length
    push %rbp
    mov %rsp, %rbp
    sub $line_buf, %rsp
    
    push %r12
    push %r13
    
    mov $inputfile, %rdi
    call open_file_r
    mov %rax, %rsi
    
    lea -file_reader(%rbp), %r12
    mov %r12, %rdi
    lea -file_buf(%rbp), %rdx
    mov $buf_size, %rcx
    call make_buffered_file_reader
    
    # Store result in %r13
    xor %r13, %r13
    
    part1_loop:
        mov %r12, %rdi
        lea -line_buf(%rbp), %rsi
        call read_buf_file_line
        test %rax, %rax
        jz part1_loop_end
        
        lea -line_buf(%rbp), %rdi
        call is_nice
        xor %r8, %r8
        test %rax, %rax
        setnz %r8b
        add %r8, %r13
        
        jmp part1_loop
    part1_loop_end:
    
    mov %r13, %rdi
    call print_int_dec_s
    call newline
    
    mov (%r12), %rdi
    call close_file
    
    pop %r13
    pop %r12
    
    leave
    ret


day5_part2:
    ret


.data

vowels:
    .string "aeiou"

blacklist:
    .string "abcdpqxy"


inputfile:
    .string "inputfiles/day5/input.txt"


teststring:
    .string "ugknbfddgicrmopn"

teststring2:
    .string "dvszwmarrgswjxmb"
