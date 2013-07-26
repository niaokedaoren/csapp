#include <stdio.h>
#include "csapp.h"
#include "sbuf.h"
#include "cache.h"
#include "util.h"

/*********************************
 * Variables and Types
 *********************************/
#define POOL_SIZE 4 /* thread pool size */
#define SBUFSIZE  16 

static char *user_agent[2] = {"User-Agent", "Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3"};
static char *accepts[2] = {"Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"};
static char *accept_encoding[2] = {"Accept-Encoding", "gzip, deflate"};
static char *connections[2] = {"Connection", "close"};
static char *proxy_conns[2] = {"Proxy-Connection", "close"};

static sbuf_t sbuf; /* shared buffer of connected descriptors */

/* exceptional control for thread */
typedef struct {
    pthread_t tid;
    jmp_buf pipe_buf;
    jmp_buf error_buf;
} thread_control_t;

typedef struct sockaddr_in SAI;

thread_control_t threads[POOL_SIZE];
static cache_t cache;

/*********************************
 * Function prototype
 *********************************/
/* work thread main routine */
void* thread(void * p); 

/* serve one connection */
void  serve_client(int fd);

/* request as a proxy and send back response to client */
void  request(int fd, char *uri, char *hp, char *pathp, 
              int port, header_t hs, int hc);

/* return current thread's index in thread pool */
int   thread_control_index(pthread_t tid);

/* SIGPIPE handler */
void  sigpipe_handler(int sig);

/* reply client about error */
void  client_error(int fd, char *cause, char *errnum, 
                   char *shortmsg, char *longmsg);

/* parse client's request method line */
int   parse_method(int fd, char *buf, char *method, char *uri, 
                   char *version, char *host, char *path, int *port);

/* parse client's request's header */
int   parse_header(rio_t *rp, header_t headers, int *hc, int fd, char *uri);

/* shoe some cache stats */ 
void* report_cache(void *p);

/* my own wrapper of rio package, suffix _p means polite. */
void rio_writen_p(int fd, void *usrbuf, size_t n);
int  open_clientfd_p(char *hostname, int port);

/*
 * main thread create a thread pool and go to a busy loop, which tirelessly accept 
 * new connections and insert it into a thread-safe buffer.
 *
 * worker thread run in a loop that pop a connection's file descriptor from shared 
 * buffer and proxy the traffic for that connection
 */
int main(int argc, char **argv){
    int listenfd;
    int connfd;
    int port;
    int clientlen;
    long i;
    SAI clientaddr;
    pthread_t tid;

    /* Check arguments */
    if (argc != 2) {
       fprintf(stderr, "Usage: %s <port number>\n", argv[0]);
       exit(0);
    }
    port = atoi(argv[1]);
    listenfd = Open_listenfd(port);
    /* init shared buffer */
    sbuf_init(&sbuf, SBUFSIZE);
    /* init web object cache */
    cache_init(&cache);

    dbg_printf("Proxy server running...\n");
    for (i = 0; i < POOL_SIZE; i++)  { /* Create worker threads */
        Pthread_create(&tid, NULL, thread, (void*)i);
    }

#ifdef DEBUG
    Pthread_create(&tid, NULL, report_cache, NULL);
#endif    

    /* installing signal handler */
    Signal(SIGPIPE, sigpipe_handler);

    clientlen = sizeof(clientaddr);
    while (1) {
        connfd = Accept(listenfd, (SA *)&clientaddr, (socklen_t*)&clientlen);
        sbuf_insert(&sbuf, connfd); /* Insert connfd in buffer */
    }
    dbg_printf("server dies....\n");
    Close(listenfd);
    exit(0);
}

/*********************************
 * Internal Helper functions
 *********************************/
void *thread(void *p) {
    Pthread_detach(pthread_self());
    long i = (long)p;
    threads[i].tid = pthread_self();
    dbg_printf("Worker %ld up.\n", i);
    while (1) { 
        int connfd = sbuf_remove(&sbuf); /* Remove connfd from buffer */
        serve_client(connfd);            /* Service client */
        Close(connfd);
    }
    return NULL;
} 

void serve_client(int fd) {
    char buf[MAXLINE];
    char method[MAXLINE];
    char uri[MAXLINE];
    char version[MAXLINE];
    char host[MAXLINE];
    char path[MAXLINE];
    header_t headers; 
    int hc = 0; /* header count */
    int port = 80;
    rio_t rio;

    dbg_printf("[Connected %d]\n", (int)fd);

    /* Read request line and headers */
    Rio_readinitb(&rio, fd);
    if (Rio_readlineb(&rio, buf, MAXLINE) <= 0) return;
    if (parse_method(fd, buf, method, uri, version, host, path, &port) < 0) return;
    if (parse_header(&rio, headers, &hc, fd, uri) < 0) return;

    /* construct header */
    append_header(user_agent[0], user_agent[1], headers, &hc);
    append_header(accepts[0], accepts[1], headers, &hc);
    append_header(accept_encoding[0], accept_encoding[1], headers, &hc);
    append_header(connections[0], connections[1], headers, &hc);
    append_header(proxy_conns[0], proxy_conns[1], headers, &hc);
    if (need_header("Host", headers, &hc)) 
        append_header("Host", host, headers, &hc);

    request(fd, uri, host, path, port, headers, hc);
    dbg_printf("[Disconnected %d]\n", (int)fd);
}

