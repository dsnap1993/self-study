#include <stdio.h>
#include "int_queue.h"

int
main(void)
{
    IntQueue q;

    if (initialize(&q, 64) == -1) {
        puts("Failed to generate the stack");
        return 1;
    }
    
    while (1) {
        int menu, x;
        int result;

        printf("the number of datas: %d / %d\n", size(&q), capacity(&q));
        printf("[1]Enqueue [2]Dequeue [3]Peek [4]Print [5]Clear [6]isEmpty [7]isFull [8]Search [9]Search2 [0]Terminate: ");
        scanf("%d", &menu);

        if (menu == 0) break;

        switch (menu) {
            case 1:
                printf("Data: ");
                scanf("%d", &x);
                if (enqueue(&q, x) == -1) {
                    puts("Error: Failed to push");
                }
                break;
            case 2:
                if (dequeue(&q, &x) == -1) {
                    puts("Error: Failed to pop");
                } else {
                    printf("Poped data is %d\n", x);
                }
                break;
            case 3:
                if (peek(&q, &x) == -1) {
                    puts("Error: Failed to peek");
                } else {
                    printf("Peeked data is %d\n", x);
                }
                break;
            case 4:
                print_queue(&q);
                break;
            case 5:
                clear(&q);
                break;
            case 6:
                if (is_empty(&q)) {
                    puts("The queue is empty.");
                } else {
                    puts("The queue is not empty.");
                }
                break;
            case 7:
                if (is_full(&q)) {
                    puts("The queue is full.");
                } else {
                    puts("The queue is not full.");
                }
                break;
            case 8:
                printf("Enter the number you want to search: ");
                scanf("%d", &x);
                result = search(&q, x);
                if (result == -1) {
                    puts("Failed to search");
                } else {
                    printf("%d is in physical index %d\n", x, result);
                }
                break;
            case 9:
                printf("Enter the number you want to search: ");
                scanf("%d", &x);
                result = search2(&q, x);
                if (result == -1) {
                    puts("Failed to search");
                } else {
                    printf("%d is in logical index %d\n", x, result);
                }
        }
    }
    terminate(&q);
    return 0;
}
