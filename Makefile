# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vmormont <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/05/31 16:31:10 by vmormont          #+#    #+#              #
#    Updated: 2019/06/04 16:36:01 by vmormont         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	:= fdf

SRC_DIR	:= ./src
INC_DIR	:= ./includes
OBJ_DIR	:= ./obj
LIB_DIR	:= ./libft

SRC		:= main.c \
			fill.c \
			color.c \
			image.c \
			keys.c \
			validation.c \
			bonus.c
OBJ		:= $(addprefix $(OBJ_DIR)/,$(SRC:.c=.o))

CC		:= gcc
CFLAGS	:= -Wall -Wextra -Werror


.PHONY: all dir clean fclean re

all: $(NAME)

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.c
	$(CC) -g $(CFLAGS) -I $(LIB_DIR)/includes -I $(INC_DIR) -o $@ -c $<

$(NAME): dir $(OBJ)
	$(CC) $(OBJ) -L $(LIB_DIR) -l ft -I /usr/local/include -L /usr/local/lib -lmlx -framework OpenGL -framework AppKit -o $(NAME)

dir:
	mkdir -p $(OBJ_DIR)
	make -C $(LIB_DIR)

clean:
	rm -rf $(OBJ_DIR)
	make -C $(LIB_DIR) clean

fclean: clean
	rm -rf $(NAME)
	make -C $(LIB_DIR) fclean

re: fclean all
