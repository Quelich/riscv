#include <stdio.h>

int f(int x)
{

    if (x == 0)
    {
        return 5;
    }
  
    return 2 * f(x - 1) + x;
}

int main()
{
    int x;
    printf("Enter an integer...\n");
    scanf("%d", &x);
    int r = f(x);
    printf("%d\n", r);
}