.data
mat: .word 154, 123, 109, 86, 4, 0
     .word 412, -23, -231, 9, 50, 0
     .word 123, -24, 12, 55, -45, 0
     .word 0, 0, 0, 0, 0, 0
nRows: .byte 3
nColumns: .byte 5

.text
.globl main
.ent main
main:
la $s0, mat
add $t0, $0, $0 # somma riga/colonna
add $t1, $0, $0 # contatore colonne
add $t4, $0, $0 # contatore righe
add $s1, $0, $0 # salva il valore da mettere nell'ultima posizione
lb $t2, nRows
lb $t5, nColumns

rows:
row:
lw $t3, 0($s0) # valore corrente
add $t0, $t0, $t3
addi $s0, $s0, 4 # aggiorna indirizzo
addi $t1, $t1, 1 # aggiorna contatore colonna
bne $t1, $t5, row

sw $t0, 0($s0)
add $s1, $s1, $t0
addi $s0, $s0, 4
add $t0, $0, $0
add $t1, $0, $0
addi $t4, $t4, 1 # aggiorna contatore riga
bne $t4, $t2, rows

la $s0, mat
add $t4, $0, $0

columns:
column:
lw $t3, 0($s0)
add $t0, $t0, $t3
mul $t6, $t5, 4
add $s0, $s0, $t6
addi $s0, $s0, 4 # salta alla riga successiva
addi $t4, $t4, 1 # salta la cella che contiene la somma della riga
bne $t4, $t2, column

sw $t0, 0($s0)
add $s1, $s1, $t0
add $t0, $0, $0
add $t4, $0, $0
add $t1, $t1, 1
mul $t6, $t1, 4
la $s0, mat
add $s0, $s0, $t6
bne $t1, $t5, columns

# salva la somma dell'ultima riga e dell'ultima colonna, calcolate con i
# cicli precedenti, nell'ultima cella della matrice
# indirizzo ultima parola =
# (indirizzo mat) + 4 * ((nRows) * (nColumns + 1) + nColumns)
la $s0, mat
addi $t6, $t5, 1
mul $t6, $t6, $t2
add $t6, $t6, $t5
mul $t6, $t6, 4
add $s0, $s0, $t6
sw $s1, 0($s0)

quit:
li $v0, 10
syscall
