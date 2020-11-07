	.text
	.file	"test.c"
	.globl	user_compare                    # -- Begin function user_compare
	.p2align	4, 0x90
	.type	user_compare,@function
user_compare:                           # @user_compare
.Lfunc_begin0:
	.file	1 "/mnt/c/Dev/AdventOfCode2015_x86_64_assembly" "test.c"
	.loc	1 10 0                          # test.c:10:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
.Ltmp0:
	.loc	1 11 29 prologue_end            # test.c:11:29
	movq	-8(%rbp), %rax
	.loc	1 11 24 is_stmt 0               # test.c:11:24
	movq	%rax, -32(%rbp)
	.loc	1 12 29 is_stmt 1               # test.c:12:29
	movq	-16(%rbp), %rax
	.loc	1 12 24 is_stmt 0               # test.c:12:24
	movq	%rax, -40(%rbp)
	.loc	1 13 19 is_stmt 1               # test.c:13:19
	movq	-32(%rbp), %rax
	.loc	1 13 23 is_stmt 0               # test.c:13:23
	movq	(%rax), %rdi
	.loc	1 13 29                         # test.c:13:29
	movq	-40(%rbp), %rax
	.loc	1 13 33                         # test.c:13:33
	movq	(%rax), %rsi
	.loc	1 13 12                         # test.c:13:12
	callq	strcmp
	.loc	1 13 5                          # test.c:13:5
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp1:
.Lfunc_end0:
	.size	user_compare, .Lfunc_end0-user_compare
	.cfi_endproc
                                        # -- End function
	.globl	user_iter                       # -- Begin function user_iter
	.p2align	4, 0x90
	.type	user_iter,@function
user_iter:                              # @user_iter
.Lfunc_begin1:
	.loc	1 16 0 is_stmt 1                # test.c:16:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
.Ltmp2:
	.loc	1 17 31 prologue_end            # test.c:17:31
	movq	-8(%rbp), %rax
	.loc	1 17 24 is_stmt 0               # test.c:17:24
	movq	%rax, -24(%rbp)
	.loc	1 18 29 is_stmt 1               # test.c:18:29
	movq	-24(%rbp), %rax
	.loc	1 18 35 is_stmt 0               # test.c:18:35
	movq	(%rax), %rsi
	.loc	1 18 41                         # test.c:18:41
	movq	-24(%rbp), %rax
	.loc	1 18 47                         # test.c:18:47
	movl	8(%rax), %edx
	.loc	1 18 5                          # test.c:18:5
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	.loc	1 19 5 is_stmt 1                # test.c:19:5
	movb	$1, %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp3:
.Lfunc_end1:
	.size	user_iter, .Lfunc_end1-user_iter
	.cfi_endproc
                                        # -- End function
	.globl	user_hash                       # -- Begin function user_hash
	.p2align	4, 0x90
	.type	user_hash,@function
user_hash:                              # @user_hash
.Lfunc_begin2:
	.loc	1 22 0                          # test.c:22:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
.Ltmp4:
	.loc	1 23 31 prologue_end            # test.c:23:31
	movq	-8(%rbp), %rax
	.loc	1 23 24 is_stmt 0               # test.c:23:24
	movq	%rax, -32(%rbp)
	.loc	1 24 24 is_stmt 1               # test.c:24:24
	movq	-32(%rbp), %rax
	.loc	1 24 30 is_stmt 0               # test.c:24:30
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)                 # 8-byte Spill
	.loc	1 24 43                         # test.c:24:43
	movq	-32(%rbp), %rax
	.loc	1 24 49                         # test.c:24:49
	movq	(%rax), %rdi
	.loc	1 24 36                         # test.c:24:36
	callq	strlen
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movq	%rax, %rsi
	.loc	1 24 56                         # test.c:24:56
	movq	-16(%rbp), %rdx
	.loc	1 24 63                         # test.c:24:63
	movq	-24(%rbp), %rcx
	.loc	1 24 12                         # test.c:24:12
	callq	hashmap_sip
	.loc	1 24 5                          # test.c:24:5
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp5:
.Lfunc_end2:
	.size	user_hash, .Lfunc_end2-user_hash
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	1 27 0 is_stmt 1                # test.c:27:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	xorl	%eax, %eax
	movl	%eax, %ecx
