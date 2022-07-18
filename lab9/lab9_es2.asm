.data
str_orig: .asciiz "% nella citta' dolente, % nell'eterno dolore, % tra la
perduta gente"
str_sost: .asciiz "per me si va"
str_new: .space 200
.text
.globl main
.ent main
main:
la $a0, str_orig
la $a1, str_sost
la $a2, str_new
jal sostituisci
la $a0, str_new
li $v0, 4
syscall
li $v0, 10
syscall
.end main

.ent sostituisci
sostituisci:
loop_str_orig:
lb $t0, 0($a0)
beq $t0, $0, quit
bne $t0, '%', no_sost
add $t1, $a1, $0
loop_str_sost:
lb $t2, 0($t1)
beq $t2, $0, next
sb $t2, 0($a2)
add $a2, $a2, 1
add $t1, $t1, 1
j loop_str_sost
no_sost:
sb $t0, 0($a2)
add $a2, $a2, 1
next:
add $a0, $a0, 1
j loop_str_orig
quit:
jr $ra
.end sostituisci
