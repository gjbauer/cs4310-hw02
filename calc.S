
	.global main
	.text
mul:
	#mov $mul_str, %rdi
	call printf
	ret
div:
	ret
add:
	ret
sub:
	ret

main:
	push	%rbx
	mov	%rsi, %rbx	// Check argc if we should print usage and exit
	cmp	$2, %rdi
	jne	usage

usage:		// Print usage statement and exit with error
	mov	%rbx, %rsi
	lea	.usage(%rip), %rdi
	mov	$0, %rax
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

.usage: .string	"Usage:\n  %s N, where N > 0\n"
.fib_i: .string	"fib(%ld) = %ld\n"
