# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gsenra-a <gsenra-a@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 05:05:55 by gsenra-a          #+#    #+#              #
#    Updated: 2021/03/07 19:25:24 by gsenra-a         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

TESTER = test

INCLUDE_DIR = -I include

INCLUDE = $(INCLUDE_DIR)/libasm.h

SRC_DIR = srcs

SRC =	$(SRC_DIR)/ft_read.s $(SRC_DIR)/ft_strcmp.s $(SRC_DIR)/ft_strcpy.s \
		$(SRC_DIR)/ft_strdup.s $(SRC_DIR)/ft_strlen.s $(SRC_DIR)/ft_write.s

OBJ_DIR = objs

OBJ = $(subst $(SRC_DIR),$(OBJ_DIR),$(SRC:.s=.o))

ASSEMBLER = nasm -f elf64 -g

CC = clang

RM = /bin/rm

CFLAGS = -Wall -Wextra -Werror -g -L. -lasm

ifeq ($(SANITIZE_L), true)
	CFLAGS += -fsanitize=leak
endif

ifeq ($(SANITIZE_A), true)
	CFLAGS += -fsanitize=address
endif

$(NAME): $(OBJ)
	ar -rcs $(NAME) $(OBJ)
	ranlib $(NAME)

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.s
	mkdir -p $(OBJ_DIR)
	$(ASSEMBLER) $< -o $@

all: $(NAME)

test: $(NAME)
	$(CC) $(CFLAGS) $(SRC_DIR)/main.c $(NAME) -o $(TESTER)

clean:
	$(RM) -rf $(OBJ)
	$(RM) -rf $(OBJ_DIR)

fclean: clean
	$(RM) -rf $(NAME)
	$(RM) -rf $(TESTER)
	$(RM) -rf write.txt
	$(RM) -rf ft_write.txt
	$(RM) -rf libasm.a

re: fclean all

.PHONY: all clean fclean re