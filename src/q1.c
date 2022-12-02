#include <stdio.h>

int main()
{
    printf("Enter an integer...\n");
    int n, i, j;
    scanf("%d", &n);

    for (i = 1; i <= n; i++) // i > n + 1
    {
        for (j = 1; j <=  i; j++)
        {
            printf("*");
        }
        // Ending line after each row
        printf("\n");
    }
}
