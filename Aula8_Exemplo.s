.data

.text

main:
    li $v0, 5
    syscall
    move $t0, $v0
    jal soma            #t0 = pc + 4


    soma:
        addi $sp, $sp, 8    #sp = sp - 8 (colocar o valor de sp a 8 bytes apos o comeco da pilha)
        sw $t0, 8($sp)      #salvando o valor de t0 no valor de sp + 8 da pilha
        sw $t1, 4($sp)      #salvando o valor de t1 no valor de sp + 4 da pilha
        
        li $t1, 10          #carregar o valor 10 para o t1
        add $v0, $a0, $t1

        lw $t0, 8($sp)      #carregar o valor de t0
        lw $t1, 4($sp)      #carregar o valor de t1

        addi $sp, $sp, 8    #voltar o sp para o topo da pilha (8 bytes acima de onde ele esta)

        jr $t0              #diferenca entre o j (jump) e o jr (jump register) é que o jump volta para uma label (main, por exemplo)
                            #ja o jr, voce volta para um registrador abaixo do mencionado ($t0, por exemplo)
    sair:
    li $v0, 10
    syscall

    Exemplo usado para fazer esse codigo:
    
    int vol;

int main(){

    scanf("%d", vol);
    ret: soma10 (vol);

    Return 0;
}

int soma10(int vol){
    Return(vol + 10);
}


Obs.:
* A pilha cresce pra baixo
* sp: valor da pilha
* Diminui o valor de sp para crescer a pilha
