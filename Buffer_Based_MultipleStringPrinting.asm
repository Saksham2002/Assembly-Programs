# Saksham Johari-----06/10/21
# E20CSE076
# Q2 Multiple Printing using buffer

.data
	inpname: .asciiz "Enter your name: "
	inpenrol: .asciiz "Enter your Enrollment ID: "
	name: .asciiz "Name is "
	enrol: .asciiz "Enrollment is "
	namestr: .space 100
	enrolstr: .space 100
	

.text
    	li $v0,  4            		# Printing input name (inpname) prompt
    	la $a0, inpname
    	syscall
    	
    	li $v0, 8             		# Storing input string in namestr buffer
    	la $a0, namestr
    	la $a1, 100
    	syscall
    	
        la $s0, namestr         	# copying address of namestr buffer to $s0 register for referencing.
        li $v0,  4                      # Printing input enrol (inpenrol) prompt
    	la $a0, inpenrol
    	syscall
    	
    	li $v0, 8             		# Storing input string in enrolstr buffer
    	la $a0, enrolstr
    	la $a1, 100
    	syscall
    	
    	la $s1, enrolstr         	# copying address of inpstr buffer to $s1 register for referencing.
    	li $v0,  4                      # Printing name prompt
    	la $a0, name
    	syscall
    	
    	li $v0,  4                      # Printing value in namestr
    	la $a0, ($s0)
    	syscall
    	
    	li $v0,  4                      # Printing enrol prompt
    	la $a0, enrol
    	syscall
    	
    	li $v0,  4                      # Printing value in enrolstr
    	la $a0, ($s1)
    	syscall
       
exit:       
    	li $v0, 10
    	syscall               		# loading instruction to terminate execution
    	
