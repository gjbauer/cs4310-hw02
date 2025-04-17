
	.global main
	.text

main:
	push	%rbx
	mov	%rsi, %rbx	// Check argc if we should print usage and exit
	cmp	$2, %rdi
	jne	usage
	
	mov	8(%rsi), %rdi	// Call atol on argv[1]
	call	atol
	cmp	$0, %rax
	jl	usage
	mov	%rax, %rsi	// Store result in second argument register
	jmp	start	// Run program

usage:		// Print usage statement and exit with error
	mov	%rbx, %rsi
	lea	.usage(%rip), %rdi
	mov	$0, %rax
	call	printf
	mov	$-1, %rax
	jmp	exit

start:	// Initialize variables
	mov	$0, %rax
	mov	$0, %rbx
	mov	$1, %rdx
loop:	// Count loop index in accumulator, perform fib calculation, return result when on the correct iterance
	cmp	%rax, %rsi
	je	result
	lea	(%rdx,%rbx), %rcx	// Sum rdx and rbx, store the result in rcx
	inc	%rax	// Increment accumulator
	mov	%rbx, %rdx	// Move values to down as a prerquisite for the next iteration
	mov	%rcx, %rbx
	jmp	loop
result:
	mov	%rbx, %rdx	// Move results of calculation in third argument register
	lea	.fib_i(%rip), %rdi	// Move string const into first argument register (result from atol still in second...)
	call	printf
	mov	%rbx, %rax	// Move results of calculation into accumulator/return register and exit
exit:
	pop	%rbx
	ret

	.data
.usage: .string	"Usage:\n  %s N, where N > 0\n"
.fib_i: .string	"fib(%ld) = %ld\n"