void request(int reply_to_fd, char *uri, char *hostp, 
             char *pathp, int port, header_t headers, int hc) {
    rio_t rio;
    char buf[MAXLINE];
    char data[MAX_OBJECT_SIZE];
    int data_size = 0, i;
    int clientfd = open_clientfd_p(hostp, port);
    if (clientfd < 0) {
        client_error(reply_to_fd, "", "1000", "DNS failed", "DNS failed");
        return;
    }

    dbg_printf("[request %d] started.\n", (int)reply_to_fd);

    /* control return to here from errors(SIGPIPE, ECONNRESET, close file descriptors and exit */
    int ctrl_index = thread_control_index(pthread_self());
    if (ctrl_index < 0) {
        dbg_printf("[Error]thread do not have related jmp_buf.\n");
        return;
    }
    if (setjmp(threads[ctrl_index].error_buf) != 0) {  /* back from ECONNRESET */
        /* may jmp here cause clientfd create failure */
        if(clientfd > 0) Close(clientfd); 
        return; 
    }
    if (sigsetjmp(threads[ctrl_index].pipe_buf, 1) != 0) { /* back from SIGPIPE */
        /* may jmp here cause clientfd create failure */
        if(clientfd > 0) Close(clientfd); 
        return; 
    }

    int hit = find_hit(&cache, uri);
    if (hit >= 0) { /* hit */
        get_hit(&cache, uri, data, &data_size);
        dbg_printf("[request %d] cache hit, %d bytes.\n", (int)reply_to_fd, data_size);
        dbg_printf("[request %d] forwarding.", (int)reply_to_fd);
        rio_writen_p(reply_to_fd, data, data_size);
        Close(clientfd);
        dbg_printf("\n[request %d] forwarding done.\n", (int)reply_to_fd);        
    } else { /* miss */
        /* send request */
        Rio_readinitb(&rio, clientfd);
        sprintf(buf, "GET %s HTTP/1.0\r\n", pathp);
        dbg_printf("[request %d] %s", (int)reply_to_fd, buf);
        rio_writen_p(clientfd, buf, strlen(buf));
        for (i = 0; i < hc; ++i) {
            sprintf(buf, "%s: %s\r\n", headers[i][0], headers[i][1]);
            rio_writen_p(clientfd, buf, strlen(buf));
        }
        sprintf(buf, "\r\n");
        rio_writen_p(clientfd, buf, strlen(buf));
        
        /* receive response */
        i = 0;
        int byteread;
        char *current = data;
        dbg_printf("[request %d] forwarding.\n", (int)reply_to_fd);
        while ((byteread = Rio_readnb(&rio, buf, MAXLINE))) {
            data_size += byteread;
            if (data_size <= MAX_OBJECT_SIZE) {
                memcpy(current, buf, byteread);
                current += byteread;
            }
            rio_writen_p(reply_to_fd, buf, strlen(buf));
        }

        /* update cache */
        if (data_size <= MAX_OBJECT_SIZE) {
            if (data_size + cache.total_size <= MAX_CACHE_SIZE) { 
                // store
                store(&cache, uri, data, data_size);
                dbg_printf("[request %d] cache miss, store %d bytes.\n", (int)reply_to_fd, data_size);
            } else { 
                // evict
                evict(&cache, uri, data, data_size);
                dbg_printf("[request %d] cache miss, evict %d bytes.\n", (int)reply_to_fd, data_size);
            }
        }
        Close(clientfd);
        dbg_printf("[request %d] forwarding done, %d bytes.\n", (int)reply_to_fd, data_size);    
    }
}

void rio_writen_p(int fd, void *usrbuf, size_t n) {
    if (rio_writen(fd, usrbuf, n) != n) {
        switch (errno) {
        case ECONNRESET:
            dbg_printf("[Error]connection reset caught, recovered.\n");
            int ctrl_index = thread_control_index(pthread_self());
            longjmp(threads[ctrl_index].error_buf, -1);
        default:
            dbg_printf("[Error]Unknown.");                
        }
    }
}

