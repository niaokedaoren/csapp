#ifndef __CACHE_H__
#define __CACHE_H__

#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

struct cache_item_t {
    char *tag;
    char *data;
    int size;
    int age;
    struct cache_item_t *next;
};

typedef struct cache_item_t cache_item_t;

typedef struct {
    int total_size;
    int item_count;
    cache_item_t *head;
} cache_t;

void cache_init(cache_t *c);
void cache_deinit(cache_t *c);

int  find_hit(cache_t *c, char *tag);
void get_hit(cache_t *c, char *tag, char *t, int *size);
void store(cache_t *c, char *tag, char *data, int size);
void evict(cache_t *c, char *tag, char *data, int size);

#endif