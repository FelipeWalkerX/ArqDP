#Faça um programa, em assembly do mips, que receba um valor inteiro do teclado, 
#se esse valor for igual a 10 imprima-o na tela e saia do programa. 
#Senão imprima 0 e saia do programa.

.data
    n1: .asciiz "Digite um valor: "
    pf: .asciiz "\n"

.text
    main:

        li $t1, 10
        li $t2, 0

        #printf:
        la $a0, n1 
        li $v0, 4
        syscall

        #scanf:
        li $v0, 5
        syscall
        move $t0, $v0

        bne $t0, $t1, else

    if: 
        la $a0, pf
        li $v0, 4
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        j sair

    else:
        la $a0, pf
        li $v0, 4
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

    sair:

        li $v0, 10
        syscall

        

