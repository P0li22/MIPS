.data
str1: .asciiz "\nnon palindromo"
str2: .asciiz "\npalindromo"
str3: .asciiz "\ninserire carattere\n"
str4: .asciiz "\nnessun carattere inserito\n"
.text
.globl main
.ent main
main:
add $s0, $sp, $0 # salva posizione iniziale stack pointer
addi $t0, $sp, -4 # salva posizione del primo carattere
add $t3, $0, $0 # contatore caratteri
loop1:
li $v0, 4
la $a0, str3
syscall
li $v0, 12
syscall
beq $v0, '\n', done
addi $sp, $sp, -4
addi $t3, $t3, 1
sw $v0, 0($sp)
j loop1

done:
beq $t3, 0, noStr

loop2:
lw $t1, 0($t0)
lw $t2, 0($sp)
bne $t1, $t2, notP
addi $t0, $t0, -4
addi $sp, $sp, 4
blt $sp, $t0, loop2

li $v0, 4
la $a0, str2
syscall
j end

notP:
li $v0, 4
la $a0, str1
syscall
j end

noStr:
li $v0, 4
la $a0, str4
syscall

end:
add $sp, $s0, $0 # ripristina stack
li $v0, 10
syscall
