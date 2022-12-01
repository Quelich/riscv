 .global _start
_start:
        la a0, askint	        # prepare to print string  
        li a7, 4			# print string
        ecall
      
        li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
    
        li a7, 1			# Print integer. (the value is taken from a0)
        ecall
        
        addi t2, a0, 0 # init n
        addi t2, t2, 1 # n + 1
	jal zero, loop1
loop1:
      addi t0, zero, 0 # init i = 0
      bge t0, t2, end1 # if i >= n + 1
      addi t1, zero, 0 # init j = 0
      jal zero, loop2
loop2:
      bge t1, t0, end2
      # print *
      la a0, star
      li a7, 4
      ecall
      addi s3, s3, 1 # j++
      jal zero, loop1
end2:
      addi s2, s2, 1 # i++
      li a7, 4
      la a0, newline        #print newline
      ecall
      jal zero, loop1
end1:
      addi a7, zero, 93        #Exit process 
      addi a0, zero, 13
      ecall 
.data	
askint: .ascii "Enter an integer\n"
str1:.space 255
star: .string "*"
newline: .string "\n"  