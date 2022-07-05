.data
str: .asciiz "parola"
.text
.globl main
.ent main
main:
la $t0, str
loop:
lb $a0, 0($t0)
beq $a0, "\0", quit
addi $sp, $sp, -4
sw $t0, 0($sp)
jal caps
lw $t0, 0($sp)
addi $sp, $sp, 4
sb $v0, 0($t0)
addi $t0, $t0, 1
j loop

quit:
li $v0, 4
la $a0, str
syscall
li $v0, 10
syscall

caps:
