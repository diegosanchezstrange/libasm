NAME = libasm.a

CC = gcc

CFLAGS = -Wall -Werror -Wextra


SRCS = ft_strlen.s #ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJS = $(SRCS:.s=.o)

all: $(NAME)

%.o: %.s
	nasm -f macho64 $<

$(NAME): $(OBJS)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

