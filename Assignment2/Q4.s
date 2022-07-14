############################################################
# Assignment 2
# Problem number 4
# semester 5
# Group number:56
# Student1: Sanyukta Deogade (19CS30016)
# Student2: Akanksha Singh (19CS10007)
############################################################

.data

	input: .asciiz "Enter a positive integer: "
	isPerfect: .asciiz "Entered number is perfect"
	isnotPerfect: .asciiz "Entered number is not perfect"
	isless0: .asciiz "Entered number is negative(error)"

.text
.globl main 
	main:

		li $v0, 4  			#Prompting user for input
			la $a0, input
			syscall


		li $v0, 5          #taking in input a
		syscall

		move $t0, $v0          # t0 stores input a 
		blt $t0,0,islessthan0  #checks if input is negative

		li $t1,1 	#i=1
		li $t2,0 	#sum=0

	loop:	
		slt $t3,$t1,$t0     
		beq $t3,$zero,end     #if i == n go to end 

		div $t0,$t1     #divide a by i 
		mflo $t4  	#t4 stores quotient
		mfhi $t5 	#t5 stores remainder

		beq $t5,$zero,factor  #if remainder == 0 go to factor
		addi $t1,$t1,1        # i = i+1
		j loop                # go back into loop

	end: 
		beq $t2,$t0,isPerfectno   #if sum == input go to isPerfectno
		bne $t2,$t0,isnonPerfect  #if sum != input go to isnonPerfect

	factor: 
		add $t2,$t2,$t1  #sum = sum+factor
		addi $t1,$t1,1 	  #factor = factor+1
		j loop

	isPerfectno: 
		li $v0, 4            #prints that number is perfect
		la $a0, isPerfect
		syscall

		b exitlabel

	isnonPerfect:          
		li $v0, 4             #prints that number is not perfect 
		la $a0, isnotPerfect
		syscall 

		b exitlabel

	islessthan0:          #prints that input is negative and exits
		li $v0, 4
		la $a0, isless0
		syscall 

		b exitlabel 

	
	exitlabel: 
		li $v0,10
		syscall