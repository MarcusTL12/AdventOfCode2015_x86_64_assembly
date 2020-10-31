.globl day3_part1
.globl day3_part2
.text

day3_part1:
    call hashmap_test
    ret


day3_part2:
    mov $message, %rdi
    call print
    call newline
    ret

.data

message:
    .string "Not Implemented!"
