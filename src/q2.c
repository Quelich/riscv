#include <stdio.h>

int f(int x)
{
   
    if (x == 0)
    {
        return 5;
    }
    else if(x > 0)
    {
        return 2 * f(x - 1) + x;
    }

    return 1;
}

int main()
{
    int x;
    scanf("%d", &x);
    int r =  f(x);
    printf("%d\n", r);
}