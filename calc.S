
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
	
	mov	16(%r11), %rdi
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
	mov	%rbx, %rsi
	lea	.usage(%rip), %rdi
	call	printf
	mov	$-1, %rax
	jmp	exit

exit:
	pop	%rbx
	ret

	.data
mul_str:	.string	"%ld * "
div_str:	.string "%ld / "
add_str:	.string "%ld + "
sub_str:	.string "%ld - "
mid_str:	.string "%ld = "
end_str:	.string "%ld"

.usage: .string	"Usage:\n  N [OP] H, where N & H > 0 and OP is an operation\n"
.hello: .string	"hello\n"
.str: .string	"%d\n"
.fib_i: .string	"fib(%ld) = %ld\n"
.plus: .string	"+"
.minus: .string	"-"
.slash: .string	"/"
.star: .string	"*"
