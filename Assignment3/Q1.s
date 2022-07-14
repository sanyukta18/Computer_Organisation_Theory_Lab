############################################
# Assignment 3
# Problem number 1
# semester 5
# Group number:56
# Student1: Sanyukta Deogade (19CS30016)
# Student2: Akanksha Singh (19CS10007)
############################################################

.data
	prompt_msg1: .asciiz	"Enter first number : "
	prompt_msg2: .asciiz	"Enter second number : "
	prompt_msg3: .asciiz	"Product of the two numbers are : "
	prompt_msg4:	.asciiz	"Error, numbers should be in range of 16 bit signed integer  -32768 <= n <= 32767\n"
	line: .asciiz	"\n"

.text
.globl main
	main:
		#Taking input for first Integer
		li $v0, 4
		la $a0, prompt_msg1
		syscall

		li $v0, 5
		syscall

		move $t0, $v0	 # $t0 - First Integer

		#Taking input for second integer
		li $v0, 4
		la $a0, prompt_msg2
		syscall

		li $v0, 5
		syscall

		move $a1, $v0	# $a1 - Multiplier
		move $a0, $t0	# $a0 - Multiplicand

		######################Sanity Checking#####################################

		blt $a1, -32768, Error	# Checking if input is less than -2^15
		blt $a0, -32768, Error

        bgt $a0, 32767,Error   # Checking if input is greater than 2^15-1
        bgt $a1, 32767,Error


		jal Booth_Algorithm   # Function call to booth algorithm

		move $t0, $v0	#t0= Result of multiplication

		#Printing result
		li $v0, 4
		la $a0, prompt_msg3
		syscall

		move $a0, $t0
		li $v0, 1
		syscall

		li $v0, 4
		la $a0, line
		syscall
        b exit

	#If input is out of range of 16 bit signed integer
	Error:
		li $v0, 4
		la $a0, prompt_msg4
		syscall
        b exit


	exit:
		li $v0, 10
		syscall

	Booth_Algorithm:
        #Initialisation
		li $v0, 0
		li $t0, 1	#For  mask
		li $t1, 0	#For LSB

		mult_loop:
			beq $a1, $zero, End_Loop	#Condition checking for multiplier equality with aero
			and $t1, $t0, $a1	#Getting the LSB
			beq $t1, 1, Add	    #If LSB is nonzero, adding multiplicand to result
			beq $t1, 0, Shift	#If LSB is equal to 0, doing shift here

			Add:
				addu $v0, $v0, $a0	#A+M

			Shift:
				sll $a0, $a0, 1
				srl $a1, $a1, 1

			j mult_loop	  #Goto loop

		End_Loop:
			jr $ra		#Return
