# Saksham Johari-----29/09/21
# E20CSE076
# Q1

.data
	num1: .asciiz "Enter the value of A: "
	num2: .asciiz "Enter the value of B: "
	res:  .asciiz "The multiples are: "
	space: .asciiz " "
.text
    	li $v0,  4            # Printing num1 prompt "Enter the value of A: "
    	la $a0, num1
    	syscall
    	
    	li $v0, 5             # Input integer A
    	syscall
    	
    	move $s0, $v0	      # Moving stored input integer A to $s0 register
    	li $v0,  4            # Printing num2 prompt "Enter the value of B: "
    	la $a0, num2
    	syscall
    	
    	li $v0, 5             # Input integer B
    	syscall
    	
    	move $s1, $v0	      # Moving stored input integer to $s1 register
    	li $v0, 4    	      # Print result string
    	la $a0, res           # loading address of Result string to be printed
    	syscall
    	
    	li $s2, 1     		# product = 1
	li $t0, 1      		# i = 1
loop:   bgt $t0, $s1, done   	# loop condition
	mul $s2, $s0, $t0   	# calculate A*i
	addi $t0, $t0, 1   	# ++i
	b  print

print:  li $v0,  1            # Printing multiple value $s2 register "
    	la $a0, ($s2)
    	syscall
    	
    	li $v0,  4            # Adding space
    	la $a0, space
    	syscall
    	
    	j loop		      # Jump back to loop 
    	syscall

done:    
    	li $v0, 10
    	syscall               # loading instruction to terminate execution
    	
