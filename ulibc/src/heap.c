#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#ifndef ULIBC_HEAP_SIZE
#define ULIBC_HEAP_SIZE (256u * 1024u)
#endif

#define ALIGN_MASK (sizeof(void *) * 2u - 1u)

typedef struct FreeNode {
    size_t              size;
    struct FreeNode *next;
} FreeNode;

static unsigned char g_heap[ULIBC_HEAP_SIZE];
static FreeNode *     g_freelist;
static int            g_inited;

static size_t align_up(size_t n)
{
    return (n + ALIGN_MASK) & ~ALIGN_MASK;
}

static void heap_boot(void)
{
    if (g_inited) {
        return;
    }
    g_inited   = 1;
    g_freelist = (FreeNode *)g_heap;
    g_freelist->size = sizeof(g_heap);
    g_freelist->next = NULL;
}

void *malloc(size_t size)
{
    FreeNode **pp;
    FreeNode * blk;
    size_t      need, rest;

    heap_boot();
    if (size == 0U) {
        size = 1U;
    }
    need = align_up(size + sizeof(size_t));
    if (need < sizeof(FreeNode)) {
        need = sizeof(FreeNode);
    }

    for (pp = &g_freelist; *pp != NULL; pp = &(*pp)->next) {
        blk = *pp;
        if (blk->size >= need) {
            *pp = blk->next;
            rest = blk->size - need;
            if (rest >= sizeof(FreeNode) + sizeof(size_t)) {
                FreeNode *tail = (FreeNode *)((unsigned char *)blk + need);
                tail->size     = rest;
                tail->next     = g_freelist;
                g_freelist      = tail;
            }
            *(size_t *)blk = need;
            return (unsigned char *)blk + sizeof(size_t);
        }
    }
    return NULL;
}

void free(void *ptr)
{
    FreeNode *n;
    size_t *  hdr;
    size_t    total;

    if (!ptr) {
        return;
    }
    heap_boot();
    hdr   = (size_t *)((unsigned char *)ptr - sizeof(size_t));
    total = *hdr;
    n     = (FreeNode *)hdr;
    n->size  = total;
    n->next  = g_freelist;
    g_freelist = n;
}

void *calloc(size_t nmemb, size_t size)
{
    size_t n;
    void * p;

    if (nmemb == 0U || size == 0U) {
        return malloc(1);
    }
    if (size != 0U && nmemb > (size_t)-1 / size) {
        return NULL;
    }
    n = nmemb * size;
    p = malloc(n);
    if (p) {
        memset(p, 0, n);
    }
    return p;
}

void *realloc(void *ptr, size_t size)
{
    unsigned char *base;
    size_t         old_payload, copysize;
    void *         np;

    if (!ptr) {
        return malloc(size);
    }
    if (size == 0U) {
        free(ptr);
        return NULL;
    }
    base         = (unsigned char *)ptr - sizeof(size_t);
    old_payload  = *(size_t *)base - sizeof(size_t);
    np           = malloc(size);
    if (!np) {
        return NULL;
    }
    copysize = old_payload < size ? old_payload : size;
    memcpy(np, ptr, copysize);
    free(ptr);
    return np;
}

void abort(void)
{
    for (;;) {
        __asm volatile("bkpt #0" ::: "memory");
    }
}

void exit(int status)
{
    (void)status;
    abort();
}
