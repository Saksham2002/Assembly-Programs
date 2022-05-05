# Saksham Johari-----13/10/21
# E20CSE076
# Q1---> If else block

.data
	pro1: .asciiz "\nJ==> " 
	pro2: .asciiz " I===> "
	vari: .word 1
	varj: .word 0
	cond: .word 10
.text
	lw $s0,vari
	lw $s1,varj
	lw $s2,cond

if:				# If block equivalent for mips
	bge $s0,$s2,el
	add $s1,$s0,$s2
	j print

el:				# else block equivalent functionality
	bge $s0,15,exit
	add $s1,$s0,$s0
	j print

update:
	add $s0,$s0,1  		# Updating value of i after printing initially 
	j if			# jump to if block after updation
	
print:
	li $v0, 4
	la $a0, pro1   		# printing pro1 prompt "J==>"
	syscall
	li $v0, 1
	la $a0, ($s1)
	syscall
	li $v0, 4
	la $a0, pro2  		# printing pro2 prompt "I==>"
	syscall
	li $v0, 1
	la $a0, ($s0)
	syscall
	j update     		# Jump after printing to update block for updation of i

exit:
	li $v0, 10		# Program termination block
    	syscall 
