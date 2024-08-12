NAME = libasm.a

SRC = 	ft_read.s \
		ft_write.s \
		ft_strcmp.s \
		ft_strcpy.s \
		ft_strdup.s \
		ft_strlen.s

BONUS = ft_list_push_front.s \
		ft_list_size.s

.s.o:
	nasm -felf64 $< -o ${<:.s=.o}

OBJ=$(SRC:.s=.o)

OBJ_BONUS=$(BONUS:.s=.o)

$(NAME): $(OBJ)
	ar -rcs $(NAME) $(OBJ)

all: $(NAME)

bonus: $(NAME) $(OBJ_BONUS)
	ar -rcs $(NAME) $(OBJ) $(OBJ_BONUS)

clean:
	/bin/rm -f $(OBJ) $(OBJ_BONUS)

fclean: clean
	/bin/rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re
