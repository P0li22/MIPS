RIGHE = 4
COLONNE = 5
.data
matrice: .byte 0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62
.text
.globl main
.ent main
main:
la $a0, matrice
li $a1, 19
li $a2, RIGHE
li $a3, COLONNE
jal contaVicini
add $a0, $v0, $0
li $v0, 1
syscall
li $v0, 10
syscall
.end main

.ent contaVicini
contaVicini:
div $a1, $a3
mfhi $t0 # colonna
sub $t1, $a1, $t0
div $t1, $t1, $a3 # riga
add $t2, $0, $0 # contatore riga
addi $t1, $t1, -1 # si parte da r-1
add $v0, $0, $0
loop_r:
blt $t1, $0, next_r
bge $t1, $a2, next_r
add $t3, $0, $0 # contatore colonna
addi $t4, $t0, -1 # si parte da c-1
loop_c:
blt $t4, $0, next_c
bge $t4, $a3, next_c
mul $t5, $t1, $a3
add $t5, $t5, $t4
add $t5, $t5, $a0
lb $t5, 0($t5)
add $v0, $v0, $t5
next_c:
addi $t3, $t3, 1
add $t4, $t4, 1
bne $t3, 3, loop_c
next_r:
addi $t2, $t2, 1
addi $t1, $t1, 1
bne $t2, 3, loop_r
add $t0, $a0, $a1
lb $t0, 0($t0)
sub $v0, $v0, $t0
jr $ra
.end contaVicini
