#include <stdio.h>
#include <stdlib.h>
#include "array_int_queue.h"

int
initialize(ArrayIntQueue *q, int max)
{
    q->num = 0;
    if ((q->que = calloc(max, sizeof(int))) == NULL) {
        q->max = 0;
        return -1;
    }
    q->max = max;
    return 0;
}

int
enqueue(ArrayIntQueue *q, int x)
{
    if (q->num >= q->max) {
        return -1;
    }
    q->que[q->num++] = x;
    return 0;
}

int
dequeue(ArrayIntQueue *q, int *x)
{
    if (q->num <= 0) {
        return -1;
    }
    *x = q->que[0];
    for (int i = 1; i < q->num; i++) {
        q->que[i - 1] = q->que[i];
    }
    q->num--;
    return 0;
}

int
peek(ArrayIntQueue *q, int *x)
{
    if (q->num <= 0) {
        return -1;
    }
    *x = q->que[0];
    return 0;
}

void
clear(ArrayIntQueue *q)
{
    q->num = 0;
}

int
capacity(const ArrayIntQueue *q)
{
    return q->max;
}

int
size(const ArrayIntQueue *q)
{
    return q->num;
}

int
is_empty(const ArrayIntQueue *q)
{
    return q->num <= 0;
}

int
is_full(const ArrayIntQueue *q)
{
    return q->num >= q->max;
}

int
search(const ArrayIntQueue *q, int x)
{
    for (int i = 0; i < q->num; i++) {
        if (q->que[i] == x) {
            return i;
        }
    }
    return -1;
}

int
print_queue(const ArrayIntQueue *q)
{
    for (int i = 0; i < q->num; i++) {
        printf("%d", q->que[i]);
    }
    putchar('\n');
}

void
terminate(ArrayIntQueue *q)
{
    if (q->que != NULL) {
        free(q->que);
    }
    q->max = q->num = 0;
}
