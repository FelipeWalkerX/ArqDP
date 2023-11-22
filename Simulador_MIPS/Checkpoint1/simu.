#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MEMORIA 8000 //1Kb

//string para setar o registrador, memoria e o PC
typedef struct {
    int registradores[32];
    int memoria[MEMORIA];
    int pc; // Program Counter
} MIPS;

//setando o valor da memoria em cada vetor (registrador, memoria e pc)

void inicializarMIPS(MIPS *mips) {
    memset(mips->registradores, 0, sizeof(mips->registradores)); 
    memset(mips->memoria, 0, sizeof(mips->memoria));
    mips->pc = 0;   
}

//Carregando o arquivo aonde esta o codigo
void carregarProgramaDoArquivo(MIPS *mips, const char *text) {
    FILE *arquivo = fopen(text, "r");       //abrindo o arquivo
    if (arquivo == NULL) {                  //validando o arquivo
        fprintf(stderr, "Erro ao abrir o arquivo: %s\n", text);
        exit(EXIT_FAILURE);
    }

    int endereco = 0;       //sentando o endereço em 0
    char instrucao[256];      //indicando que cada linha pode ter ate 256 elementos que ele roda de boa

    while (fgets(instrucao, sizeof(instrucao), arquivo) != NULL) {      //Pegando uma linha de cada vez
        printf("Exibindo instrucao: %s \n", instrucao);        //exibe cada instrucao para ver se o codigo esta rodando certo
        if (endereco >= MEMORIA) {
            fprintf(stderr, "Memoria insuficiente para armazenar instrucoes\n");
            exit(EXIT_FAILURE);
        }
        mips->memoria[endereco++] = strtol(instrucao, NULL, 0); // Convertendo string para inteiro
    }

    fclose(arquivo);            //fechando o arquivo
}

//executando o arquivo de acordo com a instrucao (case)
void executarInstrucao(MIPS *mips, int opcode, int operando1, int operando2, int operando3) {
    switch (opcode) {
        case 0: // ADD
            mips->registradores[operando3] = mips->registradores[operando1] + mips->registradores[operando2];
            break;
        case 1: // SUB
            mips->registradores[operando3] = mips->registradores[operando1] - mips->registradores[operando2];
            break;
        case 2: // MULT
            mips->registradores[operando3] = mips->registradores[operando1] * mips->registradores[operando2];
            break;
        case 3: // DIV
            if (mips->registradores[operando2] != 0) {
                mips->registradores[operando3] = mips->registradores[operando1] / mips->registradores[operando2];
            } else {
                printf("\nnao existe essa divisao");
            }
            break;    
        case 4: // ADDI
            mips->registradores[operando2] = mips->registradores[operando1] + operando3;
            break;
        case 5: // SUBI
            mips->registradores[operando2] = mips->registradores[operando1] - operando3;
            break;
        case 6: // AND
            mips->registradores[operando3] = mips->registradores[operando1] & mips->registradores[operando2];
            break;
        case 7: // OR
            mips->registradores[operando3] = mips->registradores[operando1] | mips->registradores[operando2];
            break;
        case 8: // XOR
            mips->registradores[operando3] = mips->registradores[operando1] ^ mips->registradores[operando2];
            break;
        case 9: // NOR
            mips->registradores[operando3] = ~(mips->registradores[operando1] | mips->registradores[operando2]);
            break;
        case 10: // SLT
            mips->registradores[operando3] = (mips->registradores[operando1] < mips->registradores[operando2]) ? 1 : 0;
            break;
        case 11: // SLL
            mips->registradores[operando3] = mips->registradores[operando1] << operando2;
            break;
        case 12: // SRA
            mips->registradores[operando3] = mips->registradores[operando1] >> operando2; 
            break;
        case 13: // LI
            mips->registradores[operando1] = operando2; 
            break;
        case 14: // LW
            mips->registradores[operando3] = mips->memoria[mips->registradores[operando1] + operando2];
            break;
        case 15: // SW
            mips->memoria[mips->registradores[operando1] + operando2] = mips->registradores[operando3];
            break;
        case 16: // LB
            mips->registradores[operando3] = (int)((char*)mips->memoria)[mips->registradores[operando1] + operando2];
            break;
        case 17: // SB
            ((char*)mips->memoria)[mips->registradores[operando1] + operando2] = (char)(mips->registradores[operando3] & 0xFF);
            break;
        case 18: // BEQ
            if (mips->registradores[operando1] == mips->registradores[operando2]) {
                mips->pc += operando3;
            }
            break;
        case 19: // BNE
            if (mips->registradores[operando1] != mips->registradores[operando2]) {
                mips->pc += operando3;
            }
            break;
        case 20: // BGT
            if (mips->registradores[operando1] > mips->registradores[operando2]) {
                mips->pc += operando3;
            }
            break;
        case 21: // BEZ
            if (mips->registradores[operando1] == 0) {
                mips->pc += operando3;
            }
            break;
        case 22: // J
            mips->pc = (operando1 << 20) | (operando2 << 10) | operando3;
            break;
        case 23: // JR
            mips->pc = mips->registradores[operando1];
            break;
        case 24: // JAL
            mips->registradores[31] = mips->pc + 1;
            mips->pc = (operando1 << 20) | (operando2 << 10) | operando3;
            break;

        default:
            printf("Instrucao nao reconhecida\n");
            exit(EXIT_FAILURE);
    }
}
//decodifica o cod em assembly presente na memoria aonde o PC esta apontando
void buscarDecodificarExecutar(MIPS *mips) {
    int instrucao = mips->memoria[mips->pc];
    int opcode = (instrucao >> 24) & 0xFF;
    int operando1 = (instrucao >> 16) & 0xFF;
    int operando2 = (instrucao >> 8) & 0xFF;
    int operando3 = instrucao & 0xFF;

    if (opcode < 0 || opcode > 24) {
        fprintf(stderr, "Opcode inválido\n");
        exit(EXIT_FAILURE);
    }

    if (operando1 < 0 || operando1 >= 32 || operando2 < 0 || operando2 >= 32 || operando3 < 0 || operando3 >= 32) {
        fprintf(stderr, "Registrador inválido\n");
        exit(EXIT_FAILURE);
    }

    executarInstrucao(mips, opcode, operando1, operando2, operando3);

    mips->pc++;         //contador para ir pra proxima instrucao, ate encerrar o codigo em assembly
}



int main() {
    MIPS mips;
    inicializarMIPS(&mips);

    const char *text = "soma.txt"; // Nome do arquivo contendo o código MIPS

    carregarProgramaDoArquivo(&mips, text);

    while (mips.pc < MEMORIA) {
        buscarDecodificarExecutar(&mips);
    }

    // Mostrar valores dos registradores após a execução
    printf("Valores dos Registradores:\n");
    for (int i = 0; i < 32; i++) {
        printf("$%02d: %d\n", i, mips.registradores[i]);
    }

    // Armazenando o resultado da conta em "resultado"
    int resultado = mips.registradores[mips.registradores[3]];

    // Mostrar o resultado ao usuário
    printf("Resultado da operação: %d\n", resultado);

    printf("Programa MIPS concluído.\n");

    return 0;
}
