############################################################
# Assignment 2
# Problem number 3
# semester 5
# Group number:56
# Student1: Sanyukta Deogade (19CS30016)
# Student2: Akanksha Singh (19CS10007)
############################################################


.data
	input: .asciiz  "Enter a positive integer greater than equals to 10:"
	isprime: .asciiz "Entered number is a prime number"
	iscomposite: .asciiz "Entered number is a composite number"
	isless10: .asciiz "Entered number is less than 10"

.text
.globl main 
	main: 

		# prompt user to enter number
		li $v0, 4
		la $a0, input
		syscall

		li $v0, 5 
		syscall

		move $t0, $v0  #to stores input a
		li $v1, 2      #v1 is 2(i = 2)
		blt $t0,10,islessthan10  #checks if input is <10

		loopPrime:
			beq $v1, $v0, isPrime  #if i == a go to isPrime and exit loop 
			div $v0, $v1     	   # divide a by i 
			mfhi $10               # store remainder in $10
			beq $10,$zero,isComposite   #if remainder is zero go to composite and exit loop 
			addi $v1,$v1,1              #else i = i+1

			b loopPrime


	isPrime: 
		li $v0, 4           #printing that number is prime
		la $a0, isprime
		syscall

		b exitlabel

	isComposite:
		li $v0, 4          #printing that number is composite
		la $a0, iscomposite
		syscall 

		b exitlabel

	islessthan10:         #printing that number is <10 and exiting
		li $v0, 4
		la $a0, isless10
		syscall 

		b exitlabel 

	
	exitlabel: 
		li $v0,10
		syscall