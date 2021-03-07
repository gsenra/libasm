# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 04:10:01 by user42            #+#    #+#              #
#    Updated: 2021/03/07 21:58:22 by gsenra-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
        global ft_write
        extern __errno_location

ft_write:
    mov     rax,0               ;setar rax (retorno) como 0 (instrução read)
    syscall                     ;chamar/executar a instrução 0
    cmp     rax,0               ;verificar se a write retornou erro
    jl      error               ;executar error caso o retorno da comparação seja < 0
    ret                         ;retorno

error:
    mov     rdi, rax            ;passa para rdi o valor de rax
    neg     rdi                 ;inverte sinal de rdi
    call    __errno_location    ;chamar/executar instrução de erro
    mov     [rax], rdi          ;gera um ponteiro de rax para rdi
    mov     rax, -1             ;setar rax como -1 (erro)
    ret