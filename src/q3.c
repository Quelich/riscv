#include <stdio.h>

int main()
{
    const int x;
    printf("Size of the array?:");
    scanf("%d", &x);

    // get array input
    int a[x];
    for (int i = 0; i < x; i++)
    {
        int j;
        printf("%d:", i + 1);
        scanf("%d", &j);
        a[i] = j;
    }

    int k, l;
    for (k = 0; k < x - 1; k++)
    {
        for (l = 0; l < x - k - 1; l++)
        {
            if (a[l] > a[l + 1])
            {
                int temp = a[l];
                a[l] = a[l + 1];
                a[l + 1] = temp;
            }
        }
    }

    // print sorted array
    printf("Your sorted array is: ");
    for (int i = 0; i < x; i++)
    {
        printf("%d ", a[i]);
    }
}