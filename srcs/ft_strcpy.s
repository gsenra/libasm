# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/08 03:43:48 by gsenra-a          #+#    #+#              #
#    Updated: 2021/03/08 03:56:24 by gsenra-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global ft_strcpy

ft_strcpy:
    mov rdx, 0                  ;configura rsx como 0 para usar como indice
    cmp rsi, 0                  ;verifica de existe src
    je  exit
    jmp loop
    
loop:
    mov     al, BYTE [rsi + rdx]    ;puxa para al o conteudo da src
    mov     BYTE [rdi + rdx], al    ;puxa conteudo da al para a dest
    inc     rdx                     ;incrementa indice
    cmp     al, 0                   ;verifica se existe str src
    jne     loop
    
exit:
    mov rax, rdi                ;seta retorno como a dest
    ret
