#include "cachelab.h"
#include "getopt.h"
#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "assert.h"
#include "unistd.h"

// Wei Chen, weichen1@andrew.cmu.edu

/******************************************************
 * Types
 ******************************************************/

typedef struct cache_line cache_line;
typedef struct cache_set cache_set;
typedef struct cache cache;
typedef unsigned long long addr_t; // support 64 bit address

/* a cache line */
struct cache_line {
	int valid;
	addr_t tag;
	int age; // the time from its last access
};

/* a cache set */
struct cache_set {
	int lsize;
	cache_line *lines;
};

/* cache */
struct cache {
	int ssize;
	cache_set *sets;
};

int setw = -1, blockw = -1, associw = -1;
int verbose = 0, debug = 0;
int miss_count = 0, eviction_count = 0, hit_count = 0;

int LRU(cache_set *set);

/******************************************************
 * Helpers
 ******************************************************/

void csim_verbose(char *msg) {
	if (verbose)
		printf("%s", msg);
}

/* parse cache set index */
int get_setindex(addr_t addr) {
	addr_t t = 0;
	return (~(~t << setw)) & (addr >> blockw);
}

/* parse cache line tag */
addr_t get_tag(addr_t addr) {
	addr_t t = 1;
	addr_t mask = (t << (setw + blockw)) - 1;
	return addr & ~mask;
}

/* parse memory address from text line */
addr_t parse_addr(char *line) {
	char *c;
	addr_t a;

	while (line != NULL && *line == ' ') {
		line++;
	}
	line += 2;
	a = strtoull(line, &c, 16);
	return a;
}

/* get line from text file */
int csim_getline(char **lineptr, size_t *n, FILE *fs) {
	char tmp[256];
	int c, l = 0;

	do {
		c = fgetc(fs);
		tmp[l] = c;
		l++;
	} while(c != '\n' && c != EOF);

	if (c == EOF) {
		return -1;
	} else {
		(*lineptr) = (char*)malloc(l);
		strncpy(*lineptr, tmp, l-1);
		*n = l;
		return 0;
	}
}

/* find matched cache line of an address */
int find_match(cache_set *s, addr_t addr) {
	addr_t tag = get_tag(addr);
	int i, r = -1;
	cache_line *cur = s->lines;

	for (i = 0; i < s->lsize; ++i, ++cur) {
		if (cur->valid && cur->tag == tag) {
			r = i;
			break;
		}
	}
	return r;
}

/* return the index of the cache line, if not found, return -1 */
int find_empty(cache_set *s) {
	int i, r = -1;
	cache_line *cur = s->lines;

	for (i = 0; i < s->lsize; ++i, ++cur) {
		if (!cur->valid) {
			r = i;
			break;
		}
	}
	return r;
}

/******************************************************
 * Cache operation
 ******************************************************/

/* save_cacheline block data into the cache line */
void save_cacheline(cache_line *l, addr_t addr) {
	l->valid = 1;
	l->age = 0;
	l->tag = get_tag(addr);
}

/* return the cache line index that matches */
int index_in_cache(cache *c, addr_t addr) {
	int si = get_setindex(addr);
	cache_set *set = (c->sets) + si;
	int li = find_match(set, addr);
	return li;
}
/* check whether the cache contains a block */
int is_in_cache(cache *c, addr_t addr) {
	int li = index_in_cache(c, addr);
	return li >= 0;
}

/* called when cache hit, since our solution don't actually need the data, we
 * return void
 */
void fetch_from_cache(cache *c, addr_t addr, int li) {
	// update age field in every cache line
	int si = get_setindex(addr);
	cache_set *s = (c->sets) + si;
	cache_line *cur = s->lines;

	int i;
	for (i = 0; i < s->lsize; ++i, ++cur) {
		if (i == li) {
			cur->age = 0;
		} else {
			cur->age += 1;
		}
	}
	// return nothing.
}

/* called when cache misses, load a block into the cache */
void load(cache *c, addr_t addr) {
	// load from lower cache, pass here
	int si = get_setindex(addr);
	cache_set *s = (c->sets) + si;

	int ei = find_empty(s);
	if (ei != -1) {
		// we have empty line here
		cache_line *l = (s->lines) + ei;
		save_cacheline(l, addr);
	} else {
		// the cache set is filled, so we have to evict a line
		int ri = LRU(s);
		cache_line *replace = (s->lines) + ri;
		eviction_count++;

		csim_verbose("eviction ");
		save_cacheline(replace, addr);
	}
}

/* determine which cache line to evict *, return the index of the line */
int LRU(cache_set *set) {
	int oldest = -1;
	int i, result = -1;
	cache_line *cur = set->lines;

	for (i = 0; i < set->lsize; ++i, ++cur) {
		if (cur->age > oldest) {
			oldest = cur->age;
			result = i;
		}
	}
	assert(result >= 0);
	return result;
}

