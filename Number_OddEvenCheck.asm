# Saksham Johari --- 16/09/21
# E20CSE076
# Q5 Odd Even check with number as input

.data
	prompt: .asciiz "Enter number: "
	emsg:   .asciiz "\nNumber is even"
	omsg:   .asciiz "\nNumber is odd"
	nu: .word 0
.text
	li $v0,4
	la $a0,prompt #display message asking user for number
	syscall

 	li $v0,5
 	syscall
 	sw $v0,nu
  
 	li $t0,2
 	div $v0,$t0
 	
 	mfhi $t1
 	beq $t1,$zero,yes
 
 	li $v0,4
 	la $a0,omsg
 	syscall   
 	
 	j endl #jump to endl after execution if "yes" not executed
 
 yes:	li $v0,4
 	la $a0,emsg
 	syscall   #syscall seperately used for segmented code execution to avoid off bottom condition
     
	
endl:	li $v0, 10  #loading instruction to terminate execution
	syscall
	
