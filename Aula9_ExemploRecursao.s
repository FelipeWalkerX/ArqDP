.data

.text

fat:

    addi $sp, $sp, -12      # É menos pois a pilha cresce para baixo

    sw $ra, 12($sp)         # nao pode esquecer de salvar o ra, ele quem vai garantir de eu voltar para o codigo
    sw $s0, 8($sp)
    sw $a0, 4($sp)          # salvo em 'a' para nao precisar passar para um 't' ou 's'

    #caso base
    beq $a0, $s0, endFat    #se o a0 for igual a 1, ele pula pra fora da funcao
    slti $t0, $a0, 1        #verificar se o valor é menor ou igual a 1
    bne $t0, $zero, endFat  #Se ele nao for igual a zero, quer dizer que deu certo e pula pra funcao endfat
    addi $a0, $a0, -1
    jal fat

    #volta
    lw $ra, 12($sp)         
    lw $s0, 8($sp)
    lw $a0, 4($sp)
    addi $sp, $sp, 12       #restaurando o valor de ra para fazer o calculo

    mul $v0, $v0, $a0       #calculando o fatorial do numero solicitado

endFat:

    jr $ra                  #neste momento, ele vai voltar pro ra de fat, pois foi o ultimo sp colocado foi na funcao fat

main:

    li $v0, 1               # v0 guarda o retorno de chamada de sistema (%v0 é o return em assembly)
    li $a0, 5               # Armazenado o valor que queremos descobrir o fatorial
    li $s0, 1               # s0 foi usado apenas para comparar se o fatorial chegou em 1
    jal fat

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall
