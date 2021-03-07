# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 21:24:24 by gsenra-a          #+#    #+#              #
#    Updated: 2021/03/07 04:07:36 by gsenra-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
        global ft_strcmp

ft_strcmp
        mov al,BYTE[rdi]            ;seta em al um ponteiro para str1
        mov bl, BYTE[rsi]           ;seta em bl um ponteiro para str2

loop
        cmp al, 0                   ;verifica se tem str1
        je  exit                    ;caso comparação acima seja verdadeira, executa exit
        cmp bl, 0                   ;verifica se tem str2
        je  exit                    ;caso comparação acima seja verdadeira, executa exit
        cmp al,bl                   ;compara str1 com str2
        jne exit                    ;caso comparação acima nao seja verdadeira, executa exit
        inc al;                     ;incremetar para verificar o proximo caracter da str1
        inc bl;                     ;incremetar para verificar o proximo caracter da str2
        jmp loop                    ;retorna ao início da section

exit
        movzx rax, al               ;setar rax com o valor em el al
        movzx rbx, bl               ;setar rbx com o valor em bl
        sub rax, rbx                ;subtrair para resultar a diferença entre ambos os valores
        ret