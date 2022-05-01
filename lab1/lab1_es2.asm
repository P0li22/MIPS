.data
var1: .byte 'm'
var2: .byte 'i'
var3: .byte 'p'
var4: .byte 's'
var5: .byte 0 # si salva un valore numerico in memoria dopo i caratteri in modo
# tale che svolga il ruolo di carattere terminatore quando vado a stampare

.text
.globl main
.ent main

main:
and   $t0, $0, $0
and   $t1, $0, $0
and   $t2, $0, $0
and   $t3, $0, $0
and   $t4, $0, $0
and   $t5, $0, $0
and   $t6, $0, $0
li    $t5, 'a'
li    $t6, 'A'
lb    $t0, var1
lb    $t1, var2
lb    $t2, var3
lb    $t3, var4

# M
sub   $t0, $t0, $t5
add   $t0, $t0, $t6
sb    $t0, var1


# I
sub   $t1, $t1, $t5
add   $t1, $t1, $t6
sb    $t1, var2

# P
sub   $t2, $t2, $t5
add   $t2, $t2, $t6
sb    $t2, var3

# S
sub   $t3, $t3, $t5
add   $t3, $t3, $t6
sb    $t3, var4

li    $v0, 4
la    $a0, var1
syscall
li    $v0, 10
syscall
.end main
