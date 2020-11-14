	.text
	.file	"test.c"
	.globl	file_size                       # -- Begin function file_size
	.p2align	4, 0x90
	.type	file_size,@function
file_size:                              # @file_size
	.cfi_startproc
# %bb.0:
	subq	$152, %rsp
	.cfi_def_cfa_offset 160
	leaq	8(%rsp), %rsi
	callq	stat
	movq	56(%rsp), %rax
	addq	$152, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	file_size, .Lfunc_end0-file_size
	.cfi_endproc
                                        # -- End function
	.globl	testfunc                        # -- Begin function testfunc
	.p2align	4, 0x90
	.type	testfunc,@function
testfunc:                               # @testfunc
	.cfi_startproc
# %bb.0:
	movl	$144, %eax
	retq
.Lfunc_end1:
	.size	testfunc, .Lfunc_end1-testfunc
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 12.0.0-++20201102052620+327bf5c2d91-1~exp1~20201102163303.210"
	.section	".note.GNU-stack","",@progbits
	.addrsig
