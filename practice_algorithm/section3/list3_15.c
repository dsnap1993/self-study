#include <stdio.h>
#include "member.h"
#include "closed_hash.h"

typedef enum {
    TERMINATE, ADD, DELETE, SEARCH, CLEAR, DUMP
} Menu;

Menu
select_menu(void)
{
    int ch;

    do {
        printf("[1]ADD [2]DELETE [3]SEARCH [4]CLEAR [5]DUMP [0]TERMINATE: ");
        scanf("%d", &ch);
    } while (ch < TERMINATE || ch > DUMP);

    return (Menu)ch;
}

int
main(void)
{
    Menu menu;
    ClosedHash hash;
    initialize(&hash, 13);

    do {
        int result;
        Member x;
        Bucket *temp;

        switch (menu = select_menu()) {
            case ADD :
                x = scan_member("ADD",  MEMBER_NO | MEMBER_NAME);
                result = add(&hash, &x);
                if (result) {
                    printf("Error: Failed adding (%s)\n", (result == 1) ? "Have added" : "Memory shortage");
                }
                break;
            case DELETE :
                x = scan_member("DELETE",  MEMBER_NO);
                result = remove_closed_hash(&hash, &x);
                if (result == 1) {
                    printf("There is not the such number's data\n");
                }
                break;
            case SEARCH :
                x = scan_member("SEARCH",  MEMBER_NO);
                temp = search(&hash, &x);
                if (temp == NULL) {
                    printf("Failed to search\n");
                } else {
                    printf("Successed to search\n");
                    print_ln_member(&temp->data);
                }
                break;
            case CLEAR :
                clear(&hash);
                break;
            case DUMP :
                dump(&hash);
                break;
        }
    } while(menu != TERMINATE);
    terminate(&hash);
    return 0;
}
