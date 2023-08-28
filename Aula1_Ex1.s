#Faça o registrador $t0 e $t1 receberem os valores 15, e 30 respectivamente. E então faça um programa para somar $t0 e $1, jogando o resultado da soma em $t3.

.data

.text

main:

    li $t0, 15                  #load immediate
    li $t1, 30

    add $t3, $t0, $t1           #t3 = 5 + 10

    li $v0, 1                   #imprimir inteiro
    move $a0, $t3               #mover o resultado
    syscall                     #chamada de sistema

    li $v0, 10                  #imprimir a saida de sistema
    syscall                     #encerrar programa
