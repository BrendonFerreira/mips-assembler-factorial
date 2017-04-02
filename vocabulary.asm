

# calling function

# instantiting parameters
li $s0, 12
li $s1, 3

# if i need pass two parameters
# i have in the stack
# ----------------
# | parameter 1  |
# | parameter 2  |
# | child return |
# | $ra          |
# ----------------
# so, in that case i gonna need 4 words
# to open 4 words in stack i multiply 4 * 4 bits
# 16bits
# so:
addi $sp, $sp, -16

#adding parameter in stack
sw $s0, 0($sp)
sw $s1, 4($sp)

# adding $ra in stack
sw $ra, 12($sp)

# and finnaly call the function
jal sumforselftimes

# load child return
lw $t0, 8($sp)

# jump to end
j end

# create stack
# add arguments in stack
# add $ra
#

# Creating a function
sumforselftimes:

  lw $t0, 0($sp) # base number
  lw $t1, 4($sp) # times

  # if ( times == 0 ) j return self
  beq $t1, $zero, returnSelf

  # ----------------
  # | parameter 1  |
  # | parameter 2  |
  # | child return | <--- for a while still empty
  # | $ra          |
  # ----------------
  addi $sp, $sp, -16

  #adding parameter in stack
  sw $s0, 0($sp)
  sw $s1, 4($sp)

  # adding $ra in stack
  sw $ra, 12($sp)


  jal sumforselftimes

returnSelf:
  sw $t0, 8($sp)
  jr $ra

end: nop
