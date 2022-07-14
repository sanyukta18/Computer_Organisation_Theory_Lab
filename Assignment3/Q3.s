############################################
# Assignment 3
# Problem number 3
# semester 5
# Group number:56
# Student1: Sanyukta Deogade (19CS30016)
# Student2: Akanksha Singh (19CS10007)
############################################################


.data
prompt1: .asciiz "Enter positive row size,'m':"
prompt2: .asciiz "Enter positive column size,'n':"
prompt3: .asciiz "Enter 'a':"
prompt4: .asciiz "Enter 'r':"
msg1:    .asciiz "Array is: "
msg2:   .asciiz "\n"
msg3:   .asciiz "|"
msg5:   .asciiz " "
msg4:   .asciiz " |\n"


.text 
	.globl main 
	main:

		li $v0, 4 			#prompt user to give m
		la $a0, prompt1
		syscall

		li $v0, 5 			#take input m
		syscall
 		move $s0, $v0


		li $v0, 4			#prompt user to give n 
		la $a0, prompt2
		syscall

		li $v0, 5  			# take input n
		syscall
		move $s1, $v0 


		li $v0, 4			#prompt user to give a
		la $a0, prompt3
		syscall

		li $v0, 5  			# take input a
		syscall
		move $s2, $v0  


		li $v0, 4			#prompt user to give r
		la $a0, prompt4
		syscall

		li $v0, 5  			# take input r
		syscall
		move $s3, $v0    

		jal initStack       #calling initStack function

		jal mallocInStack   #allocating memory to stack
		move $v1,$v0

		li $t0,1								#looping index for 'loop'

	    sw $s2,0($v0)							#initialing A[0][0] with a
	    addi $v0,$v0,4
 
	    mulou $s6,$s0,$s1                     #stores m*n

		loop :	
			bge $t0,$s6,done						#if looping index >= m*n, jump to 'done'

			lw $t1,-4($v0)							#calculating the next matrix element value based on the previous value as per the problem statement
			move $t2,$s3
			mulou $t1,$t1,$t2            # a = a*r[prev]


			sw $t1,0($v0)							#storing the value in A matrix

			addi $t0,$t0,1                          #incrementing loop counter by 1
			addi $v0,$v0,4                          #incrementing address of stack pointer by 4

			j loop 									#while loop

		done: 
 
			li $v0, 4 		                       #printing msg1	
			la $a0,msg1
			syscall

			move $a0,$s0 							#arguments storing for printMatrix for A
			move $a1,$s1
			move $a2,$v1
			sw   $ra, -4($sp)  

   		   jal printMatrix							#call printMatrix for Matrix

   		   jal mallocInStack                         #allocating memory for transpose of matrix
   		   #move $v2,$v0

   		   move $a0,$s0                              #arguments for calling transposeMatrix
   		   move $a1,$s1
   		   move $a2,$v1
   		   move $a3,$v0
   		   jal transposeMatrix


			move $a0,$s1 							#arguements storing for printMatrix for transpose
			move $a1,$s0
			move $a2,$v0
			sw   $ra, -4($sp)  

   		   	jal printMatrix							#call printMat for transpose

   		   b exitlabel

   	transposeMatrix: 
   		   	
		    li $t3, 0               # initialize outer-loop counter to 0

		transpose_matrix_loop_outer:
		    bge $t3, $a0, transpose_matrix_loop_outer_end

		    li $t4, 0               # initialize inner-loop counter to 0

		transpose_matrix_loop_inner:
		    bge $t4, $a1,transpose_matrix_loop_inner_end

		    mul $t5, $t3, $a1       # $t5 <-- width * i
		    add $t5, $t5, $t4       # $t5 <-- width * i + j
		    mul $t5, $t5, 4         # $t5 <-- 2^2 * (width * i + j)
		    add $t5, $a2, $t5       # $t5 <-- base address + (2^2 * (width * i + j))

		    mul $t6, $t4, $a0       # $t6 <-- height * j
			add $t6, $t6, $t3       # $t6 <-- height * j + i
			mul $t6, $t6, 4         # $t6 <-- 2^2 * (height * j + i)
		    add $t6, $a3, $t6       # $t6 <-- base address + (2^2 * (height * j + i))

		    lw $t7,0($t5)         				#loading val of arr in $t6 to be printed
		    sw $t7,0($t6)

		    addiu $t4, $t4, 1       # increment inner-loop counter

		    b transpose_matrix_loop_inner    # branch unconditionally back to beginning of the inner loop

		transpose_matrix_loop_inner_end:
		    addiu $t3, $t3, 1                # increment outer-loop counter

		    b transpose_matrix_loop_outer    # branch unconditionally back to beginning of the outer loop

		transpose_matrix_loop_outer_end:
								jr $ra


	printMatrix:

		move $t2,$a0 							#storing arguements in t registers
		move $t3,$a1
		move $t4,$a2	
		li $t0,0 								#looping index for 'loop1'

		li $v0,4           						#print newline
		la $a0,msg2
		syscall

		j loop1 								#jump to 'loop1'

	loop1 : 
		bge $t0,$t2,done1 						#if looping index >= m, jump to 'done1'

		li $v0,4 								#print msg7
		la $a0,msg3
		syscall

		li $t1,0 								#looping index for 'loop2' (nested loop)
		j loop11

	loop11 :
		bge $t1,$t3,loop12 						#if looping index >= n, jump to 'loop12'

		li $v0,4 								#print msg7
		la $a0,msg5 
		syscall

		li $v0,1 								#printing the current value in register $t4
		lw $a0,0($t4)
		syscall

		addi $t1,$t1,1							#incrementing looping index
		addi $t4,$t4,4							#incrementing $t4 by 4
		j loop11								#nested while loop


	loop12:
		li $v0,4 								#print msg7
		la $a0,msg4
		syscall

		addi $t0,$t0,1 							#incrementing looping index
		j loop1 								#jump to loop1

	done1 :		
		jr $ra  								#just return


	pushToStack: 

		sub $sp, $sp, 4
		sw $a0, 0($sp)
		jr $ra


	mallocInStack: 

		li $t0,4								#allocating desired space for matrix
		mulou $t1,$s0,$s1
	    mulou $t0,$t0,$t1

	    move $s6,$t0							#$s6 stores the memory size to be allocated for the matrix

	    subu $sp,$sp,$t0						#A
	    move $s4,$sp
	    move $s7,$s4
	    move $v0,$s7
	    jr $ra

	initStack: 

		move $fp,$sp							#remembering stack entry point stored in $fp into $sp
	    subu $fp,$fp,4
	    jr $ra

	exitlabel: 
		li $v0,10      #exit 
		syscall