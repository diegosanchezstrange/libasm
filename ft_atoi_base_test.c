
#include <stdio.h>
#include <string.h>
int check_base(char *base)
{
    int i = 0;
    int j = 0;

    while (base[i])
    {
        if (base[i] == '+' || base[i] == '-' || base[i] == ' ' || base[i] < 32)
            return 0;
        j = i + 1;
        while (base[j])
        {
            if (base[i] == base[j])
                return 0;
            j++;
        }
        i++;
    }
    return 1;
}

int ft_atoi_base(char *str, char *base)
{
    if (!check_base(base))
        return 0;
    int baseLen = strlen(base);
    int i       = 0;
    while (str[i] == ' ' || (str[i] >= 9 && str[i] <= 13))
        i++;
    int sign = 1;
    if (str[i] == '-' || str[i] == '+')
    {
        if (str[i] == '-')
            sign = -1;
        i++;
    }
    int res = 0;
    while (str[i])
    {
        int j = 0;
        while (base[j] && base[j] != str[i])
            j++;
        if (base[j])
            res = res * baseLen + j;
        else
            break;
        i++;
    }

    return res * sign;
}

int main(void)
{
    // The number in base 2 is 5
    char *str = "101";

    int sol = ft_atoi_base(str, "01");
    printf("%d\n", sol);
    return 0;
}
