.data
c0: .word 5
.text
.globl main
.ent main
main:
lw $a0, c0
jal calcolaSuccessivo
add $a0, $v0, $0
li $v0, 1
syscall
li $v0, 10
syscall
.end main

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
