#TRABALHO PRÁTICO I - DESENHO DE FIGURAS
#Leia a documentação para melhor explicação das funções.

.data
frameBuffer:
.space 0x80000
str_dig: .asciiz "Digite um numero de até 4 dígitos: "
.text
 
 loop:
 
 #zerando variáveis para começar o próximo loop
 move $v0,$zero
 move $v1,$zero
 move $s0,$zero
 move $s1,$zero
 move $s2,$zero
 move $s3,$zero
 move $s4,$zero
 move $s5,$zero
 move $s6,$zero
 move $s7,$zero
 move $t0,$zero
 move $t1,$zero
 move $t2,$zero
 
 li $v0, 4			
 la $a0, str_dig							
 syscall
 
 li $v0,5
 syscall 
 
 slt $t1,$v0,$zero
 beq $t1,1,exit
 
 move $s7,$v0	
 
 
 
 j cleanScreen
 afterClean:
 
 move $t2,$zero
 move $t0,$zero
 move $v0,$zero  #$v0 agora é o contador de dígitos
 
 beq $s7,0,set_v0_1
 bgt $s7,0,verifica_digitos
 
 verifica_digitos:  #divide por 10 sucessivamente. Algarismos do número equivalem ao resto da divisão
 move $t0,$s7
 move $s7,$zero
 addi $t2,$t2,10
 beq $t0,0,imprime_primeiro
 addi $v0,$v0,1
 div $t0,$t2
 mfhi $s4
 mflo $t0
 beq $t0,0,imprime_primeiro
 addi $v0,$v0,1
 div $t0,$t2
 mfhi $s5
 mflo $t0
 beq $t0,0,imprime_primeiro
 addi $v0,$v0,1
 div $t0,$t2
 mfhi $s6
 mflo $t0
 beq $t0,0,imprime_primeiro
 addi $v0,$v0,1
 div $t0,$t2
 mfhi $s7    #agora s7 equivale ao´primeiro dígito ( no caso de serem 4 )
 mflo $t0
 beq $t0,0,imprime_primeiro
 
 set_v0_1:
 addi $v0,$v0,1
 move $s4,$s7
 beq $s7,0,imprime_primeiro
  
 imprime_primeiro:
 
 li $v1,1
 
 li $s0,400
 li $s1,9
 li $s2,80
 li $s3,50
 
 beq $s4,0, desenhaZero
 beq $s4,1, desenhaUm
 beq $s4,2, desenhaDois
 beq $s4,3, desenhaTres
 beq $s4,4, desenhaQuatro
 beq $s4,5, desenhaCinco
 beq $s4,6, desenhaSeis
 beq $s4,7, desenhaSete
 beq $s4,8, desenhaOito
 beq $s4,9, desenhaNove
 
 op1:
 beq $v0,1,loop
 j imprime_segundo
 
 imprime_segundo:
 
 li $v1,2
 
 li $s0,300
 li $s1,9
 li $s2,80
 li $s3,50
 
 beq $s5,0, desenhaZero
 beq $s5,1, desenhaUm
 beq $s5,2, desenhaDois
 beq $s5,3, desenhaTres
 beq $s5,4, desenhaQuatro
 beq $s5,5, desenhaCinco
 beq $s5,6, desenhaSeis
 beq $s5,7, desenhaSete
 beq $s5,8, desenhaOito
 beq $s5,9, desenhaNove
 
 op2:
 beq $v0,2,loop
 j imprime_terceiro
 
 imprime_terceiro:
 
 li $v1,3
 
 li $s0,200
 li $s1,9
 li $s2,80
 li $s3,50
 
 beq $s6,0, desenhaZero
 beq $s6,1, desenhaUm
 beq $s6,2, desenhaDois
 beq $s6,3, desenhaTres
 beq $s6,4, desenhaQuatro
 beq $s6,5, desenhaCinco
 beq $s6,6, desenhaSeis
 beq $s6,7, desenhaSete
 beq $s6,8, desenhaOito
 beq $s6,9, desenhaNove
 
 op3:
 beq $v0,3,loop
 j imprime_quarto
 
 imprime_quarto:
 
 li $v1,4
 
 li $s0,100
 li $s1,9
 li $s2,80
 li $s3,50
 
 beq $s7,0, desenhaZero
 beq $s7,1, desenhaUm
 beq $s7,2, desenhaDois
 beq $s7,3, desenhaTres
 beq $s7,4, desenhaQuatro
 beq $s7,5, desenhaCinco
 beq $s7,6, desenhaSeis
 beq $s7,7, desenhaSete
 beq $s7,8, desenhaOito
 beq $s7,9, desenhaNove
 
 
 op4:
 j loop
 
 
 desenhaUm:
 
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s2,$s2,10
 move $a2,$s2
 
 addi $s0,$s0,63
 move $a0,$s0
 
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 beq $v1,1,op1
 beq $v1,2,op2
 beq $v1,3,op3
 beq $v1,4,op4


 desenhaDois:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s0,$s0,10
 move $a0,$s0
 
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,-53
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,-10
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,10
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 beq $v1,1,op1
 beq $v1,2,op2 
 beq $v1,3,op3
 beq $v1,4,op4
 
 desenhaTres:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s0,$s0,10
 move $a0,$s0
 
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,-53
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,-53
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 beq $v1,1,op1
 beq $v1,2,op2 
 beq $v1,3,op3
 beq $v1,4,op4
 
 desenhaQuatro:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3

 addi $s2,$s2,10
 move $a2,$s2
   
 jal rectangleVertical
 addi $s0,$s0,10
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,-63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 beq $v1,1,op1
 beq $v1,2,op2 
 beq $v1,3,op3
 beq $v1,4,op4
 
 desenhaCinco:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s0,$s0,10
 move $a0,$s0
 
 jal rectangleHorizontal
 addi $s0,$s0,-10
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,10
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,-53
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 beq $v1,1,op1
 beq $v1,2,op2 
 beq $v1,3,op3
 beq $v1,4,op4
 
 desenhaSeis:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s2,$s2,10
 move $a2,$s2
 
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,10
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,-53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,-53
 addi $s2,$s2,-10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,0
 addi $s2,$s2,-63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 beq $v1,1,op1
 beq $v1,2,op2
 beq $v1,3,op3
 beq $v1,4,op4
 
 desenhaSete:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s2,$s2,10
 move $a2,$s2
 
 jal rectangleVertical
 addi $s0,$s0,10
 addi $s2,$s2,-10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 beq $v1,1,op1
 beq $v1,2,op2
 beq $v1,3,op3
 beq $v1,4,op4
 
 desenhaOito:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s2,$s2,10
 move $a2,$s2
 
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,10
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,-53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,-63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,-53
 addi $s2,$s2,-10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 beq $v1,1,op1
 beq $v1,2,op2
 beq $v1,3,op3
 beq $v1,4,op4
 
 desenhaNove:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s0,$s0,10
 move $a0,$s0
 
 jal rectangleHorizontal
 addi $s0,$s0,-10
 addi $s2,$s2,10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,10
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,-53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,-53
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 beq $v1,1,op1
 beq $v1,2,op2
 beq $v1,3,op3
 beq $v1,4,op4
 
 desenhaZero:
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s2,$s2,10
 move $a2,$s2
 
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,10
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 addi $s0,$s0,53
 addi $s2,$s2,-53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,0
 addi $s2,$s2,-63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVertical
 addi $s0,$s0,-53
 addi $s2,$s2,-10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontal
 beq $v1,1,op1
 beq $v1,2,op2
 beq $v1,3,op3
 beq $v1,4,op4
 
