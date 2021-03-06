# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/06 05:59:57 by gsenra-a          #+#    #+#              #
#    Updated: 2021/03/06 06:01:45 by gsenra-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
        global ft_read
        extern __errno_location

ft_read
    mov     rax,0               ;setar rax (retorno) como 0 (instrução read)
    syscall                     ;chamar/executar a instrução
    cmp     rax,0               ;verificar se a write retornou erro
    jl      error               ;executar error caso o retorno da comparação seja < 0
    ret                         ;retorno

error
    neg     rax                 ;inverte sinal de rax
    push    rax                 ;"guardar" valor de rax no topo da pilha
    call    __errno_location    ;chamar/executar instrução de erro
    pop     rdi                 ;desempilhar o valor do alto da pilha para rdi
    mov     [rax], rdi          ;gera um ponteiro de rax para rdi
    mov     rax, -1             ;setar rax como -1 (erro)
    ret