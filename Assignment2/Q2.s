############################################################
# Assignment 2
# Problem number 2
# semester 5
# Group number:56
# Student1: Sanyukta Deogade (19CS30016)
# Student2: Akanksha Singh (19CS10007)
############################################################


.data
	prompt1: .asciiz "Enter positive number 'a':"
	prompt2: .asciiz "Enter positive number 'b':"
	msg1: .asciiz "error: Negative values entered"
	msg2: .asciiz "GCD of a and b is: " 

.text
	.globl main 
	main: 

		li $v0, 4 			#prompt user to give a 
		la $a0, prompt1
		syscall

		li $v0, 5 			#take input a 
		syscall

		move $t0, $v0
		blt $t0,0,islessthan0  # t0 stores a 

		li $v0, 4			#prompt user to give b 
		la $a0, prompt2
		syscall

		li $v0, 5  			# take input b
		syscall

		move $t1, $v0
		blt $t1,0,islessthan0  #t1 stores b

		li $v0, 4            # printing msg of gcd is: 
		la $a0, msg2
		syscall

		move $a0,$t0        # moving the numbers a and b into argument registers
		move $a1,$t1

		jal gcd  			#calling gcd function
		
		li $v0,1            # printing value of GCD 
		move $a2,$v1
		syscall

		b exitlabel
		

		gcd: 

		beq $a0, $zero, exit1    #if a==0 go to exit1 
 
		while:                    

		beq $a1, $zero, exit       # if a1 == 0 go to exit 
		slt $t0, $a1, $a0          # if (a>b) go to L1
		bne $t0, $zero, L1
		sub $a1, $a1, $a0  			# else b = b - a
		j while

		L1:
	    
	    sub $a0, $a0, $a1         # a = a - b   
		j gcd 
		
		exit1: 

		add $v1, $a1, $zero      # return b 
		jr $ra

		exit: 

		add $v1, $a0, $zero     #return a 
		jr $ra


	islessthan0:
		li $v0, 4           #checking for -ve inputs 
		la $a0, msg1
		syscall 

		b exitlabel 

exitlabel: 
		li $v0,10      #exit 
		syscall