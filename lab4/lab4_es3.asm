.data
x: .word 1, 2, 3, 4
y: .word 5, 6, 7, 8
mat: .space 16
     .space 16
     .space 16
     .space 16

.text
.globl main
.ent main
main:
la $s0, x
la $s1, y
la $s2, mat
add $t1, $0, $0 # i
add $t2, $0, $0 # j

loop1:
# xi
lw $t3, 0($s0)
loop2:
# yj
lw $t4, 0($s1)
# calcola prodotto xi * yj
mul $s3, $t3, $t4
# salva in mat, in posizione 4 * i + j
mul $t5, $t1, 16
add $t6, $t5, $0
mul $t5, $t2, 4
add $t6, $t6, $t5
add $t6, $s2, $t6
sw $s3, 0($t6)
#aggiorna contatori e indirizzi
addi $t2, $t2, 1
addi $s1, $s1, 4
bne $t2, 4, loop2

add $t2, $0, $0
la $s1, y
addi $t1, $t1, 1
addi $s0, $s0, 4
bne $t1, 4, loop1

li $v0, 10
syscall
