	.text
	.file	"test.c"
	.globl	testfunc                        # -- Begin function testfunc
	.p2align	4, 0x90
	.type	testfunc,@function
testfunc:                               # @testfunc
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	testq	%rdi, %rdi
	jle	.LBB0_3
# %bb.1:
	movq	%rdi, %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	print_int_dec_s
	addq	$1, %rbx
	cmpq	%rbx, %r14
	jne	.LBB0_2
.LBB0_3:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	testfunc, .Lfunc_end0-testfunc
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 12.0.0-++20201107052612+c511963d5ad-1~exp1~20201107163252.216"
	.section	".note.GNU-stack","",@progbits
	.addrsig
