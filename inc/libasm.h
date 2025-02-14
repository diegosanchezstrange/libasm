#ifndef LIBASM_H
#define LIBASM_H

#include <stddef.h>
#include <stdio.h>
#include <sys/types.h>

size_t  ft_strlen(char *str);
char   *ft_strcpy(char *dest, char *src);
int     ft_strcmp(char *s1, char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char   *ft_strdup(char *str);

// Bonus

int ft_atoi_base(char *str, char *base);

#endif
