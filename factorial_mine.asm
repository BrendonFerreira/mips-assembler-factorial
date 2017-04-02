#function factorial(number){
#  if( number == 0 ){
#    return 1;
#  }
#  if( number < 0 ){
#    return -1;
#  }

# // Retorna recursivamente o valor (x-1)! * x
#  return factorial(number - 1) * number;
#}
# $s0 = factorial(5)

li $t0, 5
addi $sp, $sp, -12
sw $t0, 0($sp)
sw $ra, 8($sp)

# $s0 = factorial(5)
jal factorial
lw $s0, 4($sp)
j FINAL

factorial:
	lw $t0, 0($sp) # input

	# if( $to == 0) {
	bne $t0, $zero, factorial_not_zero #pule se nao for fatorial de zero

	# se sim, tera que fazer o que esta abaixo
	# return 1;
	li $t0, 1
	sw $t0, 4($sp)
	jr $ra
	# } else {

factorial_not_zero:

	addi $t0, $t0, -1
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $ra, 8($sp)

	jal factorial

	lw $ra, 8($sp) # pega o contador
	lw $t1, 4($sp) # pega o retorno da função filha
	lw $t2, 12($sp) # pega o do pai
	mul $t3, $t1, $t2

	sw $t3, 16($sp)
  addi $sp, $sp, 12
	jr $ra


FINAL: nop
