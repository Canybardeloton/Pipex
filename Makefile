# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agiliber <agiliber@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/20 10:25:55 by agiliber          #+#    #+#              #
#    Updated: 2024/08/05 14:47:50 by agiliber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ------------------------------------------------------------------------------
# 								HEADER
# ------------------------------------------------------------------------------

NAME_LIB = my_libft.a
NAME = pipex
HEADER = pipex.h

# ------------------------------------------------------------------------------
# 								COMPILATION
# ------------------------------------------------------------------------------

CC = cc
CFLAGS = -Wall -Wextra -Werror -I -g3
LIBFT_FLAGS = -L./$(LIB_DIR) -l:my_libft.a

# ------------------------------------------------------------------------------
# 									DIR
# ------------------------------------------------------------------------------

LIB_DIR = My_Libft/
SRC_DIR = src/
OBJ_DIR = obj/

# ------------------------------------------------------------------------------
# 									FILES
# ------------------------------------------------------------------------------

SRC = handle_file1.c handle_file2.c pipex.c pipex_utils.c pipex_utils2.c

SRCF = $(addprefix $(SRC_DIR), $(SRC))
OBJ = $(addprefix $(OBJ_DIR), $(SRC:%.c=%.o))

DEP = $(OBJ:%.o=%.d)

LIBFT_OBJ = $(addprefix $(LIB_DIR), $(NAME_LIB))

# ------------------------------------------------------------------------------
# 									COMMANDS
# ------------------------------------------------------------------------------

all : $(NAME)

$(NAME) : $(OBJ) | $(LIBFT_OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT_FLAGS) -o $@

$(LIBFT_OBJ) :
	make -C $(LIB_DIR)

$(OBJ_DIR)%.o : $(SRC_DIR)%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

$(OBJ_DIR) :
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR)
	make -C $(LIB_DIR) clean

fclean: clean
	rm -f $(NAME)
	make -C $(LIB_DIR) fclean

re : fclean all

.PHONY : all clean fclean re

-include $(DEP)
