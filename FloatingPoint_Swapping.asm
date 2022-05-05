# Saksham Johari  13/11/2021
# E20CSE076
# Q3
.data
	ft : .float 3.14
	secd: .float 2.56 
	firsflo: .asciiz "\nBefore Swapping, 1st value:  "
	secflo: .asciiz "\nBefore Swapping, 2nd value:  "
	swfirsflo: .asciiz "\nAfter Swapping, 1st value: "
	swsecflo: .asciiz "\nAfter Swapping, 2nd value: "
.text 
	l.s $f0, ft
	l.s $f1, secd
	li $v0,4
	la $a0, firsflo
	syscall

	mov.s $f12, $f0
	li $v0,2
	syscall
	
	li $v0,4
	la $a0, secflo
	syscall
	
	mov.s $f12, $f1
	li $v0,2
	syscall
	
	mov.s $f2,$f0
	mov.s $f0,$f1
	mov.s $f1,$f2
	li $v0,4
	la $a0, swfirsflo
	syscall

	mov.s $f12, $f0
	li $v0,2
	syscall
	
	li $v0,4
	la $a0, secflo
	syscall
	
	mov.s $f12, $f1 
	li $v0,2
	syscall
	
	
exit: 
	li $v0,10
	syscall
