# Saksham Johari-----13/10/21
# E20CSE076
# Q4

.data
	inp: .asciiz "Enter number : " 
	pow: .asciiz "Enter power  : "
	res: .asciiz "X^Y : "
	init: .word 1
.text
.globl main	
main:
	lw $s0,init
	li $v0,4
	la $a0,inp
	syscall
	
	li $v0,5
	syscall
	
	move $t0,$v0
	li $v0,4
	la $a0,pow
	syscall
	
	li $v0,5
	syscall
	
	move $a0,$t0
	move $a1,$v0 
	jal powcalc
	move $t0,$v0
	li  $v0, 4
    	la  $a0, res
    	syscall
    	
    	li  $v0, 1         		# printing the result returned
    	move $a0, $t0
    	syscall 
    	
    	j exit

powcalc:
    	subi    $sp, $sp, 12		# base case -- still in parent's stack segment  		
    	sw      $s0, 4($sp)		# adjust stack pointer to store return address and argument
    	sw      $s1, 8($sp)
    	sw      $ra, ($sp)		# save $s0 and $ra
    	
    	beq     $a1, 1, powdone
    	
    	move $s0, $a0
    	move $s1, $a1
    	sub  $a1,$a1,1
    	jal powcalc
    	
    	mul $v0,$s0,$v0
    	
powdone:
    	lw $s0, 4($sp)
    	lw $s1, 8($sp)
    	lw $ra, ($sp)
    	addi $sp, $sp, 12
    	jr $ra
    
exit:
	li $v0, 10			# Program termination block
    	syscall