rectangleVertical:
# $a0 é o x_min (borda da esquerda)
# $a1 é a largura (deve ser positiva)
# $a2 é o y_min  (borda superior)
# $a3 é altura (deve ser positiva)


beq $a1,$zero,rectangleReturn # largura zero: desenhar nada
beq $a3,$zero,rectangleReturn # altura zero: desenhar nada

li $t0,0xFF8C00 # cor: laranja
la $t1,frameBuffer
add $a1,$a1,$a0 
add $a3,$a3,$a2
sll $a0,$a0,2 # scale x_min para bytes (4 bytes por pixel)
sll $a1,$a1,2
sll $a2,$a2,11 # scale y_min para bytes (512*4 bytes por linha do display)
sll $a3,$a3,11
addu $t2,$a2,$t1 
addu $a3,$a3,$t1
addu $a2,$t2,$a0 
addu $a3,$a3,$a0
addu $t2,$t2,$a1 
li $t4,0x800 # bytes por linha do display

rectangleYloop:
move $t3,$a2 #setando $t3 = pixel atual para X loop

rectangleXloop:
sw $t0,($t3)
addiu $t3,$t3,4
bne $t3,$t2,rectangleXloop #continua até atingir a borda direita

addu $a2,$a2,$t4
addu $t2,$t2,$t4
bne $a2,$a3,rectangleYloop # continua té chegar na altura total

rectangleReturn:
jr $ra

rectangleHorizontal:  # basta trocar os valores da largura e altura

move $t5,$a1
move $a1,$a3
move $a3,$t5

