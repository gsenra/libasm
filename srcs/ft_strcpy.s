# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 22:11:48 by gsenra-a          #+#    #+#              #
#    Updated: 2021/03/07 04:27:46 by gsenra-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global  ft_strcpy

ft_strcpy
    mov al, BYTE[rdi]   ;seta al como ponteiro para rdi/str de destino
    mov bl, BYTE[rsi]   ;seta bl como ponteiro para rsi/str de origem


loop
    cmp bl, 0           ;verifica se ainda existe str de origem ainda existe
    je  exit            ;caso verificaçao verdadeira executa exit
    mov rdx, 0          ;seta rdx como nulo, para usar como temp
    mov rdx, bl         ;passa da srd para temp
    mov al, rdx         ;passa da temp para a dest
    inc bl
    inc al
    jmp loop

exit
    mov rax, rdi        ;seta retorno como a dest
    ret
