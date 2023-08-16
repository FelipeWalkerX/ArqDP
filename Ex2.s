#Faça o registrador $t0 e $t1 receberem os valores 10, e 20 respectivamente. E então faça um programa para resolver a seguinte expressão:

#  $t3 = ($t0 + 4) - ($t1 - 6)

.data

.text

main:

    li $t0, 10
    li $t1, 20

    add $t0, $t0, 4
    sub $t1, $t1, 6             

    sub $t3, $t0, $t1           #subtrair t0 por t1 (sub = subtracao)

    li $v0, 1                   #imprimir inteiro
    move $a0, $t3               #mover o resultado
    syscall                     #chamada de sistema

    li $v0, 10                  #imprimir a saida de sistema
    syscall     