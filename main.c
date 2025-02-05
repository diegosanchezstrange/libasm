#include <errno.h>
#include <libasm.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(void) {
  char *str = "Hello, World!";
  char *copy = malloc(sizeof(char) * ft_strlen(str) + 1);
  char *diff = "Adios, World!";

  if (copy == NULL)
    return (1);

  printf("str: %s\n", str);

  // ft_strlen test
  printf("************************************\n");
  printf("* Testing ft_strlen                *\n");
  printf("************************************\n");

  size_t len = ft_strlen(str);

  printf("ft_strlen: %zu\n", len);

  // ft_strcpy test
  printf("************************************\n");
  printf("* Testing ft_strcpy                *\n");
  printf("************************************\n");

  ft_strcpy(copy, str);

  printf("str: %s\n", str);
  printf("ft_strcpy: %s\n", copy);

  // ft_strcmp test
  printf("************************************\n");
  printf("* Testing ft_strcmp                *\n");
  printf("************************************\n");

  int ft_cmp = ft_strcmp(str, diff);
  int cmp = strcmp(str, diff);

  printf("ft_strcmp DIFF: %d\n", ft_cmp);
  printf("strcmp DIFF: %d\n", cmp);

  ft_cmp = ft_strcmp(str, copy);
  cmp = strcmp(str, copy);

  printf("ft_strcmp SAME: %d\n", ft_cmp);
  printf("strcmp SAME: %d\n", cmp);

  // ft_write test
  printf("************************************\n");
  printf("* Testing ft_write                 *\n");
  printf("************************************\n");

  ssize_t wVal = write(1, "Hello, World!\n", 14);
  ssize_t ft_wVal = ft_write(1, "Hello, World!\n", 14);

  printf("write: %zd\n", wVal);
  printf("ft_write: %zd\n", ft_wVal);

  printf("Testing ft_write with invalid fd\n");

  wVal = write(-1, "Hello, World!\n", 14);
  ft_wVal = ft_write(-1, "Hello, World!\n", 14);

  printf("write: %zd, errno: %d (%s)\n", wVal, errno, strerror(errno));
  printf("ft_write: %zd, errno: %d (%s)\n", ft_wVal, errno, strerror(errno));

  // ft_read test
  printf("************************************\n");
  printf("* Testing ft_read                  *\n");
  printf("************************************\n");

  char *buf = malloc(sizeof(char) * 14);

  ssize_t rVal = read(0, buf, 14);
  ssize_t ft_rVal = ft_read(0, buf, 14);

  printf("read: %zd\n", rVal);
  printf("ft_read: %zd\n", ft_rVal);

  printf("Testing ft_read with invalid fd\n");

  rVal = read(-1, buf, 14);
  ft_rVal = ft_read(-1, buf, 14);

  printf("read: %zd, errno: %d (%s)\n", rVal, errno, strerror(errno));
  printf("ft_read: %zd, errno: %d (%s)\n", ft_rVal, errno, strerror(errno));

  free(copy);

  // ft_strdup test

  return (0);
}
