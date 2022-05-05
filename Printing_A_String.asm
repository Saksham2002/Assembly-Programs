# Saksham Johari --- 16/09/21
# E20CSE076
# Q2 to print a character along with string

.data
	msg: .byte 'K'
	st1: .asciiz "\nHello MIPS World, I am Saksham"
	
.text
	li $v0, 4   #loading instruction to print string 
	la $a0, msg #loading address of string to be printed	
	la $a1, st1 #loading address of string to be printed
	syscall     #syscall used 3 times for segmented code execution to avoid fall bottom condition
	
	li $v0, 10  #loading instruction to terminate execution
	syscall
