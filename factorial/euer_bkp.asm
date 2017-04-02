

.data 
	iterations : 3
.text

lw $a0, iterations 
sw $a0, 0($sp) # store the parameter
jal euler # call with the parameters
lwc1 $f30, 4($sp) # get the result
cvt.s.w $f30, $f30
j end

# function euler(iterations){
euler:  
	
	# var eq = iterations == 0
	lw $t0, 0($sp) 
	
	#  if( eq ){
	#    return 1;
	#  }
	
	beq $t0, $zero, euler_param_eq_zero
	j resto

euler_param_eq_zero:
	li $t1, 1 
	mtc1 $t1, $f1
	cvt.s.w $f1, $f1 # $f1 = parseFloat($t1)
	swc1 $f1, 4($sp) 
	jr $ra # return $f1
	
	
resto:	
	subi $sp, $sp, 12
	
	sw $t0, 0($sp)
	sw $ra, 8($sp)
	jal factorial  
	lw $t0, 0($sp)
	lw $t1, 4($sp) # var $t1 = factorial(iterations);
	lw $ra, 8($sp)
	
	subi $t4, $t0, 1 #  var $t3 = iterations - 1 
	
	sw $t4, 0($sp)
	sw $ra, 8($sp)
	jal euler 
	lw $t4, 0($sp)
	lw $ra, 8($sp)
	lwc1 $f4, 4($sp) #  var $t4 = euler( $t3 )
	lwc1 $f5, 12($sp)
	
	

	mtc1 $t1, $f1
	cvt.s.w $f1, $f1 # $f1 = float($t1)
	
	li $t2, 1
	mtc1 $t2, $f2
	cvt.s.w $f2, $f2 # $f2 = float($t2)
	
	div.s $f3, $f2, $f1 # var $t3 = $f2 / $t1	
	add.s $f4, $f4, $f3 # var $f4 = $f4 + $f3

	swc1 $f4, 16($sp)
	add.s $f28, $f4, $f4
	addi $sp, $sp, 12
	

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
