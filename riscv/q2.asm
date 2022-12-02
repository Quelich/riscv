 .global _start
 _start:
        la a0, askint	        # prepare to print string  
        li a7, 4			# print string
        ecall
        li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
        addi t3, a0, 0 # init x from input
        addi t0, zero, 0 # init 0 
        jal ra, f 
f:
	addi sp, sp, -8
	addi a0, zero, 5 # return value = 5 
	beq t3, t0, done # if x = 0 
	addi a0, zero, 1 # return value = 1
	ble t3, t0, done   # if x < 0
	addi t2, t3, -1 # t2 = x - 1
	sw ra, 0(sp) # save return address
	sw a0, 8(sp) # save return value
	jal ra, f # call f(x-1)
	lw t0, 0(sp) # load old x 
	sw a0, 8(sp) # push f(x-1)
	addi t1, zero, 2 # t1 = 2
	mul t1, t1, a0 # t1 = 2 * f(x-1)
	add a0, t1, t3 #  2 * f(x-1) + x
	# clean up
	lw ra, 0(sp)
	addi sp, sp, 16
	jal ra, print
done:
	jalr zero, 0(ra)
print:
      li a7, 1			# Print integer. (the value is taken from a0)
      ecall
      addi a0, zero, 0
      addi a7, zero, 93        #Exit process 
      ecall
.data	
askint: .ascii "Enter an integer\n"