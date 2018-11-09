#include <stdio.h>
#include "int_stack.h"

int
main(void)
{
    IntStack s;

    if (initialize(&s, 64) == -1) {
        puts("Failed to generate the stack");
        return 1;
    }
    
    while (1) {
        int menu, x;

        printf("the number of datas: %d / %d\n", size(&s), capacity(&s));
        printf("[1]Push [2]Pop [3]Peak [4]Print [0]Terminate: ");
        scanf("%d", &menu);

        if (menu == 0) break;

        switch (menu) {
            case 1:
                printf("Data: ");
                scanf("%d", &x);
                if (push(&s, x) == -1) {
                    puts("Error: Failed to push");
                }
                break;
            case 2:
                if (pop(&s, &x) == -1) {
                    puts("Error: Failed to pop");
                } else {
                    printf("Poped data is %d\n", x);
                }
                break;
            case 3:
                if (peek(&s, &x) == -1) {
                    puts("Error: Failed to peek");
                } else {
                    printf("Peeked data is %d\n", x);
                }
                break;
            case 4:
                print_all_datas(&s);
                break;
        }
    }
    terminate(&s);
    return 0;
}
