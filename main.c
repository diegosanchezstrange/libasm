#include <libasm.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{

    // ft_atoi_base test
    printf("************************************\n");
    printf("* Testing ft_atoi_base             *\n");
    printf("************************************\n");

    // char *num         = "";
    char *bin = (char *)"01";

    /* 38 */ printf("Result of test 38: %i\n",
                    ft_atoi_base((char *)"1", (char *)"01\n"));
    /* 39 */ printf("Result of test 39: %i\n",
                    ft_atoi_base((char *)"1", (char *)"01\v"));
    /* 40 */ printf("Result of test 40: %i\n",
                    ft_atoi_base((char *)"1", (char *)"01\f"));
    /* 41 */ printf("Result of test 41: %i\n",
                    ft_atoi_base((char *)"1", (char *)"01\r"));
    /* 42 */ printf("Result of test 42: %i\n", ft_atoi_base((char *)"", bin));

    // char *base   = "0123456789";
    // char *base2 = "0123456789ABCDEF";
    // // char *base3  = "01";
    // char *base4  = "poney";
    // char *base10 = "0123456789";
    // char *base16 = "0123456789ABCDEF";
    // // char *bin    = "01";
    // // char *pon    = "poney";
    //
    // char *num2 = "7B";
    // char *num3 = "1111011";
    // char *num4 = "yye";
    //
    // int sol = ft_atoi_base(num, base10);
    // printf("ft_atoi_base base 10: %d\n", sol);
    //
    // sol = ft_atoi_base(num2, base16);
    // printf("ft_atoi_base base 16: %d\n", sol);
    //
    // sol = ft_atoi_base(num3, base2);
    // printf("ft_atoi_base base 2: %d\n", sol);
    //
    // sol = ft_atoi_base(num4, base4);
    // printf("ft_atoi_base base 4: %d\n", sol);

    return (0);
}
