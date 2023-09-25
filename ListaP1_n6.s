#Faça um programa, em assembly do mips, que receba um valor inteiro do teclado, se esse valor for igual a 10 imprima-o na tela e saia do programa. 
#Senão imprima 0 e saia do programa.

.data
    n1: .asciiz "Digite um numero: "

.text

main:

li $t1, 10

#printf
li $v0, 4
la $a0, n1
syscall

#scanf
li $v0, 5
syscall
move $t0, $v0

    if:
        bne $t0, $t1, else

        li $v0, 1
        move $a0, $t0
        syscall

        j sair

    else:
        li $v0, 1
        move $a0, $zero
        syscall

sair:
    li $v0, 10
    syscall
