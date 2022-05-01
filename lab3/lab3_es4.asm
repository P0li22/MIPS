.data
DIM: .word 4
str1: .asciiz "\ninserire intero:\n"
str2: .asciiz "\nla media (int) e': "

.text
.globl main
.ent main
main:
lw $t0, DIM
add $t1, $0, $0 # contatore
add $s0, $0, $0
loop:
li $v0, 4
la $a0, str1
syscall
li $v0, 5
syscall
move $t2, $v0
add $s0, $s0, $t2
addi $t1, $t1, 1
bne $t1, $t0, loop

div $s0, $s0, $t1
li $v0, 4
la $a0, str2
syscall
li $v0, 1
add $a0, $s0, $0
syscall
li $v0, 10
syscall
.end main
