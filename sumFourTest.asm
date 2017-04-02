# instanciando as variaveis
li $a0, 5
li $a1, 4
li $a2, 3
li $a3, 2

# executa a função
jal addFour

add $s0, $zero, $v0 
j final

# função
addFour: 
add $v0, $a0, $a1
add $v0, $v0, $a2
add $v0, $v0, $a3
jr $ra

final: nop