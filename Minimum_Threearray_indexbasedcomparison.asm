# Saksham Johari-----31/10/21
# E20CSE076
# Q2
.data 
	A: .space 40
	B: .space 40
	C: .space 40
	space: .asciiz " "
	inputA: .asciiz "Enter 10 numbers for A: \n"
	inputB: .asciiz "Enter 10 numbers for B: \n"

.text
	li $v0 4 		# syscall to print string input prompt for A
	la $a0 inputA
	syscall
	
	li $s5 0 		# count number of inputs taken for array A
	loop1: 			# loop to take inputs for array A
	li $v0 5 		# syscall to take integer input
	syscall
	
	la $s6 ($v0)
	sw $s6 A($s5) 		# store in A
	add $s5 $s5 4 		
	bne $s5 40 loop1 	
	li $v0 4 		# syscall to print string input prompt for B
	la $a0 inputB
	
	syscall
	li $s5 0 		# count number of inputs taken for array B
	loop2: 			# loop to take inputs for array B
	li $v0 5 		# syscall to take integer input
	syscall
	la $s6 ($v0)
	sw $s6 B($s5) 		# store in B
	add $s5 $s5 4 		# +4
	bne $s5 40 loop2 	# check if != 40

	jal printArr
	li $v0 10 	# syscall to terminate
syscall

printArr:
	la $s0 A 	# point to start of A
	la $s4 B 	# point to start of B
	li $s1 10 	# store array length
	li $s2 0 	# current array location (1st element currently)
loop: 		
	sll $t1 $s2 2 		# get address of each integer (4 bytes)
	add $t2 $t1 $s0 	
	add $t3 $t1 $s4 	
	lw $t0 0($t2) 		# get the array element of A
	lw $t4 0($t3) 		# for B
	bge $t4 $t0 print 	# compare
	lw $t0 0($t3) 		# set if above true
print:
	li $v0 1 		# print the numbers
	move $a0 $t0
	syscall
	
	li $v0 4
	la $a0 space
	syscall
	
	addi $s2 $s2 1 		
	bne $s2 $s1 loop 	# continue loop if i != 10
	jr $ra
