#include "cache.h"
#include "csapp.h"
#include <string.h>

static sem_t write_mutex_;
static sem_t cnt_mutex_;
static int read_cnt_;

static void _ages(cache_t *c);

void cache_init(cache_t *c) {
    Sem_init(&write_mutex_, 0, 1);
    Sem_init(&cnt_mutex_, 0, 1);
    read_cnt_ = 0;
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
    P(&cnt_mutex_);
    read_cnt_++;
    if (read_cnt_ == 1) /* first in */
        P(&write_mutex_);
    V(&cnt_mutex_);        

    int i, res = -1;
    cache_item_t *h;

    for (i = 0, h = c->head; h != NULL; h = h->next, i++) {
        if (!strcmp(h->tag, tag)) {
            res = i; /* tag matches */
        }
    }

    P(&cnt_mutex_);
    read_cnt_--;
    if (read_cnt_ == 0) /* last out */
        V(&write_mutex_); 
    V(&cnt_mutex_);

    return res;
}

void get_hit(cache_t *c, char *tag, char *t, int *size) {
    P(&write_mutex_);
    cache_item_t *h;

    for (h = c->head; h != NULL; h = h->next) {
        if (!strcmp(h->tag, tag)) { /* tag matches */
            memcpy(t, h->data, h->size);
            *size = h->size;
            h->age = 0;
        } else {
            h->age += 1;
        }
    }
    V(&write_mutex_); 
}

void store(cache_t *c, char *tag, char *data, int size) {
    P(&write_mutex_);
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
    V(&write_mutex_);
}

void evict(cache_t *c, char *tag, char *data, int size) {
    P(&write_mutex_);
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
    V(&write_mutex_);
}

static void _ages(cache_t *c) {
    cache_item_t* h = c->head;
    while (h) {
        h->age ++;
        h = h->next;
    }
}