.Ltmp6:
	.loc	1 31 27 prologue_end            # test.c:31:27
	movl	$16, %edi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	movabsq	$user_hash, %r8
	movabsq	$user_compare, %r9
	movq	$0, (%rsp)
	callq	hashmap_new
	.loc	1 31 21 is_stmt 0               # test.c:31:21
	movq	%rax, -8(%rbp)
	.loc	1 36 17 is_stmt 1               # test.c:36:17
	movq	-8(%rbp), %rdi
	.loc	1 36 36 is_stmt 0               # test.c:36:36
	movabsq	$.L.str.1, %rax
	movq	%rax, -24(%rbp)
	movl	$44, -16(%rbp)
	.loc	1 36 22                         # test.c:36:22
	leaq	-24(%rbp), %rsi
	.loc	1 36 5                          # test.c:36:5
	callq	hashmap_set
	.loc	1 37 17 is_stmt 1               # test.c:37:17
	movq	-8(%rbp), %rdi
	.loc	1 37 36 is_stmt 0               # test.c:37:36
	movabsq	$.L.str.2, %rax
	movq	%rax, -40(%rbp)
	movl	$68, -32(%rbp)
	.loc	1 37 22                         # test.c:37:22
	leaq	-40(%rbp), %rsi
	.loc	1 37 5                          # test.c:37:5
	callq	hashmap_set
	.loc	1 38 17 is_stmt 1               # test.c:38:17
	movq	-8(%rbp), %rdi
	.loc	1 38 36 is_stmt 0               # test.c:38:36
	movabsq	$.L.str.3, %rax
	movq	%rax, -56(%rbp)
	movl	$47, -48(%rbp)
	.loc	1 38 22                         # test.c:38:22
	leaq	-56(%rbp), %rsi
	.loc	1 38 5                          # test.c:38:5
	callq	hashmap_set
	.loc	1 42 5 is_stmt 1                # test.c:42:5
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
	.loc	1 43 24                         # test.c:43:24
	movq	-8(%rbp), %rdi
	.loc	1 43 43 is_stmt 0               # test.c:43:43
	movabsq	$.L.str.3, %rax
	movq	%rax, -80(%rbp)
	movl	$0, -72(%rbp)
	.loc	1 43 29                         # test.c:43:29
	leaq	-80(%rbp), %rsi
	.loc	1 43 12                         # test.c:43:12
	callq	hashmap_get
	.loc	1 43 10                         # test.c:43:10
	movq	%rax, -64(%rbp)
	.loc	1 44 27 is_stmt 1               # test.c:44:27
	movq	-64(%rbp), %rax
	.loc	1 44 33 is_stmt 0               # test.c:44:33
	movq	(%rax), %rsi
	.loc	1 44 39                         # test.c:44:39
	movq	-64(%rbp), %rax
	.loc	1 44 45                         # test.c:44:45
	movl	8(%rax), %edx
	.loc	1 44 5                          # test.c:44:5
	movabsq	$.L.str.5, %rdi
	movb	$0, %al
	callq	printf
	.loc	1 46 24 is_stmt 1               # test.c:46:24
	movq	-8(%rbp), %rdi
	.loc	1 46 43 is_stmt 0               # test.c:46:43
	movabsq	$.L.str.2, %rax
	movq	%rax, -96(%rbp)
	movl	$0, -88(%rbp)
	.loc	1 46 29                         # test.c:46:29
	leaq	-96(%rbp), %rsi
	.loc	1 46 12                         # test.c:46:12
	callq	hashmap_get
	.loc	1 46 10                         # test.c:46:10
	movq	%rax, -64(%rbp)
	.loc	1 47 27 is_stmt 1               # test.c:47:27
	movq	-64(%rbp), %rax
	.loc	1 47 33 is_stmt 0               # test.c:47:33
	movq	(%rax), %rsi
	.loc	1 47 39                         # test.c:47:39
	movq	-64(%rbp), %rax
	.loc	1 47 45                         # test.c:47:45
	movl	8(%rax), %edx
	.loc	1 47 5                          # test.c:47:5
	movabsq	$.L.str.5, %rdi
	movb	$0, %al
	callq	printf
	.loc	1 49 24 is_stmt 1               # test.c:49:24
	movq	-8(%rbp), %rdi
	.loc	1 49 43 is_stmt 0               # test.c:49:43
	movabsq	$.L.str.1, %rax
	movq	%rax, -112(%rbp)
	movl	$0, -104(%rbp)
	.loc	1 49 29                         # test.c:49:29
	leaq	-112(%rbp), %rsi
	.loc	1 49 12                         # test.c:49:12
	callq	hashmap_get
	.loc	1 49 10                         # test.c:49:10
	movq	%rax, -64(%rbp)
	.loc	1 50 27 is_stmt 1               # test.c:50:27
	movq	-64(%rbp), %rax
	.loc	1 50 33 is_stmt 0               # test.c:50:33
	movq	(%rax), %rsi
	.loc	1 50 39                         # test.c:50:39
	movq	-64(%rbp), %rax
	.loc	1 50 45                         # test.c:50:45
	movl	8(%rax), %edx
	.loc	1 50 5                          # test.c:50:5
	movabsq	$.L.str.5, %rdi
	movb	$0, %al
	callq	printf
	.loc	1 52 24 is_stmt 1               # test.c:52:24
	movq	-8(%rbp), %rdi
	.loc	1 52 43 is_stmt 0               # test.c:52:43
	movabsq	$.L.str.6, %rax
	movq	%rax, -128(%rbp)
	movl	$0, -120(%rbp)
	.loc	1 52 29                         # test.c:52:29
	leaq	-128(%rbp), %rsi
	.loc	1 52 12                         # test.c:52:12
	callq	hashmap_get
	.loc	1 52 10                         # test.c:52:10
	movq	%rax, -64(%rbp)
	.loc	1 53 20 is_stmt 1               # test.c:53:20
	movq	-64(%rbp), %rax
	cmpq	$0, %rax
	movabsq	$.L.str.8, %rax
	movabsq	$.L.str.9, %rsi
	cmovneq	%rax, %rsi
	.loc	1 53 5 is_stmt 0                # test.c:53:5
	movabsq	$.L.str.7, %rdi
	movb	$0, %al
	callq	printf
	.loc	1 55 5 is_stmt 1                # test.c:55:5
	movabsq	$.L.str.10, %rdi
	movb	$0, %al
	callq	printf
	xorl	%eax, %eax
	movl	%eax, %edx
	.loc	1 56 18                         # test.c:56:18
	movq	-8(%rbp), %rdi
	.loc	1 56 5 is_stmt 0                # test.c:56:5
	movabsq	$user_iter, %rsi
	callq	hashmap_scan
	.loc	1 58 18 is_stmt 1               # test.c:58:18
	movq	-8(%rbp), %rdi
	.loc	1 58 5 is_stmt 0                # test.c:58:5
	callq	hashmap_free
	xorl	%eax, %eax
	.loc	1 59 1 is_stmt 1                # test.c:59:1
	addq	$144, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp7:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%s (age=%d)\n"
	.size	.L.str, 13

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Dale"
	.size	.L.str.1, 5

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Roger"
	.size	.L.str.2, 6

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Jane"
	.size	.L.str.3, 5

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\n-- get some users --\n"
	.size	.L.str.4, 23

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"%s age=%d\n"
	.size	.L.str.5, 11

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Tom"
	.size	.L.str.6, 4

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"%s\n"
	.size	.L.str.7, 4

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"exists"
	.size	.L.str.8, 7

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"not exists"
	.size	.L.str.9, 11

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"\n-- iterate over all users --\n"
	.size	.L.str.10, 31

	.file	2 "/usr/include/x86_64-linux-gnu/bits" "types.h"
	.file	3 "/usr/include/x86_64-linux-gnu/bits" "stdint-uintn.h"
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x1c4 DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0x1 DW_TAG_pointer_type
	.byte	3                               # Abbrev [3] 0x2b:0x60 DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string3                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	343                             # DW_AT_type
                                        # DW_AT_external
	.byte	4                               # Abbrev [4] 0x44:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string12                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.long	386                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x52:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string13                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.long	386                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x60:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string14                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.long	42                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0x6e:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string15                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.long	392                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x7c:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	88
	.long	.Linfo_string20                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.long	392                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0x8b:0x44 DW_TAG_subprogram
	.quad	.Lfunc_begin1                   # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string5                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	350                             # DW_AT_type
                                        # DW_AT_external
	.byte	4                               # Abbrev [4] 0xa4:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string21                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.long	386                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0xb2:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string14                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.long	42                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0xc0:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string19                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	17                              # DW_AT_decl_line
	.long	392                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0xcf:0x52 DW_TAG_subprogram
	.quad	.Lfunc_begin2                   # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string7                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	357                             # DW_AT_type
                                        # DW_AT_external
	.byte	4                               # Abbrev [4] 0xe8:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string21                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
	.long	386                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0xf6:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string22                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
	.long	357                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x104:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string23                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
	.long	357                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x112:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string19                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	23                              # DW_AT_decl_line
	.long	392                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x121:0x36 DW_TAG_subprogram
	.quad	.Lfunc_begin3                   # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string11                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.long	343                             # DW_AT_type
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x13a:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string24                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	31                              # DW_AT_decl_line
	.long	447                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x148:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	64
	.long	.Linfo_string19                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	40                              # DW_AT_decl_line
	.long	457                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x157:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x15e:0x7 DW_TAG_base_type
	.long	.Linfo_string6                  # DW_AT_name
	.byte	2                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x165:0xb DW_TAG_typedef
	.long	368                             # DW_AT_type
	.long	.Linfo_string10                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.byte	8                               # Abbrev [8] 0x170:0xb DW_TAG_typedef
	.long	379                             # DW_AT_type
	.long	.Linfo_string9                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	45                              # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x17b:0x7 DW_TAG_base_type
	.long	.Linfo_string8                  # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	9                               # Abbrev [9] 0x182:0x5 DW_TAG_pointer_type
	.long	391                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0x187:0x1 DW_TAG_const_type
	.byte	9                               # Abbrev [9] 0x188:0x5 DW_TAG_pointer_type
	.long	397                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x18d:0x5 DW_TAG_const_type
	.long	402                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0x192:0x21 DW_TAG_structure_type
	.long	.Linfo_string19                 # DW_AT_name
	.byte	16                              # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.byte	13                              # Abbrev [13] 0x19a:0xc DW_TAG_member
	.long	.Linfo_string16                 # DW_AT_name
	.long	435                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	13                              # Abbrev [13] 0x1a6:0xc DW_TAG_member
	.long	.Linfo_string18                 # DW_AT_name
	.long	343                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x1b3:0x5 DW_TAG_pointer_type
	.long	440                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x1b8:0x7 DW_TAG_base_type
	.long	.Linfo_string17                 # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	9                               # Abbrev [9] 0x1bf:0x5 DW_TAG_pointer_type
	.long	452                             # DW_AT_type
	.byte	14                              # Abbrev [14] 0x1c4:0x5 DW_TAG_structure_type
	.long	.Linfo_string25                 # DW_AT_name
                                        # DW_AT_declaration
	.byte	9                               # Abbrev [9] 0x1c9:0x5 DW_TAG_pointer_type
	.long	402                             # DW_AT_type
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 12.0.0-++20201026065856+bd07be4f3f7-1~exp1~20201026180537.203" # string offset=0
.Linfo_string1:
	.asciz	"test.c"                        # string offset=83
