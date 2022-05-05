# Saksham Johari-----31/10/21
# E20CSE076
# Q3
.data 
	A: .space 40
	space: .asciiz " "
	inputA: .asciiz "Enter 10 numbers for A: \n"
	.text
	li $v0 4 		# syscall to print string input prompt for A
	la $a0 inputA
	syscall
	li $s5 0 		# count number of inputs taken for array A
	boop: 			# loop to take inputs for array A
	li $v0 5 		# syscall to take integer input
	syscall
	la $s6 ($v0)
	sw $s6 A($s5) 		# store in A
	add $s5 $s5 4 		# +4
	bne $s5 40 boop 	# check if != 40
	jal bubble_sort
	jal printArr
	li $v0 10 		# syscall to terminate
syscall

bubble_sort:
	la $a0 A
	li $a1 10
	add $t0,$zero,$zero 	#counter1( i )=0
loop1:
	addi $t0,$t0,1 		#i++
	bgt $t0,$a1,endloop1 	#if t0 < a1 break;
	add $t1,$a1,$zero 	#counter2=size=6
loop2:
	bge $t0,$t1,loop1 	#j < = i
	addi $t1,$t1,-1 	#j--
	mul $t4,$t1,4 		#t4+a0=table[j]
	addi $t3,$t4,-4 	#t3+a0=table[j-1]
	add $t7,$t4,$a0 	#t7=table[j]
	add $t8,$t3,$a0 	#t8=table[j-1]
	lw $t5,0($t7)
	lw $t6,0($t8)
	bgt $t5,$t6,loop2
				#switch t5,t6
	sw $t5,0($t8)
	sw $t6,0($t7)
	j loop2
endloop1:
jr $ra

printArr:
	la $s0 A 		# point to start of A
	li $s1 10 		# store array length
	li $s2 0 		# current array location (1st element currently)
	loop:			# iterate over array
	sll $t1 $s2 2 		# get address of each integer (4 bytes)
	add $t2 $t1 $s0 	# start of address + i * 4
	lw $t0 0($t2) 		# get the array element of A
print:
	li $v0 1 		# print the numbers
	move $a0 $t0
	syscall
	li $v0 4
	la $a0 space
	syscall
	addi $s2 $s2 1 		# i++
	bne $s2 $s1 loop 	# continue loop if i != 10
	jr $ra
