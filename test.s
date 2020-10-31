	.text
	.file	"test.c"
	.globl	user_compare                    # -- Begin function user_compare
	.p2align	4, 0x90
	.type	user_compare,@function
user_compare:                           # @user_compare
	.cfi_startproc
# %bb.0:
	movq	(%rdi), %rdi
	movq	(%rsi), %rsi
	jmp	strcmp                          # TAILCALL
.Lfunc_end0:
	.size	user_compare, .Lfunc_end0-user_compare
	.cfi_endproc
                                        # -- End function
	.globl	user_iter                       # -- Begin function user_iter
	.p2align	4, 0x90
	.type	user_iter,@function
user_iter:                              # @user_iter
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rsi
	movl	8(%rdi), %edx
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movb	$1, %al
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	user_iter, .Lfunc_end1-user_iter
	.cfi_endproc
                                        # -- End function
	.globl	user_hash                       # -- Begin function user_hash
	.p2align	4, 0x90
	.type	user_hash,@function
user_hash:                              # @user_hash
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	(%rdi), %rbx
	movq	%rbx, %rdi
	callq	strlen
	movq	%rbx, %rdi
	movq	%rax, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	hashmap_sip                     # TAILCALL
.Lfunc_end2:
	.size	user_hash, .Lfunc_end2-user_hash
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$128, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -16
	movq	$0, (%rsp)
	movl	$16, %edi
	movl	$user_hash, %r8d
	movl	$user_compare, %r9d
	xorl	%esi, %esi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	callq	hashmap_new
	movq	%rax, %rbx
	movq	$.L.str.1, 112(%rsp)
	movl	$44, 120(%rsp)
	leaq	112(%rsp), %rsi
	movq	%rax, %rdi
	callq	hashmap_set
	movq	$.L.str.2, 96(%rsp)
	movl	$68, 104(%rsp)
	leaq	96(%rsp), %rsi
	movq	%rbx, %rdi
	callq	hashmap_set
	movq	$.L.str.3, 80(%rsp)
	movl	$47, 88(%rsp)
	leaq	80(%rsp), %rsi
	movq	%rbx, %rdi
	callq	hashmap_set
	movl	$.Lstr, %edi
	callq	puts
	movq	$.L.str.3, 64(%rsp)
	movl	$0, 72(%rsp)
	leaq	64(%rsp), %rsi
	movq	%rbx, %rdi
	callq	hashmap_get
	movq	(%rax), %rsi
	movl	8(%rax), %edx
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movq	$.L.str.2, 48(%rsp)
	movl	$0, 56(%rsp)
	leaq	48(%rsp), %rsi
	movq	%rbx, %rdi
	callq	hashmap_get
	movq	(%rax), %rsi
	movl	8(%rax), %edx
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movq	$.L.str.1, 32(%rsp)
	movl	$0, 40(%rsp)
	leaq	32(%rsp), %rsi
	movq	%rbx, %rdi
	callq	hashmap_get
	movq	(%rax), %rsi
	movl	8(%rax), %edx
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movq	$.L.str.6, 16(%rsp)
	movl	$0, 24(%rsp)
	leaq	16(%rsp), %rsi
	movq	%rbx, %rdi
	callq	hashmap_get
	testq	%rax, %rax
	movl	$.L.str.9, %eax
	movl	$.L.str.8, %edi
	cmoveq	%rax, %rdi
	callq	puts
	movl	$.Lstr.11, %edi
	callq	puts
	movl	$user_iter, %esi
	movq	%rbx, %rdi
	xorl	%edx, %edx
	callq	hashmap_scan
	movq	%rbx, %rdi
	callq	hashmap_free
	xorl	%eax, %eax
	addq	$128, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
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

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"%s age=%d\n"
	.size	.L.str.5, 11

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Tom"
	.size	.L.str.6, 4

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"exists"
	.size	.L.str.8, 7

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"not exists"
	.size	.L.str.9, 11

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"\n-- get some users --"
	.size	.Lstr, 22

	.type	.Lstr.11,@object                # @str.11
.Lstr.11:
	.asciz	"\n-- iterate over all users --"
	.size	.Lstr.11, 30

	.ident	"Ubuntu clang version 12.0.0-++20201026065856+bd07be4f3f7-1~exp1~20201026180537.203"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym user_compare
	.addrsig_sym user_iter
	.addrsig_sym user_hash
