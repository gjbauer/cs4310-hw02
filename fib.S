
	.global main
	.text

main:
	# z= x+y
	enter $0, $0 	# y= z
	mov %rdi, %r10    # argc
	mov %rsi, %r11    # argv
	#mov $1, %r12	# x= 1
	#mov $0, %r13	# y= 0
	#mov $0, %r14	# z= 0
	#mov $0, %r15	# i= 1
	
	mov 8(%r11), %rdi # argv[1]
	call atol
	mov %rax, %rbx	# argv[1]

	mov $num_nl, %rdi	#Debuggers...
	mov %rbx, %rsi
	call printf
	leave
	ret
fib:
	enter $0, $0
	leave
	pop %r15
	ret

	.data
fib_i:	.string	"fib(%ld) = "
num_nl:	.string	"%d\n"
