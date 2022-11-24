#include <stdio.h>

int main()
{
    printf("Enter an integer...\n");
    int n, i, j;
    scanf("%d", &n);

    for (i = 0; i < n + 1; i++)
    {
        for (j = 0; j < i; j++)
        {
            printf("*");
        }
        printf("\n");
    }
}