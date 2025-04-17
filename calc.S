
	.global main
	.text
mul:
	mov $mul_str, %rdi
	call printf
	ret
div:
	ret
add:
	ret
sub:
	ret
main:
	push %r12
	push %r13
	enter $8, $0

	mov $"*",%rdi
	call strcmp
	je mul
	cmp $'/', %rsi
	cmp $'+', %rsi
	cmp $'-', %rsi
	leave
	pop %r13
	pop %r12
	ret
	.data
mul_str:	.string	"%ld * "
div_str:	.string "%ld / "
add_str:	.string "%ld + "
sub_str:	.string "%ld - "
mid_str:	.string "%ld = "
end_str:	.string "%ld"
