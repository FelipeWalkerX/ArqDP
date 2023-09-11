.data

.text

#funcao:
soma:                           # posso colocar no topo ou no final do codigo como se fosse uma funcao
    addi $sp, $sp, -16          # sp = sp - 16 (colocar o valor de sp a 16 bytes apos o comeco da pilha)
    sw $ra, 12($sp)             # salvando o valor de ra em 12
    sw $a0, 8($sp)              # salvando o valor de a0 em 8   (usado a0 e a1 pois tanto faz o que eu usar)
    sw $a1, 4($sp)              # registrador 'a' nao precisa salvar e restaurar, so os registradores 't' e 's'!!!
    sw $t2, 0($sp)              # salvando o valor de t2 em 0


    add $t2, $a0, $a1           # efetuando a soma de a0 + a1 e armazenando em t2 (t2 = a0 + a1)
    add $v1, $t2, $zero         # salvando o resultado da soma em v1 (somente salvar no registrador 'v' neste caso) (so usar o v1 quando o v0 estiver ocupado)

    lw $ra, 12($sp)             #carregando o valor de ra em 12
    lw $a0, 8($sp)
    lw $a1, 4($sp)
    lw $t2, 0($sp)              #salvando o valor de t2 em 0
    
    addi $sp, $sp, 16           #voltando o sp para o topo da pilha (16 bytes acima de onde ele esta)

    jr $ra                      #voltando para o registrador abaixo do jal

#funcao main:
main:

    #printf:
    li $v0, 5                   
    syscall
    move $a0, $v0

    #printf:
    li $v0, 5
    syscall
    move $a1, $v0

    #chamar funcao
    jal soma

    li $v0, 1                   #chamada para printar inteiro
    move $a0, $v1               #mover o resultado feito na funcao para printar
    syscall

    #sair
    li $v0, 10
    syscall
