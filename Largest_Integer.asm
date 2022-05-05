# Saksham Johari-----22/09/21
# E20CSE076
# Q2

.data 
	m1: .asciiz "\n\nEnter the first integer number: "
	m2: .asciiz "Enter the second integer number: "
	m3: .asciiz "The larger integer number is: "



.text
	li $v0, 4            #Printing m1
	la $a0, m1
	syscall

	li $v0, 5             # Input 1
	syscall
	
	move $t0, $v0
	li $v0, 4             #Printing m2
	la $a0, m2
	syscall

	li $v0, 5               #Input 2
	syscall
	
	move $t1, $v0
	slt $s0, $t0, $t1
	bne $s0, $zero, print_num #jumps to print_num if $t0 is larger
	move $t1, $t0          #else: $t1 is larger

	print_num:
	li $v0, 4      	       # Printing m3
	la $a0, m3
	syscall

	li $v0, 1             #Printing the larger int number
	move $a0, $t1
	syscall
	
	li $v0, 10	      # syscall used for segmented code execution to avoid fall bottom condition
    	syscall               # loading instruction to terminate execution
