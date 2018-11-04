#ifndef ___ChainHash
#define ___ChainHash

#include "member.h"

typedef struct __node{
    Member data;
    struct __node *next;
} Node;

typedef struct {
    int size;
    Node **table;
} ChainHash;

int initialize(ChainHash *h, int size);

Node *search(const ChainHash *h, const Member *x);

int add(ChainHash *h, const Member *x);

int remove_hash(ChainHash *h, const Member *x);

void dump(const ChainHash *h);

void clear(ChainHash *h);

void terminate(ChainHash *h);

#endif
