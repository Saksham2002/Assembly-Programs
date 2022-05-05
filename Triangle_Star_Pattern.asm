# Saksham Johari-----06/10/21
# E20CSE076
# Q4 Pattern Printing

.data
	inprow: .asciiz "Enter the number of rows: " 
	space: .asciiz "  "
	newline: .asciiz "\n"
	star: .asciiz " *"
	var1: .word 0
	var2: .word 2
	

.text
    	li $v0,  4            				# Printing input name (inpname) prompt
    	la $a0, inprow
    	syscall
    	
    	li $v0, 5
    	syscall
    	
    	move $t0,$v0
	lw $t1,var1					# loading 0 to $t1 register
	li $v0,4					# directing cursor to newline
	la $a0,newline
	syscall
	
loop1:							# main control loop for execution
	lw $t3,var2	        			# loading 2 to $t3 register for mult later on
	beq $t0,$t1,exit	
	addi $t1,$t1,1	       
	lw $t4,var1
	sub $t2,$t0,$t1
	mul $t3,$t1,$t3					# 2*n-1 condition to print the stars in a row
	subi $t3,$t3,1
	
loop3:							# loop for spacing
	beq $t2,$zero,loop2				# condition for this loop.
	subi $t2,$t2,1					
	li $v0,4					# printing  space.
	la $a0,space
	syscall
	j loop3						# jump to loop3 for printing spaces
loop2:							# loop for stars
	beq $t4,$t3,exit1				# condition for this loop.
	addi $t4,$t4,1					# incrementing for iteration for this loop.
	li $v0,4
	la $a0,star
	syscall
	j loop2						# jump back to loop2 until condition is true

exit1:							# exit loop
	li $v0,4					# for next line.
	la $a0,newline
	syscall
	j loop1
	
exit:							# Termination segment      
    	li $v0, 10
    	syscall             				# loading instruction to terminate execution
    	
