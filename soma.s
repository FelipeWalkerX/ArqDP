.data

.text

main:

li $t0, 5               #load immediate
li $t1, 10
add $t2, $t0, $t1       #t2 = 5 + 10

li $v0, 1
add $a0, $zero, $t2
syscall

li $v0, 10
syscall