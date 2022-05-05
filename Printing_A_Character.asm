# Saksham Johari --- 16/09/21
# Q1 to print a character

.data
	msg: .byte 'K'
	
.text
	li $v0, 4 #loading instruction to print string 
	la $a0, msg #loading address of string to be printed
	syscall     #syscall used 2 times for segmented code execution to avoid fall bottom condition
	
	li $v0, 10 #loading instruction to terminate execution
	syscall