beq $a1,$zero,rectangleReturn2 
beq $a3,$zero,rectangleReturn2 

li $t0,0xFF8C00
la $t1,frameBuffer
add $a1,$a1,$a0 
add $a3,$a3,$a2
sll $a0,$a0,2 
sll $a1,$a1,2
sll $a2,$a2,11 
sll $a3,$a3,11
addu $t2,$a2,$t1 
addu $a3,$a3,$t1
addu $a2,$t2,$a0
addu $a3,$a3,$a0
addu $t2,$t2,$a1
li $t4,0x800

rectangleYloop2:
move $t3,$a2

rectangleXloop2:
sw $t0,($t3)
addiu $t3,$t3,4
bne $t3,$t2,rectangleXloop2

addu $a2,$a2,$t4
addu $t2,$t2,$t4
bne $a2,$a3,rectangleYloop2

rectangleReturn2:
jr $ra


cleanScreen: #limpa a tela desenhando quatro oitos pretos

 li $v1,1
 
 li $s0,400
 li $s1,9
 li $s2,80
 li $s3,50
 j desenhaOitoBlack
 op1Black:
 li $v1,2
 
 li $s0,300
 li $s1,9
 li $s2,80
 li $s3,50
 j desenhaOitoBlack
 op2Black:
 li $v1,3
 
 li $s0,200
 li $s1,9
 li $s2,80
 li $s3,50
 j desenhaOitoBlack
 op3Black:
 li $v1,4
 
 li $s0,100
 li $s1,9
 li $s2,80
 li $s3,50
 j desenhaOitoBlack
 op4Black:
 move $v1, $zero
 j afterClean
 

rectangleHorizontalBlack:

move $t5,$a1
move $a1,$a3
move $a3,$t5

beq $a1,$zero,rectangleReturn3
beq $a3,$zero,rectangleReturn3

li $t0,0x000000 # cor: preto
la $t1,frameBuffer
add $a1,$a1,$a0 
add $a3,$a3,$a2
sll $a0,$a0,2 
sll $a1,$a1,2
sll $a2,$a2,11 
sll $a3,$a3,11
addu $t2,$a2,$t1 
addu $a3,$a3,$t1
addu $a2,$t2,$a0 
addu $a3,$a3,$a0
addu $t2,$t2,$a1 
li $t4,0x800 

rectangleYloop3:
move $t3,$a2 

rectangleXloop3:
sw $t0,($t3)
addiu $t3,$t3,4
bne $t3,$t2,rectangleXloop3 

addu $a2,$a2,$t4 
addu $t2,$t2,$t4 
bne $a2,$a3,rectangleYloop3 

rectangleReturn3:
jr $ra


rectangleVerticalBlack:

beq $a1,$zero,rectangleReturn4 
beq $a3,$zero,rectangleReturn4 

li $t0,0x000000 # cor: preto
la $t1,frameBuffer
add $a1,$a1,$a0 
add $a3,$a3,$a2
sll $a0,$a0,2 
sll $a1,$a1,2
sll $a2,$a2,11 
sll $a3,$a3,11
addu $t2,$a2,$t1 
addu $a3,$a3,$t1
addu $a2,$t2,$a0 
addu $a3,$a3,$a0
addu $t2,$t2,$a1 
li $t4,0x800 

rectangleYloop4:
move $t3,$a2 

rectangleXloop4:
sw $t0,($t3)
addiu $t3,$t3,4
bne $t3,$t2,rectangleXloop4 

addu $a2,$a2,$t4 
addu $t2,$t2,$t4 
bne $a2,$a3,rectangleYloop4 

rectangleReturn4:
jr $ra


desenhaOitoBlack:  #desenha oito preto
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 
 addi $s2,$s2,10
 move $a2,$s2
 
 jal rectangleVerticalBlack
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVerticalBlack
 addi $s0,$s0,10
 addi $s2,$s2,53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontalBlack
 addi $s0,$s0,53
 addi $s2,$s2,-53
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVerticalBlack
 addi $s0,$s0,0
 addi $s2,$s2,-63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleVerticalBlack
 addi $s0,$s0,-53
 addi $s2,$s2,-10
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontalBlack
 addi $s0,$s0,0
 addi $s2,$s2,63
 move $a0,$s0
 move $a1,$s1
 move $a2,$s2
 move $a3,$s3
 jal rectangleHorizontalBlack
 
 beq $v1,1,op1Black
 beq $v1,2,op2Black
 beq $v1,3,op3Black
 beq $v1,4,op4Black
 #j loop

 exit:  #finaliza execução do programa
 li $v0,10
 syscall

