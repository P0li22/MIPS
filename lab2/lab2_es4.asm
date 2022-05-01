.data
x: .half 980

.text
.globl main
.ent main
main:
lh $s0, x
add $s1, $0, $0 # conta il numero di bit = 1
add $s2, $0, $0 # contatore per sapere quando uscire dal ciclo
addi $s3, $0, 1 # maschera / confronto
addi $s4, $0, 16 # numero max iterazioni

while:
beq $s2, $s4, done
and $t0, $s0, $s3
bne $t0, $s3, skip
addi $s1, $s1, 1
skip:
sll $s3, $s3, 1
addi $s2, $s2, 1
j while

done:
li $v0, 1
move $a0, $s1
syscall
li $v0, 10
syscall
.end main
