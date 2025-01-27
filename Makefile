NAME = libasm.a

CC = gcc

ASM = nasm

CFLAGS = -Wall -Werror -Wextra

ASMFLAGS = -f elf64

SRCS = ft_strlen.s #ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJS = $(SRCS:.s=.o)

all: $(NAME)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

test: $(NAME) main.c inc/libasm.h
	$(CC) $(CFLAGS) -Iinc  main.c -o test -L. -lasm

bear: test
	bear -- make test

clean:
	rm -f $(OBJS)
	rm -f test

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re

