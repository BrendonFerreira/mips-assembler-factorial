li $a0, 100

jal C2F
add $s0, $zero, $v0 
j FINAL

C2F:
mul $v0, $a0, 9
div $v0, $v0, 5
addi $v0, $v0, 32
jr $ra 

FINAL: nop
