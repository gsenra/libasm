# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 04:28:36 by gsenra-a          #+#    #+#              #
#    Updated: 2021/03/08 03:42:26 by gsenra-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global  ft_strdup
    extern  __errno_location
    extern  ft_strlen
    extern  malloc
    extern  ft_strcpy

ft_strdup:
    call    ft_strlen       ;verificar tamanho da str que vai ser alocada
    inc     rax             ;incrementar 1 para usar no malloc
    push    rdi             ;coloca str src na stack
    mov     rdi, rax        ;passa o valor do malloc para o primeiro argumento
    call    malloc
    cmp     rax, 0          ;verifica se o malloc funcionou
    je      error
    pop     rsi             ;coloca str src no paramentro para a strcpy
    mov     rdi, rax        ;coloca a str alocada no paramentro para strcpy
    call    ft_strcpy
    ret

error:
    neg     rax                 ;inicialemnte -1 (retorno malloc fail)
    push    rax                 ;"guarda" valor de rax no topo da pilha (stack)
    call    __errno_location    ;chamar/executar instrução de erro
    pop     rdi                 ;desempilhar o valor do alto da pilha para rdi
    mov     [rax], rdi          ;gera um ponteiro de rax para rdi
    mov     rax, -1             ;setar rax como -1 (erro)