void init(cache **cp) {
	int i;
	cache_set *si = NULL;

	*cp = (cache*)malloc(sizeof(cache));
	(*cp)->ssize = 1 << setw;
	(*cp)->sets = (cache_set*)malloc(((*cp)->ssize) * sizeof(cache_set));
	si = (*cp)->sets;
	for (i = 0; i < (*cp)->ssize; ++i, ++si) {
		si->lsize = associw;
		si->lines = (cache_line*)malloc(associw * sizeof(cache_line));

		int j;
		for (j = 0; j < si->lsize; ++j) {
			(si->lines + j)->valid = 0;
		}
	}
}

void clean(cache *cp) {
	int i;
	cache_set *curs = cp->sets;
	for (i = 0; i < cp->ssize; ++i, ++curs) {
		free(curs->lines);
	}
	free(cp->sets);
	free(cp);
}

/******************************************************
 * Memory operation
 ******************************************************/

void load_action(cache *, addr_t);
void store_action(cache *, addr_t);
void modify_action(cache *, addr_t);

void load_action(cache *c, addr_t addr) {
	int is_hit = is_in_cache(c, addr);
	if (is_hit) {
		hit_count++;
		csim_verbose("hit ");
	} else {
		miss_count++;
		csim_verbose("miss ");
		load(c, addr);
	}
	// it should return the data, while we don't need it now.
	// but it update the age field of very cache line
	int li = index_in_cache(c, addr);
	fetch_from_cache(c, addr, li);
}

void store_action(cache *c, addr_t addr) {
	int is_hit = is_in_cache(c, addr);
	if (is_hit) {
		hit_count++;
		csim_verbose("hit ");
	} else {
		miss_count++;
		csim_verbose("miss ");
		load(c, addr);
	}
	int li = index_in_cache(c, addr);
	fetch_from_cache(c, addr, li);
}

void modify_action(cache *c, addr_t addr) {
	load_action(c, addr);
	store_action(c, addr);
}

/* action dispatcher, main will call it every time it wants to execute an
action */
void process(cache *c, addr_t addr, char action) {
	switch (action) {
	case ' ':
		// instruction load, ignored
		break;
	case 'M':
		modify_action(c, addr);
	 	break;
	case 'L':
	 	load_action(c, addr);
	 	break;
	case 'S':
	 	store_action(c, addr);
	 	break;
	}
}

int main(int argc, char *argv[])
{
	int opt, l;
	char *tfile = NULL, *line = NULL;
	size_t len = 0, read;
	FILE *fp = NULL;
	cache *c;

	/* process option */
	while ((opt = getopt(argc, argv, "hvds:E:b:t:")) != -1) {
        switch (opt) {
        case 's':
        	setw = atoi(optarg);
            break;
        case 'b':
        	blockw = atoi(optarg);
            break;
        case 'E':
        	associw = atoi(optarg);
        	break;
       	case 't':
       		l = strlen(optarg);
       		tfile = (char*)malloc(l + 1);
       		strcpy(tfile, optarg);
       		break;
        case 'v':
       		verbose = 1;
            break;
        case 'd':
        	debug = 1;
        	break;
        case 'h':
        	fprintf(stderr, "Usage: %s [-hv] -s <s> -E <E> -b <b> -t <tracefile>\n",
        		argv[0]);
        	exit(0);
        default: /* '?' */
            fprintf(stderr, "Usage: %s [-hv] -s <s> -E <E> -b <b> -t <tracefile>\n",
                    argv[0]);
            exit(EXIT_FAILURE);
        }
    }

    /* read file */
    fp = fopen(tfile, "r");
    if (fp == NULL) {
    	fprintf(stderr, "File (%s) open failed\n", tfile);
    	exit(EXIT_FAILURE);
    }

    /* initilize cache */
    init(&c);

    /* process each line */
    while ((read = csim_getline(&line, &len, fp)) != -1) {
    	addr_t addr;
    	addr = parse_addr(line);
    	char l[255];

    	if (line[1] != ' ') {
    		strncpy(l, line + 1, len - 1);
	    	if (verbose) {
		    	printf("%s ", l);
		    }
	    	process(c, addr, line[1]);
	    	csim_verbose("\n");
    	}
    }

    if (setw < 0 || associw < 0 || blockw < 0 || tfile == NULL) {
    	fprintf(stderr, "Missing some required options!!\n");
    	exit(EXIT_FAILURE);
    }

    printSummary(hit_count, miss_count, eviction_count);

    free(tfile);
    fclose(fp);
    clean(c);
    return 0;
}
