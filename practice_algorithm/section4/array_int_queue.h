#ifndef ___ArrayIntQueue
#define ___ArrayIntQueue

#define FRONT 0

typedef struct {
    int max;
    int num;
    int *que;
} ArrayIntQueue;

int initialize(ArrayIntQueue *q, int max);

int enqueue(ArrayIntQueue *q, int x);

int dequeue(ArrayIntQueue *q, int *x);

int peek(ArrayIntQueue *q, int *x);

void clear(ArrayIntQueue *q);

int capacity(const ArrayIntQueue *q);

int size(const ArrayIntQueue *q);

int is_empty(const ArrayIntQueue *q);

int is_full(const ArrayIntQueue *q);

int search(const ArrayIntQueue *q, int x);

int print_queue(const ArrayIntQueue *q);

void terminate(ArrayIntQueue *q);

#endif