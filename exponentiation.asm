.data
      error: .asciiz "Error: 0ˆ0 is not a number (NaN)"
# exponentiation in MIPS assembly:
# to-do: add procedures (exceptions) for: base = 0, exponent = 0, exponent = 1
# Calculate 3³:
.text
main:
      addi $t0, $zero, 3 # t0 = 3 --> base
      add $t1, $zero, $zero # t1 = 0 --> multi. count. (start with 0 for a total of 3 iterations)
      addi $t2, $zero, 3 # t2 receives the exponent (3)
      addi $t3, $zero, 1 # t3 = 1 --> exp. count (start with 1 for a total of 3 iterations)
      add $t4, $t4, $t0 # t4 = mult. result
      jal exp
      # exception handling
      beq $t0, $zero, base0 # base equals 0 
      beq $t2, $zero, pow0 # exponent equals 0
      beq $t0, $t3, pow1 # exponent equals 1
mult:
      beq $t1, $t2, exp # beq --> compares if $t1 (counter) equals t2 (the exponent)
      add $t4, $t4, $t0 # t4 + t0
      addi $t1, $t1, 1 # count++
      j mult # repeat loop
exp:
      add $t1, $zero, $zero # reset multi. count. to 0
      add $t0, $t0, $t4 # set new base value
      addi $t3, $t3, 1 # expCount++
      beq $t3, $t2, end # the exponent counter reached the exponent value? go to "end"
      j mult
base0: # exception: if the base equals 0
      beq $t2, $zero, base0pow0 # base equals 0 && exponent equals 0      
      add $t0, $zero, $zero # t0 = 0
      j end
pow0: # exception: if the exponent equals 0
      addi $t0, $t0, 1 # t0 = 1
      j end
pow1: # exception: if the exponent equals 1
      j end
base0pow0: # exception: not a number (base 0, exponent 0)
      li $v0, 4 # system call code for printing string (4)    -  memory [ 0-4   4-8   8-12 ...]
#                                                                        error
      la $a0, error # load address of string to be printed into $a0
      syscall      
end:
      add $v0, $t0, $zero # v0 receives the result of 3³
