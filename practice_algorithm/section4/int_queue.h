#ifndef ___IntQueue
#define ___IntQueue

typedef struct {
    int max;
    int num;
    int front;
    int rear;
    int *que;
} IntQueue;

int initialize(IntQueue *q, int max);

int enqueue(IntQueue *q, int x);

int dequeue(IntQueue *q, int *x);

int peek(IntQueue *q, int *x);

void clear(IntQueue *q);

int capacity(const IntQueue *q);

int size(const IntQueue *q);

int is_empty(const IntQueue *q);

int is_full(const IntQueue *q);

int search(const IntQueue *q, int x);

int search2(const IntQueue *q, int x);

int print_queue(const IntQueue *q);

void terminate(IntQueue *q);

#endif
