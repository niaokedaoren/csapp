/*
 * mm.c
 *
 * 64 bit memory allocator. 
 *
 * Explicit free list. 
 * Boundary tag coalescing.
 * First fit.
 * minimum allocated block: 3 words
 * minimum free block: 6 word
 * 
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "mm.h"
#include "memlib.h"


/*************************************
 * Constants and Helpers
 ************************************/

/* If you want debugging output, use the following macro.  When you hand
 * in, remove the #define DEBUG line. */
#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
#else
# define dbg_printf(...)
#endif

/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* minimum allocated block is 4 words */
#define MINSIZE 4 

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(p) (((size_t)(p) + (ALIGNMENT-1)) & ~0x7)

/*
 * If NEXT_FIT defined use next fit search, else use first fit search 
 */
//#define NEXT_FITx

/* Basic constants and macros */
#define WSIZE       8       /* Word and header/footer size (bytes) */ //line:vm:mm:beginconst
#define DSIZE       16      /* Doubleword size (bytes) */
#define CHUNKSIZE  (1<<8)  /* Extend heap by this amount (bytes) */  //line:vm:mm:endconst 

#define MAX(x, y) ((x) > (y)? (x) : (y))  

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc)  ((size) | (alloc))

/* Read and write a word at address p */
#define GET(p)       (*(unsigned long long *)(p))            
#define PUT(p, val)  (*(unsigned long long *)(p) = (val))    

/* Read the size and allocated fields from address p */
#define GET_SIZE(p)  (GET(p) & ~0x7)                   
#define GET_ALLOC(p) (GET(p) & 0x1)                    

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)       ((char *)(bp) - WSIZE)                      
#define FTRP(bp)       ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE) 

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp)  ((char *)(bp) + GET_SIZE(((char *)(bp) - WSIZE))) 
#define PREV_BLKP(bp)  ((char *)(bp) - GET_SIZE(((char *)(bp) - DSIZE))) 

static char *flist_head = NULL;   /* Pointer to first free block */
static char *flist_tail = NULL;   /* Pointer to last free block */

// Macro is evil, inline function is more reliable.

/* previous free block */
static
void* prev_free(void * bp) {
    return *((void **)(bp));
}

/* next free block */
static
void* next_free(void * bp) {
    return *((void **)(bp) + 1);
}

/* set previous free block pointer */
static
void set_prev_free(void * bp, char * p) {
    *((char **)(bp)) = p; 
}

/* set next free block pointer */
static
void set_next_free(void * bp, char * p) {
    *((char **)(bp) + 1) = p;
}

/* is the last free block */
static
int is_tail(void * bp) {
    return next_free(bp) == NULL;
}

/* is the head of the free block list */
static
int is_head(void * bp) {
    return prev_free(bp) == NULL;
}

/* Global variables */
static char *heap_listp = 0;  /* Pointer to first block */  

/* Function prototypes for internal helper routines */
static void *extend_heap(size_t words);
static void place(void *bp, size_t asize);
static void *find_fit(size_t asize);
static void *coalesce(void *bp);
static void printblock(void *bp); 
static int checkblock(void *bp);

static void insert_entry(void * bp);
static void delete_entry(void * bp);
static int is_minimum_free(size_t s);

/*************************************
 * Main routines
 ************************************/

/*
 * Initialize: return -1 on error, 0 on success.
 */
int mm_init(void) {
    /* Create the initial empty heap */
    if ((heap_listp = mem_sbrk(4*WSIZE)) == (void *)-1) 
        return -1;
    PUT(heap_listp, 0);                          /* Alignment padding */
    PUT(heap_listp + (1*WSIZE), PACK(DSIZE, 1)); /* Prologue header */ 
    PUT(heap_listp + (2*WSIZE), PACK(DSIZE, 1)); /* Prologue footer */ 
    PUT(heap_listp + (3*WSIZE), PACK(0, 1));     /* Epilogue header */
    heap_listp += (2*WSIZE);

    flist_head = flist_tail = NULL;

    /* Extend the empty heap with a free block of CHUNKSIZE bytes */
    char *freeb = extend_heap(CHUNKSIZE/WSIZE);
    if (freeb == NULL) {
        return -1;
    }
    return 0;
}

/*
 * malloc
 */