.Linfo_string2:
	.asciz	"/mnt/c/Dev/AdventOfCode2015_x86_64_assembly" # string offset=90
.Linfo_string3:
	.asciz	"user_compare"                  # string offset=134
.Linfo_string4:
	.asciz	"int"                           # string offset=147
.Linfo_string5:
	.asciz	"user_iter"                     # string offset=151
.Linfo_string6:
	.asciz	"_Bool"                         # string offset=161
.Linfo_string7:
	.asciz	"user_hash"                     # string offset=167
.Linfo_string8:
	.asciz	"long unsigned int"             # string offset=177
.Linfo_string9:
	.asciz	"__uint64_t"                    # string offset=195
.Linfo_string10:
	.asciz	"uint64_t"                      # string offset=206
.Linfo_string11:
	.asciz	"main"                          # string offset=215
.Linfo_string12:
	.asciz	"a"                             # string offset=220
.Linfo_string13:
	.asciz	"b"                             # string offset=222
.Linfo_string14:
	.asciz	"udata"                         # string offset=224
.Linfo_string15:
	.asciz	"ua"                            # string offset=230
.Linfo_string16:
	.asciz	"name"                          # string offset=233
.Linfo_string17:
	.asciz	"char"                          # string offset=238
.Linfo_string18:
	.asciz	"age"                           # string offset=243
.Linfo_string19:
	.asciz	"user"                          # string offset=247
.Linfo_string20:
	.asciz	"ub"                            # string offset=252
.Linfo_string21:
	.asciz	"item"                          # string offset=255
.Linfo_string22:
	.asciz	"seed0"                         # string offset=260
.Linfo_string23:
	.asciz	"seed1"                         # string offset=266
.Linfo_string24:
	.asciz	"map"                           # string offset=272
.Linfo_string25:
	.asciz	"hashmap"                       # string offset=276
	.ident	"Ubuntu clang version 12.0.0-++20201026065856+bd07be4f3f7-1~exp1~20201026180537.203"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym user_compare
	.addrsig_sym strcmp
	.addrsig_sym user_iter
	.addrsig_sym printf
	.addrsig_sym user_hash
	.addrsig_sym hashmap_sip
	.addrsig_sym strlen
	.addrsig_sym hashmap_new
	.addrsig_sym hashmap_set
	.addrsig_sym hashmap_get
	.addrsig_sym hashmap_scan
	.addrsig_sym hashmap_free
	.section	.debug_line,"",@progbits
.Lline_table_start0:
