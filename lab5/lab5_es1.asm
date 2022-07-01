.data
x: .word 3141592653

.text
.globl main
.ent main
main:
lw $t0, x
li $t2, 0 # contatore stack
li $t3, '0'
li $t4, 10

loop_div:
divu $t0, $t4
mflo $t0
mfhi $t1
addi $sp, $sp, -4
addi $t2, $t2, 1
sw $t1, 0($sp)
bne $t0, $0, loop_div

li $v0, 11
loop_print:
lw $t1, 0($sp)
add $t1, $t1, $t3
move $a0, $t1
syscall
addi $sp, $sp, 4
addi $t2, $t2, -1
bne $t2, 0, loop_print

li $v0, 10
syscall
