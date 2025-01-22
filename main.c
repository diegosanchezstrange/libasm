#include <libasm.h>
#include <stdio.h>

int main(void) {
  char *str = "Hello, World!";
  printf("str: %s\n", str);

  size_t len = ft_strlen(str);
  printf("ft_strlen: %zu\n", len);
  return (0);
}
