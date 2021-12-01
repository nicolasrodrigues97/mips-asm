# addition in MIPS assembly:
# add a value from a reg. with another reg. --> add
# add $REG $REG2 $REG3
#    result <-- val1 + val2
# eg:  add $t0, $t1, $t2
# eg2: add $t0, $zero, $zero --> same as: addi $t0, $zero, 0
# add a value directly to a register --> addi
# addi $t0, $t0, 1   (or any number up to 2^31 = 2147483648)
# Multiply 5 by 4:
main:
	addi $a0, $zero, 0 # a0 = 5
	addi $a1, $zero, 4 # a1 = 4 --> count
	addi $a2, $a2, 1
	# check if one of the operands is zero
	beq $a0,$zero, retzero
	beq $a1,$zero, retzero	
mult:
	# check if the operation has ended
	beq $a2, $a1, ret
	addi $a0, $a0, 5 
	addi $a2, $a2, 1
	j mult
ret:
	add $v0, $v0, $a0 # v0 receives the result
retzero:
	add $v0, $v0, $a0 # v0 receives the result
