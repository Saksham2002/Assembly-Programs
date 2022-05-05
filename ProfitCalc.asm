# SAKSHAM JOHARI
# E20CSE76
.data
tea: .asciiz "Enter cost of tea: "
tsales: .asciiz "Enter no. of teas sold: "
burger: .asciiz "Enter cost of burger: "
bsales: .asciiz "Enter no. of burgers sold: "
panipuri: .asciiz "Enter cost of panipuri: "
psales: .asciiz "Enter no. of panipuris sold: "
profit: .asciiz "Net profit is: " #Messages

pt: .float 0.2
pb: .float 0.5 #Profits
pp: .float 0.6

.text
li $v0, 4
la $a0, tea
syscall
li $v0, 6
syscall
mov.s $f2, $f0 #storing cost of tea

li $v0, 4
la $a0, tsales
syscall
li $v0, 6
syscall
mov.s $f3, $f0 #Storing no. of teas sold

l.s $f4, pt #Profit of tea

li $v0, 4
la $a0, burger
syscall
li $v0, 6
syscall
mov.s $f5, $f0 #storing cost of burger

li $v0, 4
la $a0, bsales
syscall
li $v0, 6
syscall
mov.s $f6, $f0 #Storing no. of burgers sold

l.s $f7, pb #Profit of burger

li $v0, 4
la $a0, panipuri
syscall
li $v0, 6
syscall
mov.s $f8, $f0 #storing cost of panipuri

li $v0, 4
la $a0, psales
syscall
li $v0, 6
syscall
mov.s $f9, $f0 #Storing no. of panipuris sold

l.s $f10, pp #Profit of panipuri

li $v0, 4
la $a0, profit
syscall

mul.s $f2, $f2, $f3
mul.s $f2, $f2, $f4 #Total tea profit

mul.s $f5, $f5, $f6
mul.s $f5, $f5, $f7 #Total burger profit

mul.s $f8, $f8, $f9
mul.s $f8, $f8, $f10 #Total panipuri profit

add.s $f2, $f2, $f5
add.s $f2, $f2, $f8 #Net profit

li $v0, 2
mov.s $f12, $f2 #Outputting net profit
syscall

li $v0, 10
syscall #End program
