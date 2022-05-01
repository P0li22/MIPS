.data
ch1: .ascii "\n"
ch2: .ascii "0"
ch3: .ascii "9"
str1: .asciiz "\ninserire cifra (partendo dalle unita'):\n"
str2: .asciiz "\nil carattere inserito non e' una cifra\n"
str3: .asciiz "\nil valore inserito e':\n"
str4: .asciiz "\noverflow"

.text
.globl main
.ent main
main:
lb $s0, ch1
lb $s1, ch2
lb $s2, ch3
add $s3, $0, $0 # contiene il valore finale inserito dall'utente
addi $s4, $0, 10 # valore da usare per ottenere prossima potenza di 10
addi $s5, $0, 1 # salva le potenze di 10 per calcolare la posizione della cifra inserita


while:
li $v0, 4
la $a0, str1
syscall
li $v0, 12
syscall
move $t0, $v0
beq $t0, $s0, exit
blt $t0, $s1, notInt # questa e la successiva controllano che il valore inserito sia un carattere
bgt $t0, $s2, notInt
sub $t0, $t0, $s1 # conversione da char ad int
multu $t0, $s5 # mette la cifra nella posizione corretta
mfhi $t2
bne $t2, 0, overflow # hi != 0 => valore ottenuto dalla moltiplicazione non rappresentabile su 32 bit
mflo $t0
addu $t1, $s3, $0 # salva valore di $s3 prima di aggiornarlo per poter controllare overflow
addu $s3, $s3, $t0
bltu $s3, $t1, overflow
multu $s5, $s4 # calcola la successiva posizione
mfhi $t2
mflo $s5
beq $t2, $0, while # hi != 0 => la prossima potenza di 10 non è rappresentabile su 32 bit, quindi esco altrimenti avrei overflow alla prossima iterazione

exit:
li $v0, 4
la $a0, str3
syscall
li $v0, 1
move $a0, $s3
syscall
j quit

notInt:
li $v0, 4
la $a0, str2
syscall
j while

overflow:
li $v0, 4
la $a0, str4
syscall
j quit

quit:
li $v0, 10
syscall
.end main
