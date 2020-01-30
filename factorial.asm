# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	prompt1: .asciiz "Enter the number:\n"
	message1: .asciiz "Factorial of "
	message2: .asciiz " is:\n"
	endl: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
	li $t0, 1

	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t1, $v0
	move $t3, $t1

	li $t2, 2

loop:
	blt $t1, $t2, print
	mult $t0, $t1
	mflo $t0
	sub $t1, $t1, 1

print:
	li $v0, 4
	li $a0, message1
	syscall

	li $v0, 1
	li $a0, $t3
	syscall

	li $v0, 4
	li $a0, message2
	syscall

	li $v0, 1
	li $a0, $t0
	syscall

	li $v0, 4
	li $a0, endl
	syscall

exit:
	li $v0, 10
	syscall