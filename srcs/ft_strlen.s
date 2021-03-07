# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 20:43:58 by gsenra-a          #+#    #+#              #
#    Updated: 2021/03/06 21:19:06 by gsenra-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
        global ft_strlen

ft_strlen
        mov rax, -1             ;seta rax como -1

loop
        inc rax					;incrementa rax (rax++)
        cmp BYTE[rdi+rax], 0    ;verifica se existe str chegou no final
		jne	loop				;instrui para o início do loop caso a verificação a cima não seja verdadeira
		ret						;return rax


