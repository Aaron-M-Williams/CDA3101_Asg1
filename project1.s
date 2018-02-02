.data
	array: 		.word (-89),(19),(91),(-23),(-31),(-96),(3),(67),(17),(13),(-43),(-74)
	length: 	.word 12
	sum: 		.word 0
	average: 	.word 0
	Promt:		.asciiz "Average of positive array elements: "

.text
	main:	
		la $t0, array 					#Base address of array
		li $t1, 0						#i=0 index of array
		lw $t2, length					#t2 is = length
		li $t3, 0						#sum =0
		sumLoop:
			lw $t4, ($t0)				#$t4 = array[i]
			blez $t4, IncrementIndex	#If array[i] is negative, branch to increment, otherwise add it to the sum.
			add $t3, $t3, $t4 			#sum = sum + array[i]
			IncrementIndex:				#IncrementIndex for the blez command to jump to
			add $t1, $t1, 1				#increment index
			add $t0, $t0, 4				#updating array address
			blt $t1, $t2, sumLoop		#If i<length then loop again.
		sw $t3, sum 					#Stores the value of $t3 to sum.

		
		#Calculate the average.
		div $t5, $t3, 6 	#Divides the sum value by 6.
		sw $t5, average 	#Stores the average to t5.

		#Display Promt
		la $a0,Promt		#Loads address of string text
		li $v0,4			#Provides code for system service to print String
		syscall				#Calls system to perform print operation

		#display average
		li $v0, 1			#Provides code for print_int to system call.
		move $a0, $t5 		#Moves value of $t5 to $a0 to be printed
		syscall				#Calls system to perform print operation

		#Terminate the Program
		li $v0, 10			#Terminate program
		syscall



