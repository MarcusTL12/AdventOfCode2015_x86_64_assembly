.globl _start
.text

_start:
    # Check if 2 or more command line arguments was passed
    mov (%rsp), %r8
    cmp $3, %r8
    jge argc_correct
    mov $argc_incorrect_message, %rdi
    call print
    call newline
    jmp exit
    
    # parses the two command line arguments as integers and stores them
    # in %r12: day, %r13: part
    argc_correct:
    # Day
    mov 16(%rsp), %rdi
    call parse_str_int
    mov %rax, %r12
    
    # Part
    mov 24(%rsp), %rdi
    call parse_str_int
    mov %rax, %r13
    
    # Check if day is less than 1
    cmp $1, %r12
    jl day_not_implemented
    
    # Check if day is greater than the specified number of days
    mov $amt_days, %r8
    mov (%r8), %r8
    cmp %r8, %r12
    jg day_not_implemented
    
    # Check if part is less than 1
    cmp $1, %r13
    jl part_not_implemented
    
    # Check if part is greater than 2
    cmp $2, %r13
    jg part_not_implemented
    
    # If we've come here, everything should be good to go for executing
    # the correct day
    
    # Setting both day and part to 0 indexed, and multiplying day by 2
    # That way 2 * day + part will give the correct offset
    dec %r12
    shl %r12
    dec %r13
    
    # Adding them together and multiplying by 8 to get the correct
    # offset in bytes
    add %r13, %r12
    imul $8, %r12
    
    # Adds that offset to the memory address of the list and calls
    mov $daylist, %r8
    add %r12, %r8
    call *(%r8)
    
    jmp exit
    day_not_implemented:
    mov $day_not_implemented_message, %rdi
    call print
    call newline
    jmp exit
    
    part_not_implemented:
    mov $part_not_implemented_message, %rdi
    call print
    call newline

exit:
    mov $60, %rax
    xor %rdi, %rdi
    syscall

.data

argc_incorrect_message:
    .string "Give day and part as command line arguments"

day_not_implemented_message:
    .string "Day does not exist"

part_not_implemented_message:
    .string "Part does not exist"

amt_days:
    .quad 1

daylist:
    .quad day1_part1, day1_part2
