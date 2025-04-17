	.file	"fib.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage:\n  %s N, where N > 0\n"
.LC1:
	.string	"fib(%ld) = %ld\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rsi, %rbx
	cmpl	$2, %edi
	jne	.L2
	movq	8(%rsi), %rdi
	call	atol@PLT
	movq	%rax, %rsi
	testq	%rax, %rax
	jns	.L6
.L2:
	movq	(%rbx), %rsi
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	orl	$-1, %eax
	jmp	.L1
.L6:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	movl	$1, %edx
.L3:
	cmpq	%rax, %rsi
	je	.L9
	leaq	(%rdx,%rbx), %rcx
	incq	%rax
	movq	%rbx, %rdx
	movq	%rcx, %rbx
	jmp	.L3
.L9:
	movq	%rbx, %rdx
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	%ebx, %eax
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
