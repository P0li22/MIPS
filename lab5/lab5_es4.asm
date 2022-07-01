.data
DIM: .word 4
mat: .word 1, 0, 0, 0
     .word 0, 1, 0, 0
     .word 0, 0, 1, 0
     .word 0, 0, 0, 1
.text
.globl main
.ent main
main:
la $t0, mat
lw $t1, DIM
add $t2, $0, $0 # contatore righe

loop_r1:
add $t3, $0, $0 # contatore colonne
loop_c1:
beq $t1, $t2, next
mult $t1, $t2
mflo $t4
add $t4, $t4, $t3
mul $t4, $t4, 4 # ogni passo è di 4 byte
add $t4, $t4, $t0 # l'elemento [i, j] ha indirizzo = mat + 4(DIM * i + j)
lw $t5, 0($t4)
bne $t5, 0, not_diag
next_c1:
add $t3, $t3, 1
blt $t3, $t1, loop_c1
next_r1:
add $t2, $t2, 1
blt $t2, $t1, loop_r1

addi $s0, $0, 2
j end

not_diag:
