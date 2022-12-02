 .global _start
 _start:
        la a0, askint	        # prepare to print string  
        li a7, 4			# print string
        ecall
        li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
	addi a0, a0, -1
        jal ra, fact 
        jal ra, printresult
fact:
	addi sp, sp, -8 # save registers
	sw a0, 4(sp) # save return value
	sw ra, 0(sp) # save return address
	beq a0, zero, done1 # if x == 0, return 5
	
	bgt a0, zero, else # if n > 0, goto else
	addi sp, sp, 8 # restore sp
	jalr ra
else:
	addi a0, a0, -1 # return val = return val - 1
	addi t0, a0, 0
	jal fact
	lw t1, 4(sp)
	lw ra, 0(sp)
	addi sp, sp, 8
	slli a0, a0, 1 # 2 * f(x-1)
	add a0, a0, t0 # 2 * f(x-1) + x
	jalr ra
done1: 
	addi a0, zero, 5
	jalr ra
printresult:
     	li a7, 1			# Print integer. (the value is taken from a0)
      	ecall
      	addi a0, zero, 0
      	addi a7, zero, 93        #Exit process 
      	ecall
.data	
askint: .ascii "Enter an integer\n"