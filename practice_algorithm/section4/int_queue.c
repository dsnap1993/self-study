#include <stdio.h>
#include <stdlib.h>
#include "int_queue.h"

int
initialize(IntQueue *q, int max)
{
    q->num = q->front = q->rear = 0;
    if ((q->que = calloc(max, sizeof(int))) == NULL) {
        q->max = 0;
        return -1;
    }
    q->max = max;
    return 0;
}

int
enqueue(IntQueue *q, int x)
{
    if (q->num >= q->max) {
        return -1;
    } else {
        q->num++;
        q->que[q->rear++] = x;
        if (q->rear == q->max) {
            q->rear = 0;
        }
        return 0;
    }
}

int
dequeue(IntQueue *q, int *x)
{
    if (q->num <= 0) {
        return -1;
    } else {
        q->num--;
        *x = q->que[q->front++];
        if (q->front == q->max) {
            q->front = 0;
        }
        return 0;
    }
}

int
peek(IntQueue *q, int *x)
{
    if (q->num <= 0) {
        return -1;
    }
    *x = q->que[q->front];
    return 0;
}

void
clear(IntQueue *q)
{
    q->num = q->front = q->rear = 0;
}

int
capacity(const IntQueue *q)
{
    return q->max;
}

int
size(const IntQueue *q)
{
    return q->num;
}

int
is_empty(const IntQueue *q)
{
    return q->num <= 0;
}

int
is_full(const IntQueue *q)
{
    return q->num >= q->max;
}

int
search(const IntQueue *q, int x)
{
    for (int i = 0, idx; i < q->num; i++) {
        if (q->que[idx = (i + q->front) % q->max] == x) {
            return idx;
        }
    }
    return -1;
}

int
search2(const IntQueue *q, int x)
{
    for (int i = q->front, idx; i < (q->front + q->num); i++) {
        if (q->que[idx = i % q->max] == x) {
            return idx;
        }
    }
    return -1;
}

int
print_queue(const IntQueue *q)
{
    for (int i = 0; i < q->num; i++) {
        printf("%d ", q->que[(i + q->front) % q->max]);
    }
    putchar('\n');
}

void
terminate(IntQueue *q)
{
    if (q->que != NULL) {
        free(q->que);
    }
    q->max = q->num = q->front = q->rear = 0;
}
