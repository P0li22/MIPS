.data
c0: .word 1
.text
.globl main
.ent main
main:
lw $a0, c0
jal sequenzaDiCollatz
add $a0, $v0, $0
li $v0, 1
syscall
li $v0, 10
syscall
.end main

.ent sequenzaDiCollatz
sequenzaDiCollatz:
addi $t0, $0, 1
loop:
addi $sp, $sp, -8
sw $t0, 0($sp)
sw $ra, 4($sp)
jal calcolaSuccessivo
lw $t0, 0($sp)
lw $ra, 4($sp)
addi $sp, $sp, 8
add $a0, $v0, $0
addi $t0, $t0, 1
bne $a0, 1, loop
add $v0, $t0, $0
jr $ra
.end sequenzaDiCollatz

.ent calcolaSuccessivo
calcolaSuccessivo:
and $t0, $a0, 1 # $a0 % 2
bne $t0, 0, odd
div $v0, $a0, 2
jr $ra
odd:
mul $v0, $a0, 3
addi $v0, $v0, 1
jr $ra
.end calcolaSuccessivo
