.data
x1: .word 456
x2: .word 789
x3: .word 323
ch: .asciiz "\n"

.text
.globl main
.ent main
main:
lw $t0, x1
lw $t1, x2
lw $t2, x3

ble $t0, $t1, next1
add $t0, $t0, $t1
sub $t1, $t0, $t1
sub $t0, $t0, $t1

next1:
ble $t0, $t2, next2
add $t0, $t0, $t2
sub $t2, $t0, $t2
sub $t0, $t0, $t2

next2:
ble $t1, $t2, next3
add $t1, $t1, $t2
sub $t2, $t1, $t2
sub $t1, $t1, $t2

next3:
li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0, ch
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 4
la $a0, ch
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, ch
syscall

li $v0, 10
syscall
.end main
