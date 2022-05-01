.data
risultato: .space 4
g: .byte 255
h: .byte 255
m: .byte 255

.text
.globl main
.ent main
main:
lbu $t0, g
lbu $t1, h
lbu $t2, m
li $t3, 60
li $t4, 24
# g -> m
multu $t0, $t4
mflo $t0
multu $t0, $t3
mflo $t0
# h -> m
multu $t1, $t3
mflo $t1
# calcolo risultato
add $s0, $0, $t0
add $s0, $s0, $t1
add $s0, $s0, $t2
sw  $s0, risultato

li $v0, 10
syscall
.end main
