.data
str0: .asciiz "Inserire intero positivo 1: "
str1: .asciiz "Inserire intero positivo 2: "
err: .asciiz "Errore"
maxByte: .byte 0xFF

.text
.globl main
.ent main
main:
lbu    $t0, maxByte # se i valori acquisiti sono maggiori di questo allora non sono rappresentabili su un maxByte

# in alternativa si può anche salvare un valore con tutti uno tranne gli ultimi
# 8 bit (che sono zero) e poi fare una and con il valore da verificare: se il
# risultato di questa and è zero allora il valore è rappresentabile su un byte

# A
li $v0 4
la $a0, str0
syscall
li    $v0,  5
syscall
move   $s0, $v0
bgtu    $s0, $t0, KO  # if $s0 > $t0 then err

# B
li $v0 4
la $a0, str1
syscall
li    $v0,  5
syscall
move   $s1, $v0
bgtu    $s1, $t0, KO  # if $t2 > $t0 then err

# C = NOT(A AND (NOT(B))) OR (A XOR B)
nor $t1, $s0, $0
or $t1, $t1, $s1
xor $t2, $s0, $s1
or $s3, $t1, $t2
j OK

KO: li $v0 4
la $a0, err
syscall

OK: li $v0 10
syscall
.end main
