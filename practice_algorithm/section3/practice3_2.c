#include <stdio.h>

void
draw_processing(const int a[], int i, int n)
{
    // line 1
    printf("   |");
    for (int count = 0; count < i; count++) {
        printf("    ");
    }
    puts("   *");
    
    // line 2
    printf("  %d|", i);
    for (int count = 0; count < n; count++) {
        printf("   %d", a[count]);
    }

    // line 3
    puts("\n   |");
}

int
linear_search(const int a[], int n, int key)
{
    int result = -1;

    for (int i = 0; i < n; i++) {
        draw_processing(a, i, n);
        if (a[i] == key) {
            result = i;
            break;
        }
    }

    return result;
}

int
main(void)
{
    int a[] = {2, 4, 5, 6, 9, 1, 7, 3, 0};
    int n, key, result;

    n = sizeof(a) / sizeof(a[0]);
    key = 1;

    puts("The Linear Search\n");

    puts("   |   0   1   2   3   4   5   6   7   8");
    puts("---+------------------------------------");
    result = linear_search(a, n, key);

    if (result == -1)
        puts("Failed search");
    else
        printf("There is %d in a[%d]\n", key, result);

    return 0;
}