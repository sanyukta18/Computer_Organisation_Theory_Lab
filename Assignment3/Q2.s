############################################################
# Assignment 3
# Problem number 2
# semester 5
# Group number:56
# Student1: Sanyukta Deogade (19CS30016)
# Student2: Akanksha Singh (19CS10007)
############################################################


.data
space:	.asciiz " "		    # a space string.
line:	.asciiz	"\n"		# a newline string.
colonsp:	.asciiz ": "	# a colon string with space.
array:	.word	0 : 100	    # an array of word, for storing values.
size:	.word	10		    # actual count of the elements in the array.


prompt_msg1:	.asciiz	"Input 10 integer values to be stored in array: "
prompt_msg2:	.asciiz	"Input number "
prompt_msg3:    .asciiz "Sorted:"
print_msg: 	    .asciiz "Enter the value of k:"
print_msg8: 	.asciiz 	"Error, value of k should be <= n.\n"
print_msg5: 	.asciiz 	"The kth largest number among the elements is:"
	.text
	.globl	main
main:
	li	$v0, 4			   #Printing prompt message
	la	$a0, prompt_msg1
	syscall

	li	$v0, 4			   #Printing newline
	la	$a0, line
	syscall

	la	$t0, array		# loading array to $t0.
	lw	$t1, size		# size of array--> $t1
	li	$t2, 0			# Loop runner i<---0

	####################Taking Input of array elements########################################
Loop1:
	bge	$t2, $t1, Loop1_end	# while (i < size).
	li	$v0, 4			# Printing prompt message
	la	$a0, prompt_msg2
	syscall

	li	$v0, 1			# 1 print_int syscall.
	addi	$a0, $t2, 1	# i=i+1
	syscall
	li	$v0, 4			# print_string syscall.
	la	$a0, colonsp	# load colonsp to argument register $a0.
	syscall

	li	$v0, 5
	syscall
	sw	$v0, 0($t0)		# storing values in array

	addi	$t0, $t0, 4		# increment array pointer by 4.
	addi	$t2, $t2, 1		# increment loop runner by 1.
	j	Loop1	            # goto the beginning of the loop.
Loop1_end:
	jal	print			# calling print

#############################SORTING ARRAY ELEMENTS########################################################################################
sort_array:
	la	$t0, array		# array ---> t0.
	lw	$t1, size		# array size ----> $t1.
	li	$t2, 1			# Initialising loop runner.
sort_Loop1:
	la	$t0, array
	bge	$t2, $t1, sort_Loop1_end	 # while (i < size).
	move	$t3, $t2
sort_Loop2:
	la	$t0, array
	mul	$t5, $t3, 4		                   # multiply $t3 with 4, and store in $t5
	add	$t0, $t0, $t5		               # add the array address with $t5, which is the index multiplied with 4.
	ble	$t3, $zero, sort_Loop2_end	       # while (t3 > 0).
	lw	$t7, 0($t0)		                   # load array[$t3] to $t7.
	lw	$t6, -4($t0)		               # load array[$t3 - 1] to $t6.
	bge	$t7, $t6, sort_Loop2_end	       # while (array[$t3] < array[$t3 - 1]).
	lw	$t4, 0($t0)
	sw	$t6, 0($t0)
	sw	$t4, -4($t0)
	sub	$t3, $t3, 1
	j	sort_Loop2		# goto sort_Loop2.
sort_Loop2_end:
	addi	$t2, $t2, 1	# increment loop runner by 1.
	j	sort_Loop1		# goto sort_Loop1.
sort_Loop1_end:
    #printing prompt message
	li	$v0, 4
	la	$a0, prompt_msg3
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	jal	print			# call print.
	li $v0, 4
	la $a0, print_msg   #printing prompt message
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	lw	$t1, size
    bgt   $t0,$t1,numberLarger # checking if k>n
    ###################################Finding Kth largest Element#################
    li $v0, 4
	la $a0, print_msg5
	syscall
	sub $s0,$t1,$t0
	addi $s0,$s0,1
    la $t2, array
    li  $t3,1
L3:
    bge $t3, $s0, print_element
    addi	$t2, $t2, 4
	addi	$t3, $t3, 1
	j	L3


exit:
	li	$v0, 10			# 10 = exit syscall.
	syscall				# issue a system call.
numberLarger:           #Printing Error Message
    li      $v0,4
    la      $a0,print_msg8
    syscall
    j       exit
print_element:         #Printing Kth largest Element
    li	$v0, 1
	lw	$a0, 0($t2)
	syscall
	j     exit

print:                    #Printing all elements of array
print_loop_prep:
	la	$t0, array
	lw	$t1, size
	li	$t2, 0
print_loop:
	bge	$t2, $t1, print_end
	li	$v0, 1
	lw	$a0, 0($t0)
	syscall
	li	$v0, 4
	la	$a0, space
	syscall
	addi	$t0, $t0, 4
	addi	$t2, $t2, 1
	j	print_loop
print_end:
	li	$v0, 4
	la	$a0, line
	syscall
	jr	$ra

