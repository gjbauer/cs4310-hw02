
	.global _start
	.text
mul:
	#mov $mul_str, %rdi
	call printf
	ret
div:
	ret
add:
	add	%r12, %rax
	add	%r13, %rax
	lea	.output(%rip), %rdi
	mov	%r12, %rsi
	lea	.plus(%rip), %rdx
	mov	%r13, %rcx
	mov	%rax, %r8
	call	printf
	jmp exit
sub:
	ret

_start:
	cmp	$4, %rdi
	jl	usage
	
	// Store our first and third variables for use later..
	lea	.str(%rip), %rdi
	mov	16(%rsp), %rdi
	call	atol
	mov	%rax, %r12
	
	mov	32(%rsp), %rdi
	call	atol
	mov	%rax, %r13
	
	mov	24(%rsp), %rdi
	lea	.plus(%rip), %rsi
	call	strcmp
	push	%r12
	push	%r13
	je	add
	#pop	%r13
	#pop	%r12
	
	/*lea	.minus(%rip), %rsi
	call	strcmp
	je	sub
	
	lea	.slash(%rip), %rsi
	call	strcmp
	je	div
	
	lea	.star(%rip), %rsi
	call	strcmp
	je	mul*/

usage:		// Print usage statement and exit with error
	lea	.usage(%rip), %rdi
	call	printf
	mov	$-1, %rax
	jmp	exit

exit:
	pop	%r13
	pop	%r12
	ret

	.data
mul_str:	.string	"%ld * "
div_str:	.string "%ld / "
add_str:	.string "%ld + "
sub_str:	.string "%ld - "
mid_str:	.string "%ld = "
end_str:	.string "%ld"

.str: .string "%s\n"
.output: .string "%ld %s %ld = %ld\n"
.usage: .string	"Usage:\n  N [OP] H, where N & H > 0 and OP is an operation\n"
.hello: .string	"hello\n"
.fib_i: .string	"fib(%ld) = %ld\n"
.plus: .string	"+"
.minus: .string	"-"
.slash: .string	"/"
.star: .string	"*"
