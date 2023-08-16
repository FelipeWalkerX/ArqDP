#Exemplo de soma com numeros digitados

.data

.text

main:

    li $v0, 5               #solicitar um numero ao usuario (5 = usuario precisa digitar um numero para o programa dar continuidade)
    syscall                 #armazenar e sair
    move $t0, $v0           #mover do v0 pro t0 (nao tem como somar com o v0)

    li $v0, 5               #solicitar um numero ao usuario
    syscall                 #armazenar e sair
    move $t1, $v0           #mover do v0 pro t1

    add $t2, $t0, $t1       #somar os numeros digitados

    li $v0, 1               #imprimir inteiro (1 = inteiro) 
    move $a0, $t2           #mover o resultado dos numeros digitados para a0
    syscall                 #chamada de sistema

    li $v0, 10              #imprimir a saida de sistema
    syscall                 #sair do programa

