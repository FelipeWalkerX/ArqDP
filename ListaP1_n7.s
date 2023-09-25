#Faça um programa, em assembly do mips, que receba dois inteiros do teclado, e imprima o maior. Se os números forem iguais imprima -111.

.data
    n1: .asciiz "Digite um numero:"
    pl: .asciiz "\n"
    n2: .asciiz "Digite mais um numero:"

.text
    main:
    li $t2, -111

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

    li $v0 5
    syscall
    move $t1, $v0

    slt $s0, $t0, $t1                   #slt so guarda se é true ou false na variavel s (guarda 1 se true e 0 se false)
    bne $s0, $zero, n2Maior             #ele vai ver se t0 é true ou false e comparar com 0, se true (1), ele pula para n2 maior, se false (0), ele pula pra linha de baixo (nisso, ele vai chegar ate o n1 maior sozinho)
    beq $t0, $t1, igual                 

    n1Maior:
        li $v0, 4
        la $a0, pl
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        j sair

    n2Maior:
        li $v0, 4
        la $a0, pl
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        j sair

    igual:
        li $v0, 4
        la $a0, pl
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

    sair:
        li $v0, 10
        syscall
        
