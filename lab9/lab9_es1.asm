.data
DIM: .word 3
mat1: .word 4, -45, 15565
      .word 6458, 4531, 124
      .word -548, 2124, 31000
mat2: .word 6, -5421, -547
      .word 6458, 4531, 1456
      .word 4592, 118, 31999
v: .space 12
I: .word 2
.text
.globl main
.ent main
main:
la $a0, mat1
la $a1, mat2
la $a2, v
lw $a3, DIM
lw $t0, I
add $sp, $sp, -4
sw $t0, 0($sp)
jal variazione
add $sp, $sp, 4
li $v0, 10
syscall
.end main

.ent variazione
variazione:
# indice = DIM * riga + colonna
add $t0, $0, $0 # contatore
lw $t1, 0($sp)
mul $t6, $a3, 4
# parto da [I, 0]
mul $t2, $t1, $a3
mul $t2, $t2, 4
add $t2, $t2, $a0
# parto da [0, I]
add $t3, $t1, $0
mul $t3, $t3, 4
add $t3, $t3, $a1
loop:
lw $t4, 0($t2)
lw $t5, 0($t3)
sub $t5, $t5, $t4
mul $t5, $t5, 100
div $t5, $t5, $t4
mul $t4, $t0, 4
add $t4, $t4, $a2
sw $t5, 0($t4)
addi $t0, $t0, 1
add $t2, $t2, 4 # colonna successiva
add $t3, $t3, $t6
bne $t0, $a3, loop
jr $ra
.end variazione
