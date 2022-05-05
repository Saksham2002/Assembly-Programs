# Saksham Johari-----31/10/21
# E20CSE076
# Q1

.data
	arr:    .space 40 		# declare array
	inp:    .asciiz "Enter 10 numbers: \n"
	maxout: .asciiz "Index of maximum number is: "
.text
	li $v0 4 		# to print string inp
	la $a0 inp
	syscall
	
	li $s5 0 		# count number of inputs taken for array
loop1:	 			# loop to take inputs for array
	li $v0 5 		# syscall to take integer input
	syscall
	
	la $s6 ($v0)
	sw $s6 arr($s5) 	# store in arr
	add $s5 $s5 4 		
	bne $s5 40 loop1 	# checking boundary condition
	la $s0 arr 		# address start of array
	li $s1 10 		# array length
	li $s2 0 		
	li $s3 0 		# Max variable initialization
	li $s4 -1		# store max index
loop:	 			
	sll $t1 $s2 2 		
	add $t1 $t1 $s0 	
	lw $t0 0($t1) 		# get the array element
	slt $t2 $t0 $s3 	# check if greater than max or not
	bne $t2 $zero iterate 	
	ori $s3 $t0 0 		 
	ori $s4 $s2 0 		# max_index = $s2
iterate:
	addi $s2 $s2 1 		
	bne $s2 $s1 loop 	
	li $v0 4 		# Printing string maxout prompt
	la $a0 maxout
	syscall
	
	li $v0 1 		# syscall to print max index (integer)
	move $a0 $s4
	syscall
	
	li $v0 10 		# syscall to terminate
	syscall