void *malloc (size_t size) {
    size_t asize;      /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    char *bp;      

    if (heap_listp == 0){
        mm_init();
    }
    /* Ignore spurious requests */
    if (size == 0)
        return NULL;

    /* require minimum size */
    asize = MAX(size, MINSIZE * WSIZE);

    /* Adjust block size to include overhead and alignment reqs. */
    asize = ALIGN(asize + DSIZE);
#ifdef DEBUG
    printf("malloc: %d bytes.\n", (unsigned)asize);    
    assert(asize >= MINSIZE * WSIZE);
#endif    

    /* Search the free list for a fit */
    if ((bp = find_fit(asize)) != NULL) {  
#ifdef DEBUG    
        mm_checkheap(1);
#endif            
        place(bp, asize);                  
        return bp;
    }

    /* No fit found. Get more memory and place the block */
    extendsize = MAX(asize,CHUNKSIZE);                
    bp = extend_heap(extendsize/WSIZE);
    if (bp == NULL) 
        return NULL;
    place(bp, asize);                                 
#ifdef DEBUG    
    mm_checkheap(1);
#endif    
    return bp;
}

/*
 * free
 */
void free (void *bp) {
#ifdef DEBUG
    printf("free[%p].\n", bp);    
#endif        
    if(bp == 0) 
        return;

    size_t size = GET_SIZE(HDRP(bp));
    if (heap_listp == 0){
        mm_init();
    }

    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    coalesce(bp);
#ifdef DEBUG    
    mm_checkheap(1);
#endif    
}

/*
 * realloc - you may want to look at mm-naive.c
 */
void *realloc(void *ptr, size_t size) {
    size_t oldsize;
    void *newptr;

    /* If size == 0 then this is just free, and we return NULL. */
    if(size == 0) {
        free(ptr);
        return 0;
    }

    /* If oldptr is NULL, then this is just malloc. */
    if(ptr == NULL) {
        return malloc(size);
    }

    newptr = malloc(size);

    /* If realloc() fails the original block is left untouched  */
    if(!newptr) {
        return 0;
    }

    /* Copy the old data. */
    oldsize = GET_SIZE(HDRP(ptr));
    if(size < oldsize) 
        oldsize = size;
    memcpy(newptr, ptr, oldsize);

    /* Free the old block. */
    free(ptr);

    return newptr;
}

/*
 * calloc - you may want to look at mm-naive.c
 * This function is not tested by mdriver, but it is
 * needed to run the traces.
 */
void *calloc (size_t nmemb, size_t size) {
  size_t bytes = nmemb * size;
  void *newptr;

  newptr = malloc(bytes);
  memset(newptr, 0, bytes);

  return newptr;
}


/*
 * Return whether the pointer is in the heap.
 * May be useful for debugging.
 */  
// static int in_heap(const void *p) {
//     return p <= mem_heap_hi() && p >= mem_heap_lo();
// }

/*
 * Return whether the pointer is aligned.
 * May be useful for debugging.
 */
// static int aligned(const void *p) {
//     return (size_t)ALIGN(p) == (size_t)p;
// }

/*
 * mm_checkheap
 */
void mm_checkheap(int verbose) {
    char *bp = heap_listp;

    if (verbose)
        printf("Heap (%p):\n", heap_listp);

    if ((GET_SIZE(HDRP(heap_listp)) != DSIZE) || !GET_ALLOC(HDRP(heap_listp)))
        printf("Bad prologue header\n");
    checkblock(heap_listp);

    for (bp = heap_listp; GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp)) {
        if (verbose) 
            printblock(bp);
        checkblock(bp);
    }

    if (verbose)
        printblock(bp);
    if ((GET_SIZE(HDRP(bp)) != 0) || !(GET_ALLOC(HDRP(bp))))
        printf("Bad epilogue header\n");    
}

/* 
 * The remaining routines are internal helper routines 
 */

/*
 * coalesce
 * Boundary tag coalescing. Return ptr to coalesced block
 * delete or insert entry of free list.
 */
static void *coalesce(void *bp) 
{
    size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(bp)));
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HDRP(bp));

#ifdef DEBUG    
    size_t sizef = GET_SIZE(FTRP(bp));    
    assert(size == sizef);
#endif    

    if (prev_alloc && next_alloc) {            /* Case 1 */
        /* nop */
    }
    else if (prev_alloc && !next_alloc) {      /* Case 2 */
        delete_entry(NEXT_BLKP(bp));
        size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
        PUT(HDRP(bp), PACK(size, 0));
        PUT(FTRP(bp), PACK(size,0));
    }
    else if (!prev_alloc && next_alloc) {      /* Case 3 */
        delete_entry(PREV_BLKP(bp));
        size += GET_SIZE(HDRP(PREV_BLKP(bp)));
        PUT(FTRP(bp), PACK(size, 0));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }
    else {                                     /* Case 4 */
        delete_entry(PREV_BLKP(bp));
        delete_entry(NEXT_BLKP(bp));
        size += GET_SIZE(HDRP(PREV_BLKP(bp))) +  GET_SIZE(FTRP(NEXT_BLKP(bp)));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }
    insert_entry(bp);
    return bp;
}