int open_clientfd_p(char *hostname, int port) {
    struct addrinfo hints;
    struct addrinfo *result, *rp;
    char portp[20];
    int sfd, s;

    sprintf(portp, "%d", port);
    /* Obtain address(es) matching host/port */
    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_family = AF_INET;    /* Allow IPv4 */
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = 0;
    hints.ai_protocol = 0;          /* Any protocol */

    s = getaddrinfo(hostname, portp, &hints, &result);
    if (s != 0) {
        dbg_printf("[Error]getaddrinfo: %s\n", gai_strerror(s));
        return -1;
    }

    /* getaddrinfo() returns a list of address structures.
       Try each address until we successfully connect(2).
       If socket(2) (or connect(2)) fails, we (close the socket
       and) try the next address. */

    for (rp = result; rp != NULL; rp = rp->ai_next) {
        sfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
        dbg_printf("[DNS]%s(%s:%d)\n", hostname, 
            inet_ntoa(((SAI*)(rp->ai_addr))->sin_addr), ntohs(((SAI*)(rp->ai_addr))->sin_port));
        if (sfd == -1)
            continue;
        if (connect(sfd, rp->ai_addr, rp->ai_addrlen) != -1)
            return sfd;                  /* Success */
    }

    if (rp == NULL) {               /* No address succeeded */
        dbg_printf("[Error]Could not connect\n");
        return -1;
    }
    return -1;
}

int thread_control_index(pthread_t tid) {
    int i;
    for (i = 0; i < POOL_SIZE; ++i) {
        if (threads[i].tid == tid) {
            return i;
        }
    }
    return -1;
}

void sigpipe_handler(int sig) {
    dbg_printf("[Error]SIGPIPE caught, recovered.\n");
    int ctrl_index = thread_control_index(pthread_self());
    siglongjmp(threads[ctrl_index].pipe_buf, -1);
}

void client_error(int fd, char *cause, char *errnum, char *shortmsg, char *longmsg) {
    char buf[MAXLINE], body[MAXBUF];

    /* Build the HTTP response body */
    sprintf(body, "<html><title>Tiny Error</title>");
    sprintf(body, "%s<body bgcolor=""ffffff"">\r\n", body);
    sprintf(body, "%s%s: %s\r\n", body, errnum, shortmsg);
    sprintf(body, "%s<p>%s: %s\r\n", body, longmsg, cause);
    sprintf(body, "%s<hr><em>The Tiny Web server</em>\r\n", body);

    /* Print the HTTP response */
    sprintf(buf, "HTTP/1.0 %s %s\r\n", errnum, shortmsg);
    rio_writen_p(fd, buf, strlen(buf));
    sprintf(buf, "Content-type: text/html\r\n");
    rio_writen_p(fd, buf, strlen(buf));
    sprintf(buf, "Content-length: %d\r\n\r\n", (int)strlen(body));
    rio_writen_p(fd, buf, strlen(buf));
    rio_writen_p(fd, body, strlen(body));
}

int parse_method(int fd, char *buf, char *method, char *uri, char *version, char *host, char *path, int *port) {
    sscanf(buf, "%s %s %s", method, uri, version);       
    if (strcasecmp(method, "GET")) {                     
        client_error(fd, method, "501", "Not Implemented", "Does not implement this method");
        return -1;
    }
    if (strlen(uri) == 0) {
        client_error(fd, uri, "400", "Bad Request", "Missing uri");
        return -1;
    }
    if (strcasecmp(version, "HTTP/1.0") && strcasecmp(version, "HTTP/1.1")) {
        client_error(fd, version, "400", "Bad Request", "Version not match");
        return -1;
    }                                                                                                                                                            
    if (parse_uri(uri, host, path, port) < 0) {
        client_error(fd, uri, "400", "Bad Request", "Malformed uri");
        return -1;
    }
    return 0;
}

int parse_header(rio_t *rp, header_t headersp, int *hc, int fd, char *uri) {
    dbg_printf("parsing header.\n");
    *hc = 0;
    char buf[MAXLINE], k[MAXLINE], v[MAXLINE];
    char *tok;

    if (Rio_readlineb(rp, buf, MAXLINE) <= 0){
        client_error(fd, uri, "400", "Bad Request", "Incomplete requset");
        return -1; // usr cancel input
    }

    while(strcmp(buf, "\r\n") && strcmp(buf, "\n")) {
        tok = strchr(buf, ':');
        if (!tok) {
            client_error(fd, uri, "400", "Bad Request", "Bad header");
            return -1; // not key-value pair
        } else {
            *tok = '\0';
            strcpy(k, buf);
            tok += 1;
            if (strlen(tok) < 3) return -1; // value too short
            tok[strlen(tok)-2] = '\0';
            strcpy(v, tok+1);
            if (need_header(k, headersp, hc)) {
                append_header(k, v, headersp, hc);
            }
        }
        Rio_readlineb(rp, buf, MAXLINE);
    }
    return 0;
}

void *report_cache(void *p) {
    Pthread_detach(pthread_self());
    while (1) {
        printf("/****************************************\n");
        printf(" * total_size:%d, items:%d\n", cache.total_size, cache.item_count);
        int i = 0;
        cache_item_t *h = cache.head;
        while (h) {
            printf(" * %d . tag(%s), size(%d), age(%d)\n", i, h->tag, h->size, h->age);
            i++;
            h = h->next;
        }
        printf(" ****************************************/\n");        
        Sleep(5);
    }
    return NULL;
}
