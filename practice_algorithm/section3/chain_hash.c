#include <stdio.h>
#include <stdlib.h>
#include "member.h"
#include "chain_hash.h"

static int
hash(int key, int size)
{
    return key % size;
}

static void
set_node(Node *n, const Member *x, const Node *next)
{
    n->data = *x;
    n->next = next;
}

int
initialize(ChainHash *h, int size)
{
    int i;

    if ((h->table = calloc(size, sizeof(Node *))) == NULL) {
        h->size = 0;
        return 0;
    }

    h->size = size;
    for (i = 0; i < size; i++) {
        h->table[i] = NULL;
    }

    return -1;
}

Node
*search(const ChainHash *h, const Member *x)
{
    int key = hash(x->no, h->size);
    Node *p = h->table[key];

    while (p != NULL) {
        if (p->data.no == x->no) {
            return p;
        }
        p = p->next;
    }
    return NULL;
}

int
add(ChainHash *h, const Member *x)
{
    int key = hash(x->no, h->size);
    Node *p = h->table[key];
    Node *temp;

    while (p != NULL) {
        if (p->data.no == x->no) {
            return 1;
        }
        p = p->next;
    }
    if ((temp = calloc(1, sizeof(Node))) == NULL) {
        return 2;
    }
    set_node(temp, x, h->table[key]);
    h->table[key] = temp;

    return 0;
}

int
remove_hash(ChainHash *h, const Member *x)
{
    int key = hash(x->no, h->size);
    Node *p = h->table[key];
    Node **pp = &h->table[key];

    while (p != NULL) {
        if (p->data.no == x->no) {
            *pp = p->next;
            free(p);
            return 0;
        }
        pp = &p->next;
        p = p->next;
    }
    return 1;
}

void
dump(const ChainHash *h)
{
    int i;

    for (i = 0; i < h->size; i++) {
        Node *p = h->table[i];
        printf("%02d  ", i);
        while (p != NULL) {
            printf("-> %d (%s)  ", p->data.no, p->data.name);
            p = p->next;
        }
        putchar('\n');
    }
}

void
clear(ChainHash *h)
{
    int i;

    for (i = 0; i < h->size; i++) {
        Node *p = h->table[i];
        while (p != NULL) {
            Node *next = p->next;
            free(p);
            p = next;
        }
        h->table[i] = NULL;
    }
}

void
terminate(ChainHash *h)
{
    clear(h);
    free(h->table);
    h->size = 0;
}
