#Faça um programa, em assembly do MIPS, que receba e multiplique dois inteiros sem usar a instrução de multiplicação do MIPS. Imprima o resultado na tela.

.data
    n1: .asciiz "Digite um numero: "
    n2: .asciiz "Digite outro numero: "
    pl: .asciiz "\n"

.text
    main:

        li $t2, 0

        li $v0, 4
        la $a0, n1
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        li $v0, 4
        la $a0, pl
        syscall

        li $v0, 4
        la $a0, n2
        syscall

        li $v0, 5
        syscall
        move $t1, $v0

        #mul $t2, $t0, $t1
        while:

            add $t2, $t2, $t0

            slt $s0, $t2, $t1
            bne $s0, $zero, sair

            j while


        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 10
        syscall
