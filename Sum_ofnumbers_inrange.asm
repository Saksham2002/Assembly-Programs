# Saksham Johari-----03/11/21
# E20CSE076
# Q1

.data
	arr:    .space 40 		# declare array
	start:    .asciiz "Enter the first number: "
	end: .asciiz "Enter the second numer: "
	sum: .asciiz "Sum is : "
	
.text
	li $v0, 4 		# to print string start
	la $s0, arr
	la $a0 start
	syscall
	
	li $v0, 5		# Get start range
	syscall
	
	sw $v0, ($s0)
	li $v0, 4 		
	la $a0 end		# to print string end
	syscall
	
	li $v0, 5		# Get end range
	syscall
	
	sw $v0, 4($s0)
	lw $s1, 0($s0)
	lw $s2, 4($s0)
	li $s3, 0
	j loop

loop:	 			
	bgt $s1, $s2, print
	add $s3, $s3, $s1  	# adding in series
	add $s1, $s1, 1
	j loop
print:
	sw $s3, 8($s0)
	li $v0, 4 		
	la $a0 sum
	syscall
	
	li $v0, 1
	la $a0, ($s3)
	syscall
	
	li $v0 10 		# syscall to terminate
	syscall
