# Saksham Johari-----22/09/21
# E20CSE076
# Q5

.data
	inp: .asciiz "Enter the number: "
	res: .asciiz "Sum of series: "
	num: .word 0

.text
	li $v0,4 	# Printing inp prompt
	la $a0, inp
	syscall

	li $v0,5	# Input
	la $t0,($v0)
	syscall

	move $t0, $v0
	lw $t1,num	

	loop:
	addi $t1,$t1,1
	add $t2,$t2,$t1
	beq $t0,$t1,end_loop	#condition
	j loop

	end_loop:
	li $v0, 4		
	la $a0, res
	syscall

	li $v0, 1		# Output
	move $a0, $t2
	syscall
	
	li $v0, 10		# syscall used for segmented code execution to avoid fall bottom condition
    	syscall                 # loading instruction to terminate execution
	
