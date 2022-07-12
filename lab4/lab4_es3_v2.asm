.data
x: .word 1, 2, 3, 4
y: .word 5, 6, 7, 8
mat: .space 64
str1: .asciiz "Overflow"

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
mult $t3, $t4
mflo $s3
mfhi $t5
bne $t5, $0, overflow
# salva in mat, in posizione (i, j)
sw $s3, 0($s2)
addi $s2, $s2, 4
#aggiorna contatori e indirizzi
addi $t2, $t2, 1
addi $s1, $s1, 4
bne $t2, 4, loop2

add $t2, $0, $0
la $s1, y
addi $t1, $t1, 1
addi $s0, $s0, 4
bne $t1, 4, loop1
j done

overflow:
li $v0, 4
la $a0, str1
syscall
j done

done:
li $v0, 10
syscall
.end main
