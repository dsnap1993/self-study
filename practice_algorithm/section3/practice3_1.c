#include <stdio.h>

int
linear_search(const int a[], int n, int key)
{
    int result = -1;

    for (int i = 0; i < n; i++) {
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
    int a[] = {321, 43, 55, 66, 22, 12, 47, 32, 90};
    int n, key, result;

    n = sizeof(a) / sizeof(a[0]);
    key = 12;

    result = linear_search(a, n, key);
    puts("The Linear Search");
    puts("-----------------");

    if (result == -1)
        puts("Failed search");
    else
        printf("There is %d in a[%d]\n", key, result);

    return 0;
}