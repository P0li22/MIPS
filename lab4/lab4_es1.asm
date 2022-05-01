.data
fib: .space 80
.text
.globl main
.ent main
main:
la $t0, fib
li $t1, 1
sw $t1, 0($t0)
addi $t0, $t0, 4
sw $t1, 0($t0)
addi $t0, $t0, 4
li $t4, 2 # contatore

loop:
lw $t1, -8($t0)
lw $t2, -4($t0)
add $t3, $t1, $t2
sw $t3, 0($t0)
addi $t0, $t0, 4
addi $t4, $t4, 1
bne $t4, 20, loop

li $v0, 10
syscall
