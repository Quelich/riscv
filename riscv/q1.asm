 .global _start
 _start:
        la a0, askint	        # prepare to print string  
        li a7, 4			# print string
        ecall
        li a0, 0            # File descriptor, 0 for STDIN
        li a7, 5            # System call code for read integer. The value will be in a0
        ecall
        addi t3, a0, 0 # init n 
        addi t0, zero, 1 # init i = 1
        jal ra, loop1 
loop1:
      bgt t0, t3, end1 # if i >= n
      addi t1, zero, 1 # init j = 1
      jal ra, loop2
loop2:
      bgt t1, t0, end2
      addi t1, t1, 1 # j++
      # print star
      addi a0, zero, 1 # stdout
      la a1, star # load the address of star
      addi a2, zero, 1 # length of star
      addi a7, zero, 64 # syscall to print string
      ecall
      jal ra, loop2
end2:
      addi t0, t0, 1 # i++
      addi a0, zero, 1 # stdout
      la a1, newline        #print newline
      addi a2, zero, 2 # length of newline
      addi a7, zero, 64
      ecall
      jal ra, loop1
end1:
      addi a0, zero, 0
      addi a7, zero, 93        #Exit process 
      ecall

.data	
askint: .ascii "Enter an integer\n"
star: .ascii "*"
newline: .ascii "\n"  
