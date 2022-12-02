 .global _start
  _start:
        la a0, asksize	        # prepare to print string  
        li a7, 4			# print string
        ecall
        li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
        # x = a0 
        addi s0, a0, 0 # save n into register 
        addi t1, zero, 0 # init i = 0
        jal ra, loop_getitems
loop_getitems:
	bge t1, s0, endloop_getitems
	addi t1, t1, 1 # init i++
	
	addi a0, t1, 0
	li a7, 1
	ecall
	
	addi a0, zero, 1 # stdout
      	la a1, colon # load the address of colon
      	addi a2, zero, 1 # length of colon
      	addi a7, zero, 64 # syscall to print string
        ecall
        
        # READ ARRAY ITEM
      	li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
        
	li a7, 1
	
        addi a0, zero, 1 # stdout
      	la a1, newline        #print newline
      	addi a2, zero, 2 # length of newline
      	addi a7, zero, 64
      	ecall
	
        jal ra, loop_getitems
	
endloop_getitems:
	jalr ra


getsize:
	
 .data	
asksize: .ascii "Size of the array?:\n"
colon: .ascii ":"
newline: .ascii "\n"