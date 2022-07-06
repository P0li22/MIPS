.data
n: .word 12
k: .word 2
.text
.globl main
.ent main
main:
lw $a0, n
lw $a1, k
jal combina
add $a0, $v0, $0
li $v0, 1
syscall
li $v0, 10
syscall

combina:
addi $t0, $0, 1 # calcola numeratore
addi $t1, $0, 1 # calcola denominatore
sub $t2, $a0, $a1 # n - k

numeratore:
mul $t0, $t0, $a0
addi $a0, $a0, -1
bne $a0, $t2, numeratore

denominatore:
mul $t1, $t1, $a1
addi $a1, $a1, -1
bne $a1, 0, denominatore

div $v0, $t0, $t1
jr $ra
