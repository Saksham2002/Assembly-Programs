.data

#SAKSHAM JOHARI
#E20CSE076
 prompt1: .asciiz "Enter the marks: "
 num: .word 0
 letterA: .asciiz "Grade is A"
 letterB: .asciiz "Grade is B"
 letterC: .asciiz "Grade is C"
 letterD: .asciiz "Grade is D"
 letterF: .asciiz "Grade is F"

.text

li $v0,4
la $a0,prompt1
syscall

li $v0,5
syscall
sw $v0,num

bgeu $v0,90,xA
bgeu $v0,80,xB
bgeu $v0,70,xC
bgeu $v0,60,xD

li $v0,4
la $a0,letterF
syscall
j         endx

xD:
li $v0,4
la $a0,letterD
syscall

xC:
li $v0,4
la $a0,letterC
syscall
j endx

xB:
li $v0,4
la $a0,letterB
syscall

xA:
li $v0,4
la $a0,letterA
syscall
endx:
