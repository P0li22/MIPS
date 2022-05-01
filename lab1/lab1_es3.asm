.data
op1: .byte 150
op2: .byte 100

.text
.globl main
.ent main
main:
lbu $t0, op1 # valore max rappresentabile su 8 bit: se unsigned -> 255, se con segno -> 127
lb $t1, op2
li $v0, 1
add $a0, $t0, $t1
syscall
li $v0 10
syscall
.end main
