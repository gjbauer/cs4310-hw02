
	.global main
	.text
mul:
	mov	%r13, %rax
	mul	%r14
	lea	.output(%rip), %rdi
	mov	%r13, %rsi
	lea	.star(%rip), %rdx
	mov	%r14, %rcx
	mov	%rax, %r8
	call	printf
	jmp exit
div:
	add	%r13, %rax
	div	%r14, %rax
	lea	.output(%rip), %rdi
	mov	%r13, %rsi
	lea	.slash(%rip), %rdx
	mov	%r14, %rcx
	mov	%rax, %r8
	call	printf
	jmp exit
add:
	add	%r13, %rax
	add	%r14, %rax
	lea	.output(%rip), %rdi
	mov	%r13, %rsi
	lea	.plus(%rip), %rdx
	mov	%r14, %rcx
	mov	%rax, %r8
	call	printf
	jmp exit
sub:
	add	%r13, %rax
	sub	%r14, %rax
	lea	.output(%rip), %rdi
	mov	%r13, %rsi
	lea	.minus(%rip), %rdx
	mov	%r14, %rcx
	mov	%rax, %r8
	call	printf
	jmp exit

main:
	push	%r12
	mov	%rsi, %r12
	push	%rbp
	mov	%rdi, %rbp
	push	%rbx
	mov	$0, %rbx
	
	push	%r13
	push	%r14
	
	cmp	$4, %rbp
	jl	usage
	
	// Store our first and third variables for use later..
	mov	$1, %rbx	// argv[1]
	
	mov	(%r12,%rbx,8), %rdi
	call	atol
	mov	%rax, %r13
	
	mov	$3, %rbx	// argv[3]
	
	mov	(%r12,%rbx,8), %rdi
	call	atol
	mov	%rax, %r14
	
	mov	$2, %rbx	// argv[2]
	
	mov	(%r12,%rbx,8), %rdi
	lea	.plus(%rip), %rsi
	call	strcmp
	je	add
	
	lea	.minus(%rip), %rsi
	call	strcmp
	je	sub
	
	lea	.slash(%rip), %rsi
	call	strcmp
	je	div
	
	lea	.star(%rip), %rsi
	call	strcmp
	je	mul

usage:		// Print usage statement and exit with error
	lea	.usage(%rip), %rdi
	call	printf
	mov	$-1, %rax
	jmp	exit

exit:
	pop	%r14
	pop	%r13
	pop	%r12
	pop	%rbp
	pop	%rbx
	ret

	.data

.output: .string "%ld %s %ld = %ld\n"
.usage: .string	"Usage:\n  N [OP] H, where N & H > 0 and OP is an operation\n"
.plus: .string	"+"
.minus: .string	"-"
.slash: .string	"/"
.star: .string	"*"
