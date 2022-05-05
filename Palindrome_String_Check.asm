# Saksham Johari-----06/10/21
# E20CSE076
# Q3 Palindrome Checker

.data
	inp: .asciiz "Enter the string: "
	isnpal: .asciiz "The given string is not palindrome. "
	ispal:  .asciiz "The given string is palindrome. "
	inpstr: .space 100

.text
    	li $v0,  4            # Printing num1 prompt "Enter the value of A: "
    	la $a0, inp
    	syscall
    	
    	li $v0, 8             		# Input integer A
    	la $a0, inpstr
    	la $a1, 100
    	syscall
    	
        la         $t1, inpstr         	# copying address of inpstr buffer to $t1 register for referencing.

        la         $t2, inpstr         	# Again copying address of inpstr buffer to $t2 register for referencing.
        
len_loop:                                 #  loop for traversing through length of string.
        lb         $t3, ($t2)                #  load the byte at $t2  into $t3.
        beqz       $t3,  elen_loop     #  if $t3== 0, jump out of  loop.
        addu       $t2, $t2, 1               #  otherwise,  increment B,
        b          len_loop               #  Repeat the loop.
        
elen_loop:
        subu       $t2, $t2, 2               #  subtract 2 to move B  back  past from new line.
                                             
check_loop:
        bge        $t1, $t2, is_palin        #  if A  >= B,  it’s a  palindrome.

        lb         $t3, ($t1)                     #  load the byte at  $t1  into $t3,
        lb         $t4, ($t2)                     #  load the byte at  $t2  into $t4.
        bne        $t3, $t4, not_palin      #  if $t3 is not equal to $t4, jump to not_palin .
               
        addu       $t1, $t1, 1              # increment  $t1 by 1 for next char,
        subu       $t2, $t2, 1              # decrement $t2 by 1 for next char in reverse order,  
        b          check_loop                # Repeat the loop.

is_palin:                               #  printing ispal (is palindrome) message.
        la         $a0, ispal
        li         $v0,  4
        syscall
        b          exit

not_palin:
        la         $a0, isnpal       	#  printing isnpal (is not palindrome) message.
        li         $v0,  4
        syscall
        b          exit
       
exit:       
    	li $v0, 10
    	syscall               		# loading instruction to terminate execution
    	
