/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/27 23:23:07 by user42            #+#    #+#             */
/*   Updated: 2021/03/08 03:57:05 by gsenra-a         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/libasm.h"

static void	test_strdup(void)
{
	char *copia;
	char *cp;

	copia = strdup(XUXA);
	cp = ft_strdup(XUXA);
	printf("\n ############## TEST STRDUP ##############");
	printf("\n\nTEST STR");
	printf("\nstr: %s", XUXA);
	printf("\nORIGINAL: %s", copia);
	printf("\nPIRATA: %s\n", cp);

	free(copia);
	free(cp);

	copia = strdup(VAZIO);
	cp = ft_strdup(VAZIO);
	printf("\n\nTEST STR VAZIA");
	printf("\nstr: %s", VAZIO);
	printf("\nORIGINAL: %s", copia);
	printf("\nPIRATA: %s\n", cp);

	free(copia);
	free(cp);

	copia = strdup(ANAJULIA);
	cp = ft_strdup(ANAJULIA);
	printf("\nTEST STR LONGA");
	printf("\n\nstr: %s\n", ANAJULIA);
	printf("\nORIGINAL: %s\n", copia);
	printf("\nPIRATA: %s\n", cp);

	free(copia);
	free(cp);
}

static void	test_read(void)
{
	int		fd1;
	size_t	ret;
	char 	buffer[1024];

	fd1 = open("readtext.txt", O_RDONLY);
	memset(buffer, 0, 1024);

	printf("\n ############## TEST READ ##############");

	printf("\n\nTESTE Stdin.\nDigite seu texto:");

	printf("\n(ORIGINAL)");
	ret = read(0, buffer, 1024);
	printf("\n(ORIGINAL) retorno: %zu", ret);
	printf("\n(ORIGINAL) errno: %d - %s\n\nDigite seu texto novamente", errno, strerror(errno));

	printf("\n(PIRATA)");
	ret = ft_read(0, buffer, 1024);
	printf("\n(PIRATA)retorno: %zu", ret);
	printf("\n(PIRATA)errno: %d - %s\n\n", errno, strerror(errno));


	printf("\n\nTEST FD: readtext.txt\n");

	printf("\n(ORIGINAL)");
	ret = read(fd1, buffer, 1024);
	printf("Fd(readtext.txt): \n%s", buffer);
	printf("\n\n(ORIGINAL) retorno: %zu", ret);
	printf("\n(ORIGINAL) errno: %d - %s\n\nFd: readtext.txt", errno, strerror(errno));
	close (fd1);
	fd1 = open("readtext.txt", O_RDONLY);
	printf("\n(PIRATA)");
	ret = ft_read(fd1, buffer, 1024);
	printf("Fd(readtext.txt): \n%s", buffer);
	printf("\n\n(PIRATA) retorno: %zu", ret);
	printf("\n(PIRATA) errno: %d - %s\n", errno, strerror(errno));



	printf("\n\nTEST FD inexistente");

	memset(buffer, 0, 1024);
	ret = read(-42, buffer, 1024);
	printf("\n\n(ORIGINAL) retorno: %zu", ret);
	printf("\n(ORIGINAL) errno: %d - %s\n", errno, strerror(errno));
	close (fd1);
	fd1 = open("readtext.txt", O_RDONLY);
	ret = ft_read(-42, buffer, 1024);
	printf("\n\n(PIRATA) retorno: %zu", ret);
	printf("\n(PIRATA) errno: %d - %s\n", errno, strerror(errno));
}

static void	test_write(void)
{
	int		fd1;
	int		fd2;
	size_t	ret;

	errno = 0;
	ret = 0;
	fd1 = open("write.txt", O_CREAT | O_WRONLY | O_TRUNC, 0666);
	fd2 = open("ft_write.txt", O_CREAT | O_WRONLY | O_TRUNC, 0666);

	printf("\n ############## TEST WRITE ##############");
	
	printf("\n\nstr: %s (stdout)\n", XUXA);

	printf("\n (ORIGINAL)");
	ret = write(1, XUXA, 12);
	printf("\nretorno: %zu", ret);
	printf("\nerrno: %d - %s", errno, strerror(errno));

	printf("\n(PIRATA)");
	ret = ft_write(1, XUXA, 12);
	printf("\nretorno: %zu", ret);
	printf("\nerrno: %d - %s\n", errno, strerror(errno));



	printf("\n\nstr: %s (fd1 e fd2)\n", ANAJULIA);

	printf("\nORIGINAL(fd1) ");
	ret = write(fd1, ANAJULIA, 573);
	printf("\nretorno: %zu", ret);
	printf("\nerrno: %d - %s", errno, strerror(errno));

	printf("\nPIRATA(fd2) ");
	ret = ft_write(fd2, ANAJULIA, 573);
	printf("\nretorno: %zu", ret);
	printf("\nerrno: %d - %s\n", errno, strerror(errno));



	printf("\n ############## TEST WRITE ##############");
	
	printf("\n\nstr: %s (file descriptor = -1)\n", NUMEROS);

	printf("\n(ORIGINAL)");
	ret = write(-1, NUMEROS, 12);
	printf("\nretorno: %zu", ret);
	printf("\nerrno: %d - %s", errno, strerror(errno));

	printf("\n(PIRATA)");
	ret = ft_write(-1, NUMEROS, 12);
	printf("\nretorno: %zu", ret);
	printf("\nerrno: %d - %s\n", errno, strerror(errno));

	close(fd1);
	close(fd2);
}

static void	test_strcmp(void)
{
	printf("\n ############## TEST STRCMP ##############");
	printf("\n\nstr1: %s, str2: %s", VAZIO, VAZIO);
	printf("\nORIGINAL: %d", strcmp(VAZIO, VAZIO));
	printf("\nPIRATA: %d", ft_strcmp(VAZIO, VAZIO));

	printf("\n\nstr1: %s, str2: %s", VAZIO, XUXA);
	printf("\nORIGINAL: %d", strcmp(VAZIO, XUXA));
	printf("\nPIRATA: %d", ft_strcmp(VAZIO, XUXA));

	printf("\n\nstr1: %s, str2: %s", NUMEROS, VAZIO);
	printf("\nORIGINAL: %d", strcmp(NUMEROS, VAZIO));
	printf("\nPIRATA: %d", ft_strcmp(NUMEROS, VAZIO));

	printf("\n\nstr1: %s, str2: %s", XUXA, ANAJULIA);
	printf("\nORIGINAL: %d", strcmp(XUXA, ANAJULIA));
	printf("\nPIRATA: %d\n\n\n\n\n", ft_strcmp(XUXA, ANAJULIA));
}

static void	test_strcpy(void)
{
	char dest[(ft_strlen(XUXA)) + 1];
	char dest1[(ft_strlen(NUMEROS)) + 1];
	char dest2[(ft_strlen(ANAJULIA)) + 1];

	printf("\n ############## TEST STRCPY ##############");
	printf("\n\nsrc: %s", XUXA);
	printf("\nORIGINAL: %s", strcpy(dest, XUXA));
	printf("\nPIRATA: %s", ft_strcpy(dest, XUXA));

	printf("\n\nsrc: %s", NUMEROS);
	printf("\nORIGINAL: %s", strcpy(dest1, NUMEROS));
	printf("\nPIRATA: %s", ft_strcpy(dest1, NUMEROS));

	printf("\n\nsrc: %s\n", ANAJULIA);
	printf("\nORIGINAL: %s\n", strcpy(dest2, ANAJULIA));
	printf("\nPIRATA: %s\n\n\n\n\n", ft_strcpy(dest2, ANAJULIA));
}

static void	test_strlen(void)
{
	printf("\n ############## TEST STRLEN ##############");
	printf("\n\nstr: %s", XUXA);
	printf("\nORIGINAL: %zu", strlen(XUXA));
	printf("\nPIRATA: %zu", ft_strlen(XUXA));

	printf("\n\nstr: %s", VAZIO);
	printf("\nORIGINAL: %zu", strlen(VAZIO));
	printf("\nPIRATA: %zu", ft_strlen(VAZIO));

	printf("\n\nstr: %s", NUMEROS);
	printf("\nORIGINAL: %zu", strlen(NUMEROS));
	printf("\nPIRATA: %zu", ft_strlen(NUMEROS));

	printf("\n\nstr longa: %s", ANAJULIA);
	printf("\nORIGINAL: %zu", strlen(ANAJULIA));
	printf("\nPIRATA: %zu\n", ft_strlen(ANAJULIA));
}

static void	test_all(void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();
}

int			main(int argc, char** argv)
{
	if (argc == 2)
	{
		if ((strcmp(argv[1], "ft_strlen") == 0))
			test_strlen();
		else if ((strcmp(argv[1], "ft_strcpy") == 0))
			test_strcpy();
		else if ((strcmp(argv[1], "ft_strcmp") == 0))
			test_strcmp();
		else if ((strcmp(argv[1], "ft_write") == 0))
			test_write();
		else if ((strcmp(argv[1], "ft_read") == 0))
			test_read();
		else if ((strcmp(argv[1], "ft_strdup") == 0))
			test_strdup();
		else if ((strcmp(argv[1], "all") == 0))
			test_all();
		else
			printf("Escreva qual função deseja testar.\n");
	}
	else if (argc == 1 || argc > 2)
		printf("Escreva 'all' para testar todas as funções ou o nome da \
		função desejada.\n");
	return (0);
}