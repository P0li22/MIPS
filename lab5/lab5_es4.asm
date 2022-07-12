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
addi $a0, $0, 2 # matrice diagonale => restituisco 2

loop_r1:
add $t3, $0, $0 # contatore colonne
loop_c1:
beq $t2, $t3, next_c1 # ignoro elementi della diagonale principale
# elemento [i, j]
mult $t1, $t2
mflo $t4
add $t4, $t4, $t3
mul $t4, $t4, 4 # ogni passo è di 4 byte
add $t4, $t4, $t0 # l'elemento [i, j] ha indirizzo = mat + 4(DIM * i + j)
lw $t4, 0($t4)
# l'elemento [i, j] con i != j deve essere = 0
beq $t4, 0, eqZero
addi $a0, $0, 1 # matrice simmetrica ma non diagonale => restituisco 1
eqZero:
# elemento [j, i]
mult $t1, $t3
mflo $t5
add $t5, $t5, $t2
mul $t5, $t5, 4 # ogni passo è di 4 byte
add $t5, $t5, $t0 # l'elemento [j, i] ha indirizzo = mat + 4(DIM * j + i)
lw $t5, 0($t5)
# l'elemento [i, j] con i != j deve essere = all'elemento [j, i]
bne $t4, $t5, not_simm

next_c1:
add $t3, $t3, 1
blt $t3, $t1, loop_c1
next_r1:
add $t2, $t2, 1
blt $t2, $t1, loop_r1

j end

not_simm:
add $a0, $0, $0 # matrice non simmetrica => restituisco 0

end:
li $v0, 1
syscall
li $v0, 10
syscall
.end main
