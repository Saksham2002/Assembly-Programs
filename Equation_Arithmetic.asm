# Saksham Johari-----22/09/21
# E20CSE076
# Q1

.data
	prompt: .asciiz "Enter a value for x: "
	result: .asciiz "5x^2 + 2x + 3 = "
.text
    	li $v0,  4            # Printing prompt
    	la $a0, prompt
    	syscall
    	
    	li $v0, 5             # Input
    	syscall
    	
    	move $s0, $v0 
    	mul $t0, $s0, $s0
    	mul $t0, $t0, 5
    	mul $t1, $s0, 2
    	add $t0, $t0, $t1
    	addi $s1, $t0, 3      # Calculating the result of 5*x*x + 2* x + 3 and storing it in $s1.
    
    	li $v0,  4    # Print result string
    	la $a0, result        # loading address of string to be printed
    	syscall
    	
    	li $v0, 1    # Print result
    	move $a0, $s1
    	syscall               # syscall used for segmented code execution to avoid fall bottom condition
    
    	li $v0, 10
    	syscall               # loading instruction to terminate execution
    	