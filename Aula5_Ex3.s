#Faça um programa, em assembly do mips, que receba um valor inteiro do teclado, 
#se esse valor for igual a 10 imprima-o na tela e saia do programa. 
#Senão imprima 0 e saia do programa.

.data
    n1: .asciiz "Digite um valor: "
    n2: .asciiz "\n Digite mais um valor: "

.text
    main:
        #printf
        la $a0, n1
        li $v0, 4
        syscall

        #scanf
        li $v0, 5
        syscall
        move $t0, $v0

        #printf
        la $a0, n2
        li $v0, 4
        syscall
        
        #scanf
        li $v0, 5
        syscall
        move $t1, $v0

        slt $s0, $t0, $t1               #comparacao (se t0 for maior que t1, ele guarda em s0)
        bne $s0, $zero, t1_maior        #se s0 for diferente de 0, pula pro t1_maior
        beq $t0, $t1, igual             #se t0 e t1 for igual, pula pra variavel igual

    t0_maior:
        #Printar caso o t0 seja maior
        move $a0, $t0                   
        li $v0, 1
        syscall

        j sair

    #Printar caso o t1 seja maior
    t1_maior:
        move $a0, $t1
        li $v0, 1
        syscall

        j sair

    #Printar caso t0 e t1 sejam iguais
    igual:
        li $a0, -111
        li $v0, 1
        syscall

    sair:
        li $v0, 10
        syscall
