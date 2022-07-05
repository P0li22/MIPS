.data
c: .asciiz "*"
newline: .asciiz "\n"
lato: .byte 8
.text
.globl main
.ent main
main:
addi $t0, $0, 1
lb $t1, lato
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
