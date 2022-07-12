.data
str: .asciiz "inserire lato:"
c: .asciiz "*"
newline: .asciiz "\n"
.text
.globl main
.ent main
main:
addi $t0, $0, 1
li $v0, 4
la $a0, str
syscall
li $v0, 5
syscall
add $t1, $v0, $0
loop:
add $a0, $t0, $0
addi $sp, $sp, -8 # salvo $t0 e $t1
sw $t0, 0($sp)
sw $t1, 4($sp)
jal print
lw $t0, 0($sp) # ripristino $t0 e $t1
lw $t1, 4($sp)
addi $sp, $sp, 8
addi $t0, $t0, 1
ble $t0, $t1, loop

li $v0, 10
syscall
.end main

.ent print
print:
add $t0, $0, $0
add $t1, $a0, $0
li $v0, 11
lb $a0, c
loop_print:
syscall
addi $t0, $t0, 1
bne $t0, $t1, loop_print
lb $a0, newline
syscall
jr $ra
.end print
