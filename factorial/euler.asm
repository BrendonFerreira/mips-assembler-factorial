

li $a0, 5
sw $a0, 0($sp) # store the parameter
jal euler # call with the parameters
lwc1 $f30, 4($sp) # get the result
j end

euler:

	# $s0 = factorial(5)
	#function euler(iterations){
	#	if( iterations == 0) return 1;
	#	return (1 / factorial(iterations)) + euler( iterations - 1 );
	#}
	
	lw $t0, 0($sp)
	beq $t0, $zero, euler_param_eq_zero
	
	addi $sp, $sp, -12 # open space
	sw $t0, 0($sp) # store 
	sw $ra, 8($sp) # store
	jal factorial 
	lw $t1, 4($sp) # factorial(iterations)
	lw $ra, 8($sp)
	
	li $t2, 1
	
	mtc1 $t2, $f2
	cvt.s.w $f2, $f2
	
	mtc1 $t1, $f1
	cvt.s.w $f1, $f1
	
	div.s $f3, $f2, $f1 # ( 1 / factorial(iterations) )
	
	addi $sp, $sp, -4
	addi $t4, $t0, -1
	sw $t4, 0($sp)
	sw $ra, 8($sp)
	swc1 $f3, 12($sp)
	jal euler
	lw $t5, 4($sp) # euler(iterations - 1)
	lw $ra, 8($sp)
	lwc1 $f3, 12($sp)
	add $sp, $sp, 4
	
	mtc1 $t5, $f5
	cvt.s.w $f5, $f5
	
	add.s $f6, $f6, $f3 # ( 1 / factorial(iterations) ) + euler( iterations - 1)
	
	swc1 $f6, 16($sp)
	addi $sp, $sp, 12
	jr $ra
	
	

euler_param_eq_zero:
	li $t0, 1
	mtc1 $t0, $f1
	cvt.s.w $f1, $f1
	swc1 $f1, 4($sp)
	jr $ra


factorial:

	#function factorial(number){
	#  if( number == 0 ) return 1;
	# return factorial(number - 1) * number;
	#}
	
	lw $t0, 0($sp) # input

	
	bne $t0, $zero, factorial_not_zero # if( $to == 0) goto factorial_not_zero

	# se sim, tera que fazer o que esta abaixo
	# return 1;
	li $t0, 1
	sw $t0, 4($sp)
	jr $ra
	# } else {

factorial_not_zero:

	addi $t0, $t0, -1 # this is the number - 1
	
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 8($sp)
	jal factorial
	lw $t2, 12($sp)
	lw $ra, 8($sp)
	lw $t1, 4($sp) # factorial( number - 1 ) 
	mul $t3, $t1, $t2 # factorial(number - 1 ) * number

	sw $t3, 16($sp) # store as child return to father
  	addi $sp, $sp, 12 # realocate 
	jr $ra # jump

end: nop
