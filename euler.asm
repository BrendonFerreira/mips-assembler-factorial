

#function euler(iterations){
#  // Se for a ultima iteração retorna 1
#  if( iterations == 0){
#    return 1;
#  }

#  // 1/!x + 1/!(x-1) + 1/!(x-2)... até o numero de iterações
#  return (1 / factorial(iterations)) + euler( iterations - 1 );
#}



li $a0, 50
jal euler
j end

euler:
	add	$t0, $zero, $a0
	bne	$t0, $zero, not_equal_zero
	equal_zero:
		addi	$t0, $t0, 1
		j returnArgument
	not_equal_zero:
		addi $sp, $sp, -12
		sw $t0, 0($sp)
		sw $ra, 8($sp)
		jal factorial
		lw $s0, 4($sp)
		j returnArgument
	returnArgument:
		add $a0, $zero, $t0
		jr $ra


end: nop
