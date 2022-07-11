.text
.globl main
.ent main
main:
li $t0, 15
li $t1, 16
li $t2, 17
li $t3, 18
li $s0, 223
li $s1, 224
li $s2, 225
li $s3, 226
add $a0, $t0, $0
add $a1, $s0, $0
addi $sp, $sp, -16
sw $t0, 12($sp)
sw $t1, 8($sp)
sw $t2, 4($sp)
sw $t3, 0($sp)
jal somma
lw $t0, 12($sp)
lw $t1, 8($sp)
lw $t2, 4($sp)
lw $t3, 0($sp)
addi $sp, $sp, -16
add $t4, $v0, $0
li $v0, 10
syscall

somma:
addi $sp, $sp, -20
sw $s0, 16($sp)
sw $s1, 12($sp)
sw $s2, 8($sp)
sw $s3, 4($sp)
sw $s4, 0($sp)
add $t0, $0, $0
add $t1, $0, $0
add $t2, $a0, $0 # primo parametro
add $t3, $0, $0
add $t4, $0, $0
add $s0, $0, $0
add $s1, $0, $0
add $s2, $a1, $0 # secondo parametro
add $s3, $0, $0
add $s4, $0, $0
add $v0, $t2, $s2
lw $s0, 16($sp)
lw $s1, 12($sp)
lw $s2, 8($sp)
lw $s3, 4($sp)
lw $s4, 0($sp)
addi $sp, $sp, 20
jr $ra
