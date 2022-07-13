.data
X: .byte 1
Y: .byte 40
ora_ingresso: .byte 12, 00
ora_uscita: .byte 13, 21
.text
.globl main
.ent main
main:
la $a0, ora_ingresso
la $a1, ora_uscita
lb $a2, X
lb $a3, Y
jal costoParcheggio
add $a0, $v0, $0
li $v0, 1
syscall
li $v0, 10
syscall
.end main

.ent costoParcheggio
costoParcheggio:
lb $t0, 0($a0)
lb $t1, 1($a0)
mul $t0, $t0, 60
add $t0, $t0, $t1
lb $t1, 0($a1)
lb $t2, 1($a1)
mul $t1, $t1, 60
add $t1, $t1, $t2
sub $v0, $t1, $t0
div $v0, $v0, $a3
mfhi $t0
beq $t0, $0, noResto
mul $v0, $v0, $a2
add $v0, $v0, $a2
jr $ra
noResto:
mul $v0, $v0, $a2
jr $ra
.end costoParcheggio
