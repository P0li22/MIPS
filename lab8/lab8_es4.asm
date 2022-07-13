.data
dim: .byte 5
vet1: .word 56, 12, 98, 129, 58
vet2: .word 1, 0, 245, 129, 12
risultato: .space 20
.text
.globl main
.ent main
main:
la $a0, vet1
la $a1, vet2
lb $a2, dim
la $a3, risultato
jal calcolaDistanzaH
li $v0, 10
syscall
.end main

.ent calcolaDistanzaH
calcolaDistanzaH:
add $t0, $0, $0
loop_v:
add $t1, $0, $0
add $t7, $0, $0
addi $t2, $0, 1
lw $t3, 0($a0)
lw $t4, 0($a1)
loop_w:
and $t5, $t3, $t2
and $t6, $t4, $t2
beq $t5, $t6, eq
addi $t7, $t7, 1
eq:
addi $t1, $t1, 1
beq $t1, 32, next_w
sll $t2, $t2, 1
j loop_w
next_w:
sw $t7, 0($a3)
addi $t0, $t0, 1
addi $a0, $a0, 4
addi $a1, $a1, 4
addi $a3, $a3, 4
bne $t0, $a2, loop_v
jr $ra
.end calcolaDistanzaH
