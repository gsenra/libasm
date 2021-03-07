section .text
    global ft_strcpy

ft_strcpy:
    mov rdx, 0                  ;configura rsx como 0 para usar como indice
    cmp rsi, 0
    jmp loop
    
loop:
    mov     al, BYTE [rsi + rdx]    ;puxa para al o conteudo da src
    mov     BYTE [rdi + rdx], al    ;puxa conteudo da al para a dest
    inc     rdx                     ;incrementa indice
    cmp     BYTE [rsi +rdx], 0      ;verifica se existe str src
    je      exit                    ;executa exit caso nao haja src
    jmp     loop
    
exit:
    mov rax, rdi                ;seta retorno como a dest
    ret
