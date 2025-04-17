	.file	"args.c"
	.text
	.global	main
	.type	main, @function
main:
	push	%r12
	mov	%rsi, %r12
	push	%rbp
	mov	%rdi, %rbp
	push	%rbx
	mov	$0, %rbx
loop:
	cmp	%rbx, %rbp
	jle	done
	
	mov	(%r12,%rbx,8), %rdi
	inc	%rbx
	
	call	puts
	jmp	loop
done:
	pop	%rbx
	mov	$0, %eax
	pop	%rbp
	pop	%r12
	ret

