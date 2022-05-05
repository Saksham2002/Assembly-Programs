# Saksham Johari-----13/10/21
# E20CSE076
# Q3

.data
	inp: .asciiz "Enter number to compute factorial: " 
	res: .asciiz "\nFactorial is: "
	init: .word 1
.text
	
main:
	lw $s0,init
	li $v0,4
	la $a0,inp
	syscall
	
	li $v0,5
	syscall
	
	move $a0,$v0
	jal fact
	move $t0,$v0
	li  $v0, 4
    	la  $a0, res
    	syscall
    	
    	li  $v0, 1         		# printing the result returned
    	move $a0, $t0
    	syscall 
    	
    	j exit
	
fact:
    	addi    $sp, $sp, -8		# base case -- still in parent's stack segment  		
    	sw      $s0, 4($sp)		# adjust stack pointer to store return address and argument
    	sw      $ra, 0($sp)		# save $s0 and $ra
    	bne     $a0, 0, el
    	addi    $v0, $zero, 1    	# return 1
    	j fact_ret

el:

    	move    $s0, $a0
    	addi    $a0, $a0, -1 		# x -= 1
    	jal     fact
    	multu   $s0, $v0 		# return x*Fact(x-1)
    	mflo    $v0

fact_ret:

    	lw      $s0, 4($sp)
    	lw      $ra, 0($sp)
    	addi    $sp, $sp, 8
    	jr      $ra
    
exit:
	li $v0, 10			# Program termination block
    	syscall 
