#include <stdio.h>
#include <stdlib.h>
#include "member.h"

int
member_no_cmp(const Member *x, const Member *y)
{
    return x->no < y->no ? -1 : x->no > y->no ? 1 : 0;
}

int
member_name_cmp(const Member *x, const Member *y)
{
    return strcmp(x->name, y->name);
}

void
print_member(const Member *x)
{
    printf("%d %s", x->no, x->name);
}

void
print_ln_member(const Member *x)
{
    printf("%d %s\n", x->no, x->name);
}

Member
scan_member(const char *message, int sw)
{
    Member temp;

    printf("Enter the data which %s\n", message);

    if (sw & MEMBER_NO) {
        printf("Number: ");
        scanf("%d", &temp.no);
    }
    if (sw & MEMBER_NAME) {
        printf("Name: ");
        scanf("%s", &temp.name);
    }

    return temp;
}
