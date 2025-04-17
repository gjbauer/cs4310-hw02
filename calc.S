
	.global main
	.text
mul:
	#mov $mul_str, %rdi
	call printf
	ret
div:
	ret
add:
	lea	.hello(%rip), %rdi
	call	printf
	jmp exit
sub:
	ret

main:
	push	%rbx
	mov	%rdi, %r10
	mov	%rsi, %r11
	cmp	$4, %rdi
	jl	usage
	
	// Store our first and third variables for use later..
	mov	8(%r11), %rdi
	call	atol
	mov	%rax, %r12
	
	mov	24(%r11), %rdi
	call	atol
	mov	%rax, %r13
	
	mov	16(%r11), %rdi
	lea	.plus(%rip), %rsi
	call	strcmp
	push	%r12
	push	%r13
	je	add
	
	lea	.minus(%rip), %rsi
	call	strcmp
	push	%r12
	push	%r13
	je	sub
	
	lea	.slash(%rip), %rsi
	call	strcmp
	push	%r12
	push	%r13
	je	div
	
	lea	.star(%rip), %rsi
	call	strcmp
	push	%r12
	push	%r13
	je	mul

usage:		// Print usage statement and exit with error
	lea	.usage(%rip), %rdi
	call	printf
	mov	$-1, %rax
	jmp	exit

exit:
	pop	%rbx
	pop	%r12
	pop	%r13
	ret

	.data
mul_str:	.string	"%ld * "
div_str:	.string "%ld / "
add_str:	.string "%ld + "
sub_str:	.string "%ld - "
mid_str:	.string "%ld = "
end_str:	.string "%ld"

.output: .string "%d %s %d = %d\n"
.usage: .string	"Usage:\n  N [OP] H, where N & H > 0 and OP is an operation\n"
.hello: .string	"hello\n"
.fib_i: .string	"fib(%ld) = %ld\n"
.plus: .string	"+"
.minus: .string	"-"
.slash: .string	"/"
.star: .string	"*"
