.data
mat: .word 154, 123, 109, 86, 4, 0
     .word 412, -23, -231, 9, 50, 0
     .word 123, -24, 12, 55, -45, 0
     .word 0, 0, 0, 0, 0, 0
nRows: .byte 5
nColumns: .byte 3

.text
.globl main
.ent main
main:
la $s0, mat
add $t0, $0, $0 # somma riga/colonna
add $t1, $0, $0 # contatore cicli
lw $t2, nRows

rows:
lw $t3, $s0 # valore corrente
add $t0, $t0, $t3
add $s0, $s0, 4 # aggiorna indirizzo
addi $t1, $t1, 1 # aggiorna contatore
bne $t1, $t2, rows

lw $t2, nColumns
la $s0, mat
add $t0, $0, $0
add $t1, $0, $0

columns:
lw $t3, $s0
