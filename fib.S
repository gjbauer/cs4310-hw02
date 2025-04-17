
	.global main
	.text

main:
	push %r15	# z= x+y
	enter $8, $0 	# y= z
	mov $1, %rbx	# x= 1
	mov $1, %r12	# y= 1
	mov $0, %r13	# z= 0
	mov $0, %r14

	#mov $r14, %rdi	#Debuggers...
	#mov %r14, %rsi
	#call printf
	#mov $r13, %rdi
	#mov %r13, %rsi
	#call printf
fib:
	enter $0, $0
	leave
	pop %r15
	ret

	.data
fib_i:	.string	"fib(%ld) = "
num_nl:	.string	"%ld\n"
r14:	.string "r14 = %ld\n"
r13:	.string "r13 = %ld\n"
r10:	.string	"r10 = %ld\n"
