	.text
	.file	"test.cpp"
	.globl	_Z8testfuncx                    # -- Begin function _Z8testfuncx
	.p2align	4, 0x90
	.type	_Z8testfuncx,@function
_Z8testfuncx:                           # @_Z8testfuncx
	.cfi_startproc
# %bb.0:
	movq	%rdi, %rax
	movl	$4, %ecx
	mulq	%rcx
	movq	$-1, %rdi
	cmovnoq	%rax, %rdi
	jmp	_Znam                           # TAILCALL
.Lfunc_end0:
	.size	_Z8testfuncx, .Lfunc_end0-_Z8testfuncx
	.cfi_endproc
                                        # -- End function
	.globl	_Z9testfunc2Pi                  # -- Begin function _Z9testfunc2Pi
	.p2align	4, 0x90
	.type	_Z9testfunc2Pi,@function
_Z9testfunc2Pi:                         # @_Z9testfunc2Pi
	.cfi_startproc
# %bb.0:
	testq	%rdi, %rdi
	je	.LBB1_1
# %bb.2:
	jmp	_ZdaPv                          # TAILCALL
.LBB1_1:
	retq
.Lfunc_end1:
	.size	_Z9testfunc2Pi, .Lfunc_end1-_Z9testfunc2Pi
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 12.0.0-++20201102052620+327bf5c2d91-1~exp1~20201102163303.210"
	.section	".note.GNU-stack","",@progbits
	.addrsig
