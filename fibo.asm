main:
	addi $a0, $zero, 5
	jal fib #call fib
	add $s0,$v0,$zero
fib:
	addi $sp,$sp,-12
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	add $s0,$a0,$zero
	addi $t1,$zero,1
	beq $s0,$zero, Return0
	beq $s0,$t1, Return1
	addi $a0,$s0,-1
	jal fib
	add $s1,$zero,$v0
	addi $a0,$s0,-2
	jal fib
	add $v0,$v0,$s1
	exitfib:
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addi $sp,$sp,12
	jr $ra
return1:
	addi $v0, $zero, 1
	j exitfib
return0:
	addi $v0, $zero, 0
	j exitfib