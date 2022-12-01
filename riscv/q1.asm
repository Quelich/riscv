


.global _start
_start:
        la a0, helloworld	        # prepare to print string  
        li a7, 4			# print string
        ecall
 
        li a0, 0           # File descriptor, 0 for STDIN
        la a1, str1           # Address of buffer to store string
        li a2, 255        # Maximum number of chars to store
        li a7, 63         # System call code for read string
        ecall

        la a0, str1	        # prepare to print string 
        li a7, 4			# print string
        ecall

        li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
     
        li a0, 42
        li a7, 1			# Print integer. (the value is taken from a0)
        ecall
	
	addi t0, a7, 0 #  load a7 to temp register for
	       

        
  	addi a7, zero, 93        #Exit process 
        addi a0, zero, 13
        ecall 

.data	
helloworld: .ascii "Enter an integer\n"
str1:.space 255
star: .string "*"
newline: .string "\n"   
