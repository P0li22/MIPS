.data
str1: .asciiz "ha soluzioni reali"
str2: .asciiz "non ha soluzioni reali"
str3: .asciiz "inserire a:\n"
str4: .asciiz "\ninserire b:\n"
str5: .asciiz "\ninserire c:\n"
str6: .asciiz "\nl'equazione inserita è di primo grado"
.text
.globl main
.ent main
main:
li $v0, 4
la $a0, str3
syscall

li $v0, 5 # a
syscall
move $t0, $v0

li $v0, 4
la $a0, str4
syscall

li $v0, 5 # b
syscall
move $t1, $v0

li $v0, 4
la $a0, str5
syscall

li $v0, 5 # c
syscall
move $t2, $v0

beq $t0, 0, primoGrado

mul $t1, $t1, $t1 # b^2
mul $t0, $t0, $t2 # a * c
mul $t0, $t0, 4 # 4 * a * c
sub $s0, $t1, $t0
bge $s0, $0, sol_in_R

li $v0, 4
la $a0, str2
syscall
j end

sol_in_R:
li $v0, 4
la $a0, str1
syscall
j end

primoGrado:
li $v0, 4
la $a0, str6
syscall

end:
li $v0, 10
syscall
.end main
