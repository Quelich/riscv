 .global _start
 _start:
        la a0, askint	        # prepare to print string  
        li a7, 4			# print string
        ecall
        li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
        jal ra, f 
        jal ra, printresult
f:	
	addi sp, sp, -16
	sw a0, 8(sp) # save n
	sw a0, 4(sp) # save the current x
	sw ra, 0(sp) # save the return address
	addi a0, zero, 5 # return value = 5 
	beq a0, zero, done # if x = 0 
	addi a0, zero, 1 # return value = 1
	ble a0, zero, done   # if x < 0
	addi a0, t3, 0
	bgt a0, zero, elseif
	addi sp, sp, 8 # restore sp
	jalr zero, 0(ra)
elseif:
	addi a0, a0, -1 # x = x - 1
	jal, f
	lw t3, 8(sp) # load old x
	lw t1, 4(sp) # load old x)
	lw ra, 0(sp) # restore ra
	addi sp, sp, 8 # restore sp
	addi t2, zero, 2 # t1 = 2
	mul t2, t2, a0 # t1 = 2 * f(x-1)
	add a0, t1, t3 #  2 * f(x-1) + x
	jalr zero, 0(ra)
done:
    	jalr zero, 0(ra)
printresult:
     	li a7, 1			# Print integer. (the value is taken from a0)
      	ecall
      	#addi a0, zero, 0
      	#addi a7, zero, 93        #Exit process 
      	#ecall
.data	
askint: .ascii "Enter an integer\n"