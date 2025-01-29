#include <libasm.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {
  char *str = "Hello, World!";
  char *copy = malloc(sizeof(char) * ft_strlen(str) + 1);

  if (copy == NULL)
    return (1);

  printf("str: %s\n", str);

  size_t len = ft_strlen(str);
  printf("ft_strlen: %zu\n", len);

  ft_strcpy(copy, str);

  printf("str: %s\n", str);
  printf("ft_strcpy: %s\n", copy);

  return (0);
}
