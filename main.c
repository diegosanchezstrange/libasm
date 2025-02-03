#include <libasm.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
  char *str = "Hello, World!";
  char *copy = malloc(sizeof(char) * ft_strlen(str) + 1);
  char *diff = "Adios, World!";

  if (copy == NULL)
    return (1);

  printf("str: %s\n", str);

  // ft_strlen test
  printf("Testing ft_strlen\n");

  size_t len = ft_strlen(str);

  printf("ft_strlen: %zu\n", len);

  // ft_strcpy test
  printf("Testing ft_strcpy\n");

  ft_strcpy(copy, str);

  printf("str: %s\n", str);
  printf("ft_strcpy: %s\n", copy);

  // ft_strcmp test
  printf("Testing ft_strcmp\n");

  int ft_cmp = ft_strcmp(str, diff);
  int cmp = strcmp(str, diff);

  printf("ft_strcmp DIFF: %d\n", ft_cmp);
  printf("strcmp DIFF: %d\n", cmp);

  ft_cmp = ft_strcmp(str, copy);
  cmp = strcmp(str, copy);

  printf("ft_strcmp SAME: %d\n", ft_cmp);
  printf("strcmp SAME: %d\n", cmp);

  return (0);
}
