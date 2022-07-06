.data
array: .word 1, 2, 3, 3, 2, 1
DIM: .word 6
.text
.globl main
.ent main
main:
la $a0, array
lw $a1, DIM
jal max
add $a0, $v0, $0
li $v0, 1
syscall
li $v0, 10
syscall

max:
addi $t0, $0, 1 # contatore
lw $v0, 0($a0) # salva il max
addi $a0, $a0, 4
loop:
lw $t1, 0($a0) # valore corrente
ble $t1, $v0, next
add $v0, $t1, $0
next:
addi $a0, $a0, 4
addi $t0, $t0, 1
bne $t0, $a1, loop
jr $ra
