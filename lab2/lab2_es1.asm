.data
str0: .asciiz "Inserire intero positivo: "
str1: .asciiz "Il numero e' pari"
str2: .asciiz "Il numero e' dispari"
.text
.globl main
.ent main
main:
li $v0 4
la $a0, str0
syscall
li $v0, 5
syscall
addu $t0, $s0, $v0
andi $t1, $t0, 1

li $v0 4
beq    $s0, $t1, pari  # if $s0 ==  then $t1 è pari
la $a0, str2
syscall
j done

pari:
la $a0, str1
syscall

done: li $v0, 10
syscall
.end main
