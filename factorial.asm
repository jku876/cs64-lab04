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
	prompt: .asciiz "Enter the number:\n"
	messageOne: .asciiz "Factorial of "
	messageTwo: .asciiz " is:\n"
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

	li $t2, 2

	li $v0, 4
	la $a0, messageOne
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, messageTwo
	syscall

loop:
	blt $t1, $t2, print
	mult $t0, $t1
	mflo $t0
	sub $t1, $t1, 1
	j loop
print:
	li $v0, 1
	move $a0, $t0
	syscall

exit:
	li $v0, 10
	syscall
