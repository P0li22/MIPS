.data
len: .byte 5
arrotondamento: .byte 1
sconto: .byte 30
prezzi: .word 39, 1880, 2394, 1000, 1590
prezzi_scontati: .space 20
.text
.globl main
.ent main
main:
lb $t0, arrotondamento
lb $a0, len
la $a1, prezzi
la $a2, prezzi_scontati
lb $a3, sconto
addi $sp, $sp, -4
sw $t0, 0($sp)
jal calcola_sconto
lw $t0, 0($sp)
addi $sp, $sp, 4
add $a0, $v0, $0
li $v0, 1
syscall
li $v0, 10
syscall
.end main

.ent calcola_sconto
calcola_sconto:
lw $t0, 0($sp)
add $t1, $0, $0
add $v0, $0, $0
loop:
lw $t2, 0($a1)
mul $t3, $t2, $a3
div $t3, $t3, 100
mfhi $t4
beq $t4, $0, end_if
beq $t0, $0, arr_0
bgt $t4, 50, arr_0
j end_if
arr_0:
add $t3, $t3, 1
end_if:
add $v0, $v0, $t3
sub $t3, $t2, $t3
sw $t3, 0($a2)
addi $t1, $t1, 1
addi $a1, $a1, 4
addi $a2, $a2, 4
bne $t1, $a0, loop
j $ra
.end calcola_sconto
