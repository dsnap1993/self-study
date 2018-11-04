#ifndef ___ClosedHash
#define ___ClosedHash

#include "member.h"

typedef enum {
    Occupied, Empty, Deleted
} Status;

typedef struct {
    Member data;
    Status stat;
} Bucket;

typedef struct {
    int size;
    Bucket *table;
} ClosedHash;

int initialize(ClosedHash *h, int size);

Bucket *search(const ClosedHash *h, const Member *x);

int add(ClosedHash *h, const Member *x);

int remove_closed_hash(ClosedHash *h, const Member *x);

void dump(const ClosedHash *h);

void clear(ClosedHash *h);

void terminate(ClosedHash *h);

#endif
