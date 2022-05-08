.data
opa: .word 2043
opb: .word 5
tab: .word somma, sottr, molt, divv
str1: .asciiz "inserire valore (0 -> somma, 1 -> sottrazione,
               2 -> moltiplicazione, 3 -> divisione):\n"
str2: .asciiz "\nres = "
str3: .asciiz "\nInput non valido\n"

.text
.globl main
.ent main
main:
lw $t0, opa
lw $t1, opb
la $t2, tab
li $v0, 4
la $a0, str1
syscall
li $v0, 5
syscall
addu $t3, $v0, $0 # prendo il valore inserito come unsigned e poi controllo che sia minore di 4
bgt $t3, 4, notValid
mul $t3, $t3, 4
add $t2, $t2, $t3
lw $t4, 0($t2)
jr $t4

somma:
add $s0, $t0, $t1
j done

sottr:
sub $s0, $t0, $t1
j done

molt:
mul $s0, $t0, $t1
j done

divv:
div $s0, $t0, $t1
j done

notValid:
li $v0, 4
la $a0, str3
syscall
j quit

done:
li $v0, 4
la $a0, str2
syscall
li $v0, 1
move $a0, $s0
syscall
quit:
li $v0, 10
syscall
