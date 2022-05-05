# Saksham Johari --- 16/09/21
# E20CSE076
# Q4 Aritmetic operations using assembly instructions with input

.data
	msg1: .asciiz "Enter b: "
	msg2: .asciiz "\nEnter c: "
	msg3: .asciiz "\nEnter d: "
	msg4: .asciiz "\na = b + c - d = "
	msg5: .asciiz "\na = a + 5 = "
	msg6: .asciiz "\ne = a * 3 = "
	
.text
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	la $t0, ($v0)

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 5
	syscall
	la $t1, ($v0)

	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 5
	syscall
	
	la $t2, ($v0)
	add $t3,$t0,$t1
	sub $t4,$t3,$t2 #performing first arithmetic operation a=b+c-d
	li  $v0, 4
	la  $a0, msg4
	syscall
	
	li  $v0, 1
	la  $a0, ($t4)
	syscall
	
	add $t4,$t4,5
	li  $v0, 4
	la  $a0, msg5 #printing msg1
	syscall
	
	li  $v0, 1
	la  $a0, ($t4) #printing a = a+5 operation output
	syscall
	
	mul $t5,$t4,3
	li  $v0, 4
	la  $a0, msg6
	syscall
	
	li  $v0, 1
	la  $a0, ($t5)
	syscall    #syscall seperately used for segmented code execution to avoid off bottom condition
	
	li $v0, 10  #loading instruction to terminate execution
	syscall
	