/* 
 * extend_heap - Extend heap with free block and return its block pointer
 * 
 * Return:
 *      the new free block pointer
 */
static void *extend_heap(size_t words) 
{
    char *bp;
    size_t size;

    /* single-word alignment */
    size = (words + 1) * WSIZE; 
    if ((long)(bp = mem_sbrk(size)) == -1)  
        return NULL;                                        

    /* Initialize free block header/footer and the epilogue header */
    PUT(HDRP(bp), PACK(size, 0));         /* Free block header */   
    PUT(FTRP(bp), PACK(size, 0));         /* Free block footer */   
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1)); /* New epilogue header */ 

    /* Coalesce if the previous block was free */
    return coalesce(bp);
}

/* 
 * place - Place block of asize bytes at start of free block bp 
 *         and split if remainder would be at least minimum block size
 */
static void place(void *bp, size_t asize){
    size_t csize = GET_SIZE(HDRP(bp));   

    if (is_minimum_free(csize - asize)) {  
        /* we want to make sure the new free block satisfy the minimum requirement */            
        delete_entry(bp); /* remove the record in the free block list */
        PUT(HDRP(bp), PACK(asize, 1));
        PUT(FTRP(bp), PACK(asize, 1));
        bp = NEXT_BLKP(bp);
        PUT(HDRP(bp), PACK(csize-asize, 0));
        PUT(FTRP(bp), PACK(csize-asize, 0));
        insert_entry(bp);
    }else { 
        delete_entry(bp);
        PUT(HDRP(bp), PACK(csize, 1));
        PUT(FTRP(bp), PACK(csize, 1));
    }
}

/* 
 * find_fit - Find a fit for a block with asize bytes 
 */
static void *find_fit(size_t asize){
    /* First fit search */
    void *bp;

    // iterate free list
    for (bp = flist_head; bp && GET_SIZE(HDRP(bp)) > 0; bp = next_free(bp)) {
        if (asize <= GET_SIZE(HDRP(bp))) {
            return bp;
        }
    }
    return NULL; /* No fit */
}

static void printblock(void *bp) 
{
    size_t hsize, halloc, fsize, falloc;

    hsize = GET_SIZE(HDRP(bp));
    halloc = GET_ALLOC(HDRP(bp));  
    fsize = GET_SIZE(FTRP(bp));
    falloc = GET_ALLOC(FTRP(bp));  

    if (hsize == 0) {
        printf("%p: EOL\n", bp);
        return;
    }

    printf("%p: header: [%u:%c] footer: [%u:%c]\n", bp, 
    (unsigned)hsize, (halloc ? 'a' : 'f'), 
    (unsigned)fsize, (falloc ? 'a' : 'f'));
}

static int checkblock(void *bp) 
{
    if ((size_t)bp % 8) {
        printf("Error: %p is not doubleword aligned\n", bp);
        return -1;
    }
    if (GET(HDRP(bp)) != GET(FTRP(bp))) {
        printf("Error[%p]: header does not match footer\n", bp);
        return -1;
    }
    return 0;
}

static
void insert_entry(void * bp) {
    if (!flist_head) {
        // empty list
        flist_head = bp;
        flist_tail = bp;
        set_prev_free(bp, NULL);
        set_next_free(bp, NULL);
    } else {
        if ((char *)bp < flist_head) {
            // insert at head
            set_prev_free(flist_head, bp);
            set_next_free(bp, flist_head);
            set_prev_free(bp, NULL);
            flist_head = bp;
        } else if (flist_tail < (char *)bp) {
            // insert to tail
            set_next_free(flist_tail, bp);
            set_prev_free(bp, flist_tail);
            set_next_free(bp, NULL);
            flist_tail = bp;
        } else {
            // find some place in the list
            char * c = flist_head;
            while (c < (char *)bp) {
                c = next_free(c);
            }
            set_next_free(prev_free(c), bp);
            set_prev_free(bp, prev_free(c));
            set_prev_free(c, bp);
            set_next_free(bp, c);
        }
    }
}

static
void delete_entry(void * bp) {
    if (is_head(bp)) {
        flist_head = next_free(bp);
        if (flist_head) {
            set_prev_free(flist_head, NULL);
        } else {
            flist_tail = NULL;
        }
    } else if (is_tail(bp)) {
        flist_tail = prev_free(bp);
        if (flist_tail) {
            set_next_free(flist_tail, NULL);
        } else {
            flist_head = NULL;
        }
    } else {
        set_next_free(prev_free(bp), next_free(bp));
        set_prev_free(next_free(bp), prev_free(bp));
    }
}

static
int is_minimum_free(size_t s){
    return s >= (MINSIZE * WSIZE);
}