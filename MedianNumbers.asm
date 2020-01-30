# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	prompt: .asciiz "Enter the next number:\n"

	answer: .asciiz "Median: "


#Text Area (i.e. instructions)
.text

main:

	#input 1
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	#input 2
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	#input 3
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	#compare
	blt $t1, $t0, comp1
	blt $t2, $t1, comp2
	move $t3, $t1
	j printMedian

comp1:
	blt $t2, $t0, last
	move $t3, $t0
	j printMedian

comp2:
	blt $t2, $t0, last
	move $t3, $t0
	j printMedian

last:
	move $t3, $t2

printMedian:
	
	li $v0, 4
	la $a0, answer
	syscall

	li $v0, 1
	li $a0, $t4
	syscall


exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

