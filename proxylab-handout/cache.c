#include "cache.h"
#include "csapp.h"
#include <string.h>

static pthread_rwlock_t rw_lock;

static void _ages(cache_t *c);

void cache_init(cache_t *c) {
    pthread_rwlock_init(&rw_lock, NULL);
    c->total_size = 0;
    c->item_count = 0;
    c->head = NULL;
}

void cache_deinit(cache_t *c) {
    cache_item_t* h = c->head, *t;
    while (h) {
        t = h->next;
        Free(h->tag);
        Free(h->data);
        Free(h);
        h = t;
    }
    Free(c);
}

int find_hit(cache_t *c, char *tag) {
    pthread_rwlock_wrlock(&rw_lock);
    int i, res = -1;
    cache_item_t *h;

    for (i = 0, h = c->head; h != NULL; h = h->next, i++) {
        if (!strcmp(h->tag, tag)) {
            res = i; /* tag matches */
        }
    }
    pthread_rwlock_unlock(&rw_lock);
    return res;
}

void get_hit(cache_t *c, char *tag, char *t, int *size) {
    pthread_rwlock_rdlock(&rw_lock);
    cache_item_t *h;
    cache_item_t *change;

    for (h = c->head; h != NULL; h = h->next) {
        if (!strcmp(h->tag, tag)) { /* tag matches */
            memcpy(t, h->data, h->size);
            *size = h->size;
            change = h;
        }
    }

    pthread_rwlock_unlock(&rw_lock);
    pthread_rwlock_wrlock(&rw_lock);
    for (h = c->head; h != NULL; h = h->next) {
        if (h == change) {
            h->age = 0;
        } else {
            h->age += 1;
        }
    }
    pthread_rwlock_unlock(&rw_lock);
}

void store(cache_t *c, char *tag, char *data, int size) {
    pthread_rwlock_wrlock(&rw_lock);
    // simply insert into the head
    cache_item_t* item = Malloc(sizeof(cache_item_t));
    item->tag = Malloc(strlen(tag)+1);
    item->data = Malloc(size);
    strcpy(item->tag, tag);
    memcpy(item->data, data, size);
    item->size = size;
    item->next = c->head;
    c->head = item;
    c->total_size += size;
    c->item_count ++;
    _ages(c);
    item->age = 0;
    pthread_rwlock_unlock(&rw_lock);
}

void evict(cache_t *c, char *tag, char *data, int size) {
    pthread_rwlock_wrlock(&rw_lock);
    cache_item_t* h = c->head, *to_evict;
    int oldest_age = -1;

    while (h) {
        if (h->age > oldest_age) {
            to_evict = h;
            oldest_age = h->age;
        }
        h = h->next;
    }
    if (c->total_size - to_evict->size + size <= MAX_CACHE_SIZE) {
        c->total_size = c->total_size - to_evict->size + size;
        to_evict->tag = Realloc(to_evict->tag, strlen(tag)+1);
        to_evict->data = Realloc(to_evict->data, size);
        strcpy(to_evict->tag, tag);
        memcpy(to_evict->data, data, size);
        to_evict->size = size;
        _ages(c);
        to_evict->age = 0;
    }
    pthread_rwlock_unlock(&rw_lock);
}

static void _ages(cache_t *c) {
    cache_item_t* h = c->head;
    while (h) {
        h->age ++;
        h = h->next;
    }
}