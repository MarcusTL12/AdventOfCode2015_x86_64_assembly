.globl day7_part1
.globl day7_part2
.text


.set name_buffer_size, 1000

day7_part1:
    mov $inputfile, %rdi
    call file_size
    mov %rax, %rdi
    call print_int_dec_s
    call newline
    ret


day7_part2:
    ret


.data

inputfile:
    .string "inputfiles/day7/input.txt"
