# Saksham Johari --- 16/09/21
# E20CSE076
# Q3 Aritmetic operations using assembly instructions

.data
	msg: .asciiz "a = b + c - d = "
	msg1: .asciiz "\na = a + 5 = "
	msg2: .asciiz "\ne = a * 3 = "
	
.text
	li $t0, 4   #loading value of b 
	li $t1, 5   #loading value of c
	li $t2, 6   #loading value of d
	add $t3,$t0,$t1
	sub $t4,$t3,$t2 #performing first arithmetic operation a=b+c-d
	li  $v0, 4
	la  $a0, msg
	syscall
	
	li  $v0, 1
	la  $a0, ($t4)
	syscall
	
	add $t4,$t4,5
	li  $v0, 4
	la  $a0, msg1 #printing msg1
	syscall
	
	li  $v0, 1
	la  $a0, ($t4) #printing a = a+5 operation output
	syscall
	
	mul $t5,$t4,3
	li  $v0, 4
	la  $a0, msg2
	syscall
	
	li  $v0, 1
	la  $a0, ($t5)
	syscall    #syscall seperately used for segmented code execution to avoid off bottom condition
	
	li $v0, 10  #loading instruction to terminate execution
	syscall
