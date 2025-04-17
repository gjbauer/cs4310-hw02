	.file	"calc.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage:\n  %s N [OP] H, where N & H > 0 & OP is an operation.\n"
.LC1:
	.string	"*"
.LC2:
	.string	"/"
.LC3:
	.string	"+"
.LC4:
	.string	"-"
.LC5:
	.string	"%"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	pushq	%rcx
	.cfi_def_cfa_offset 64
	cmpl	$4, %edi
	je	.L2
.L9:
	movq	(%rbx), %rsi
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	orl	$-1, %eax
	jmp	.L1
.L2:
	movq	8(%rsi), %rdi
	call	atol@PLT
	movq	24(%rbx), %rdi
	movq	%rax, %r14
	movl	%eax, %ebp
	call	atol@PLT
	movq	16(%rbx), %r15
	leaq	.LC1(%rip), %rsi
	movq	%rax, %r13
	movq	%r15, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movl	%r13d, %r8d
	movl	%r13d, %ecx
	movl	$42, %edx
	imull	%r14d, %r8d
.L15:
	movq	calc_str(%rip), %rdi
	movl	%ebp, %esi
.L14:
	call	printf@PLT
.L6:
	xorl	%eax, %eax
	jmp	.L1
.L4:
	leaq	.LC2(%rip), %rsi
	movq	%r15, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L5
	movl	%r14d, %eax
	movq	calc_str(%rip), %rdi
	movl	%r13d, %ecx
	movl	%r14d, %esi
	cltd
	idivl	%r13d
	movl	$47, %edx
	movl	%eax, %r8d
	xorl	%eax, %eax
	jmp	.L14
.L5:
	leaq	.LC3(%rip), %rsi
	movq	%r15, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	leal	0(%r13,%r14), %r8d
	movl	%r13d, %ecx
	movl	$43, %edx
	jmp	.L15
.L7:
	leaq	.LC4(%rip), %rsi
	movq	%r15, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L8
	movl	%r14d, %r8d
	movl	%r13d, %ecx
	movl	$45, %edx
	subl	%r13d, %r8d
	jmp	.L15
.L8:
	leaq	.LC5(%rip), %rsi
	movq	%r15, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L6
	jmp	.L9
.L1:
	popq	%rdx
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	calc_str
	.section	.rodata.str1.1
.LC6:
	.string	"%ld %c %ld = %ld\n"
	.section	.data.rel.local,"aw"
	.align 8
	.type	calc_str, @object
	.size	calc_str, 8
calc_str:
	.quad	.LC6
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
