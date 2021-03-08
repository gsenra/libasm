/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/07 04:56:43 by gsenra-a          #+#    #+#             */
/*   Updated: 2021/03/08 03:59:43 by gsenra-a         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <sys/types.h>
# include <sys/stat.h>
# include <fcntl.h>
# include <stdlib.h>
# include <sys/errno.h>
# include <unistd.h>
# include <string.h>
# include <stdio.h>

#define ANAJULIA  "Quem te vê passar assim por mim. \
Não sabe o que é sofrer. Ter que ver você, assim, sempre tão linda. \
Contemplar o sol do teu olhar, perder você no ar. Na certeza de um amor. \
Me achar um nada. Pois sem ter teu carinho. Eu me sinto sozinho. \
Eu me afogo em solidão. Oh, Anna Júlia. Oh, Anna Júlia. \
Nunca acreditei na ilusão de ter você pra mim. Me atormenta a previsão \
do nosso destino. Eu passando o dia a te esperar. Você sem me notar. \
Quando tudo tiver fim, você vai estar com um cara. Um alguém sem carinho. \
Será sempre um espinho. Dentro do meu coração."

#define XUXA "ABC da Xuxa!"

#define VAZIO ""

#define NUMEROS "123456789"

size_t		ft_strlen(const char *s);
char		*ft_strcpy(char *dst, const char *src);
int			ft_strcmp(const char *s1, const char *s2);
ssize_t		ft_write(int fd, const void *buf, size_t count);
ssize_t		ft_read(int fd, void *buf, size_t count);
char		*ft_strdup(const char *s1);

#endif