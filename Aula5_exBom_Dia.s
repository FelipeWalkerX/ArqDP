.data
    texto: .asciiz "Bom dia\n"

.text
    main:
        li $s3, 0               #i (contador)
        li $s4, 'd'             #constante
        la $s5, texto

    while:
        #Nao usa o mul ou o sll pois cada caracter tem apenas 1 byte e nao 4 como um numero
        add $t0, $s5, $s3
        lb $t1, 0($t0)          #lw (Load word) carrega 4 bytes, ja o lb (load byte) carrega apenas 1 byte
        beq $t1, $s4, sair
        addi $s3, $s3, 1

        j while

    sair:
        li $v0, 1
        move $a0, $s3
        syscall

        li $v0, 10
        syscall
