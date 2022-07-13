.data
v: .word 1888, 1956, 1960, 2001, 2004, 2016, 2017
len: .byte 7
res: .space 7
.text
.globl main
.ent main
main:
la $a0, v
la $a1, res
lb $a2, len
jal bisestile
li $v0, 10
syscall
.end main

.ent bisestile
bisestile:
add $t0, $0, $0
addi $t3, $0, 1
loop:
lw $t1, 0($a0)
addi $t4, $0, 100
div $t1, $t4
mfhi $t2
bne $t2, 0, no100
addi $t4, $0, 400
div $t1, $t4
mfhi $t2
bne $t2, 0, no400
sb $t3, 0($a1)
j next
no400:
sb $0, 0($a1)
j next
no100:
addi $t4, $0, 4
div $t1, $t4
mfhi $t2
bne $t2, 0, no4
sb $t3, 0($a1)
j next
no4:
sb $0, 0($a1)
next:
addi $a0, $a0, 4
addi $a1, $a1, 1
addi $t0, $t0, 1
bne $t0, 7, loop
j $ra
.end bisestile
