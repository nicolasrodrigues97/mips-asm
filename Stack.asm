# Stack implementation in MIPS Assembly (add integers to stack):
# memory
# 0-3   [  ] t0   (each slot takes 4 bytes)
# 4-7   [  ] t1
# 8-11  [  ] t2
# 12-15 [  ] t3
# 16-19 [  ] t4
Stack:
      addi $sp, $sp, -20 # allocate 5 slots (words) on the stack
      sw $t0,0($sp) # store t0's value in the first slot on the stack
      lw $t1,4($sp) # load t1's value from the stack
      addi $sp, $sp, 20 #de-allocate 5 slots (words) from the stack
