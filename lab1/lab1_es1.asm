.data
n1: .byte 10
n2: .byte 0x10
n3: .byte '1'
res: .space 1

.text
.globl main
.ent main

main:
and   $t0, $0, $0
and   $t1, $0, $0
and   $t2, $0, $0
lb    $t0, n1
lb    $t1, n2
lb    $t2, n3
sub   $t0, $t0, $t1
add   $s0, $t0, $t2
la    $t1, res
sb    $s0, ($t1)

li    $v0, 10
syscall
.end main
