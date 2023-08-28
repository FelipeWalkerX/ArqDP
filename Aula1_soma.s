.data

.text

main:

li $t0, 5               #load immediate
li $t1, 10
add $t2, $t0, $t1       #t2 = 5 + 10

li $v0, 1               #imprimir inteiro (1 = inteiro) (v0 =  feito para "dar sentido" aos codigos, geralmente vem acompanhado dos codigos de 1 a 10)
move $a0, $t2           #mover o resultado (t2 = 15) para o a0
syscall                 #chamada de sistema (dizer ao hardware que encerrei essa parte do codigo)

li $v0, 10              #imprimir a saida de sistema (10 = sair do programa)
syscall                 #encerrar programa
