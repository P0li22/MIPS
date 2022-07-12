.data
mat: .word 1, 2, 3
     .word 3, 2, 1
     .word 7, 7, 8
.text
.globl main
.ent main
main:
la $t0, mat
lw $a0, 0($t0)
lw $a1, 4($t0)
lw $a2, 8($t0)
lw $a3, 12($t0)
add $t1, $0, $0
loop:
lw $t2, 16($t0)
addi $sp, $sp, -4
sw $t2, 0($sp)
addi $t1, $t1, 1
addi $t0, $t0, 4
bne $t1, 5, loop
addi $sp, $sp, -4
sw $ra, 0($sp)
jal determinante3x3
lw $ra, 0($sp)
add $a0, $v0, $0
li $v0, 1
syscall
j $ra
.end main

.ent determinante3x3
determinante3x3:
add $sp, $sp, -24
sw $ra, 20($sp)
sw $fp, 16($sp)
sw $s0, 12($sp)
sw $s1, 8($sp)
sw $s2, 4($sp)
sw $s3, 0($sp)
addi $fp, $sp, 28
add $s0, $a0, $0 # a1
add $s1, $a1, $0 # b1
add $s2, $a2, $0 # c1
add $s3, $a3, $0 # a2
lw $a0, 16($fp) # $a0 -> alto sx
lw $a1, 12($fp) # $a1 -> alto dx
lw $a2, 4($fp) # $a2 -> basso sx
lw $a3, 0($fp) # $a3 -> basso dx
addi $sp, $sp, -16
sw $a0, 12($sp)
sw $a1, 8($sp)
sw $a2, 4($sp)
sw $a3, 0($sp)
jal determinante2x2
lw $a0, 12($sp)
lw $a1, 8($sp)
lw $a2, 4($sp)
lw $a3, 0($sp)
addi $sp, $sp, 16
mul $t0, $s0, $v0
add $s0, $a0, $0 # salvo b2 in $s0 per dopo, tanto a1 non serve più
add $a0, $s3, $0
add $s3, $a2, $0 # salvo b3 in $s3 per dopo, tanto il valore di $s3 è in $a0
lw $a2, 8($fp)
addi $sp, $sp, -20
sw $t0, 16($sp)
sw $a0, 12($sp)
sw $a1, 8($sp)
sw $a2, 4($sp)
sw $a3, 0($sp)
jal determinante2x2
lw $t0, 16($sp)
lw $a0, 12($sp)
lw $a1, 8($sp)
lw $a2, 4($sp)
lw $a3, 0($sp)
addi $sp, $sp, 20
mul $t1, $s1, $v0
add $a1, $s0, $0
add $a3, $s3, $0
addi $sp, $sp, -8
sw $t0, 4($sp)
sw $t1, 0($sp)
jal determinante2x2
lw $t0, 4($sp)
lw $t1, 0($sp)
addi $sp, $sp, 8
mul $t2, $s2, $v0
sub $v0, $t0, $t1
add $v0, $v0, $t2
lw $ra, 20($sp)
lw $fp, 16($sp)
lw $s0, 12($sp)
lw $s1, 8($sp)
lw $s2, 4($sp)
lw $s3, 0($sp)
add $sp, $sp, 24
j $ra
.end determinante3x3

.ent determinante2x2
determinante2x2:
mul $t0, $a0, $a3
mul $t1, $a1, $a2
sub $v0, $t0, $t1
jr $ra
.end determinante2x2
