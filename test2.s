	.text
	.file	"test2.c"
	.globl	test_cmp                        # -- Begin function test_cmp
	.p2align	4, 0x90
	.type	test_cmp,@function
test_cmp:                               # @test_cmp
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	addq	$8, %rsi
	movq	(%rdi), %rdx
	addq	$8, %rdi
	callq	bcmp
	testl	%eax, %eax
	setne	%al
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	test_cmp, .Lfunc_end0-test_cmp
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 12.0.0-++20201026065856+bd07be4f3f7-1~exp1~20201026180537.203"
	.section	".note.GNU-stack","",@progbits
	.addrsig
