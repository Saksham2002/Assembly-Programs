# Saksham Johari  13/11/2021
# E20CSE076
# Q3
.data
	pi : .float 3.14
	valpi: .asciiz "The value of pi is : "
	valinp: .asciiz "\nEnter any floating-point number: "
	valout: .asciiz "\nThe user-entered floating-point number is: "
	addout: .asciiz "\nThe Addition result is "
.text 

	li $v0,4
	la $a0, valpi
	syscall

	l.s $f12, pi
	li $v0,2
	syscall
	
	li $v0,4
	la $a0, valinp
	syscall
	
	li $v0,6
	syscall
	
	li $v0,4
	la $a0, valout
	syscall
	
	mov.s $f12 ,$f0
	li $v0, 2
	syscall
	
	li $v0,4
	la $a0, addout
	syscall
	
	l.s $f3, pi
	add.s $f12, $f12, $f3
	li $v0, 2
	syscall
exit: 
	li $v0,10
	syscall
