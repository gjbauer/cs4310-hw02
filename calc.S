
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
	//mov	%rsi, %rbx	// Check argc if we should print usage and exit
	cmp	$4, %rdi
	jl	usage
	
	#lea	.str(%rip), %rdi
	#mov	16(%r11), %rsi
	#call	printf
	#jmp	exit
	
	mov	16(%r11), %rdi
	lea	.plus(%rip), %rsi
	call	strcmp
	je	add
	//cmp	$'+', 16(%r11)
	//je	add

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
