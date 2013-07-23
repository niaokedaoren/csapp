#include <stdio.h>
#include "csapp.h"

/*********************************
 * Variables and Types
 *********************************/
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400
#define MAX_HEADER 40

static char *user_agent[2] = {"User-Agent", "Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3"};
static char *accepts[2] = {"Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"};
static char *accept_encoding[2] = {"Accept-Encoding", "gzip, deflate"};
static char *connections[2] = {"Connection", "close"};
static char *proxy_conns[2] = {"Proxy-Connection", "close"};

typedef char header_t[MAX_HEADER][2][MAXLINE];

jmp_buf pipe_buf; /* non-local return for SIGPIPE handler */
jmp_buf error_buf; /* non-local return for IO error */

/*********************************
 * Function prototype
 *********************************/
void serve_client(int fd);
void request(int fd, char *hostp, char *pathp, int port, header_t headers, int hc);

int need_header(char *k, header_t headers, int *hc);
void append_header(char *k, char *v, header_t headers, int *hc);
int parse_header(rio_t *rp, header_t headers, int *hc);
int is_header(char *s);
void client_error(int fd, char *cause, char *errnum, char *shortmsg, char *longmsg);
int parse_uri(char *uri, char *target_addr, char *path, int  *port);

void sigpipe_handler(int sig);

/* my own wrapper of rio package, suffix _p means polite. */
void Rio_writen_p(int fd, void *usrbuf, size_t n);

#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
#else
# define dbg_printf(...)
#endif


int main(int argc, char **argv){
    int listenfd, connfd, port, clientlen;
    struct sockaddr_in clientaddr;

    /* Check arguments */
    if (argc != 2) {
       fprintf(stderr, "Usage: %s <port number>\n", argv[0]);
       exit(0);
    }
    port = atoi(argv[1]);
    listenfd = Open_listenfd(port);

    /* installing signal handler */
    Signal(SIGPIPE, sigpipe_handler);

    while (1) {
        clientlen = sizeof(clientaddr);
        connfd = Accept(listenfd, (SA *)&clientaddr, (socklen_t*)&clientlen);
        dbg_printf("[Connected %d]\n", (int)connfd);
        serve_client(connfd);  
        Close(connfd); 
        dbg_printf("[Disconnected %d]\n", (int)connfd);
    }
    dbg_printf("server dies....\n");
    Close(listenfd);
    exit(0);
}

/*********************************
 * Internal Helper functions
 *********************************/
void serve_client(int fd) {
    char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE], host[MAXLINE], path[MAXLINE];
    header_t headers; /* header provided by user agent and proxy server */
    int hc = 0; /* header count */
    int port, rc;
    rio_t rio;
  
    rc = sigsetjmp(pipe_buf, 1);
    if (rc != 0) 
        return; /* back from error(SIGPIPE), return and continue */
    rc = setjmp(error_buf);
    if (rc != 0)
        return; /* back from various error, return and continue */

    /* Read request line and headers */
    Rio_readinitb(&rio, fd);
    if (Rio_readlineb(&rio, buf, MAXLINE) <= 0)
        return;
    sscanf(buf, "%s %s %s", method, uri, version);       
    if (strcasecmp(method, "GET")) {                     
        client_error(fd, method, "501", "Not Implemented", "Does not implement this method");
        return;
    }
    if (strlen(uri) == 0) {
        client_error(fd, uri, "400", "Bad Request", "Missing uri");
        return;
    }
    if (strcasecmp(version, "HTTP/1.0") && strcasecmp(version, "HTTP/1.1")) {
        client_error(fd, version, "400", "Bad Request", "Version not match");
        return;
    }                                                                                                                                                            
    if (parse_uri(uri, host, path, &port) < 0) {
        client_error(fd, uri, "400", "Bad Request", "Malformed uri");
        return;
    }
    if (parse_header(&rio, headers, &hc) < 0) {
        client_error(fd, uri, "400", "Bad Request", "Incomplete requset");
        return;
    }
    append_header(user_agent[0], user_agent[1], headers, &hc);
    append_header(accepts[0], accepts[1], headers, &hc);
    append_header(accept_encoding[0], accept_encoding[1], headers, &hc);
    append_header(connections[0], connections[1], headers, &hc);
    append_header(proxy_conns[0], proxy_conns[1], headers, &hc);
    if (need_header("Host", headers, &hc)) 
        append_header("Host", host, headers, &hc);
    request(fd, host, path, port, headers, hc);
}

int parse_header(rio_t *rp, header_t headersp, int *hc) {
    *hc = 0;
    char buf[MAXLINE], k[MAXLINE], v[MAXLINE];
    char *tok;

    if (Rio_readlineb(rp, buf, MAXLINE) <= 0)
        return -1; // user cancel input

    while(strcmp(buf, "\r\n") && strcmp(buf, "\n")) {
        tok = strchr(buf, ':');
        if (!tok) {
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

void request(int proxyufd, char *hostp, char *pathp, int port, header_t headers, int hc) {
    dbg_printf("[request %d] started.\n", (int)proxyufd);
    rio_t rio;
    char buf[MAXLINE];
    int clientfd = Open_clientfd(hostp, port);

    Rio_readinitb(&rio, clientfd);
    sprintf(buf, "GET %s HTTP/1.0\r\n", pathp);
    dbg_printf("[request %d] %s", (int)proxyufd, buf);
    Rio_writen_p(clientfd, buf, strlen(buf));

    int i;
    for (i = 0; i < hc; ++i) {
        sprintf(buf, "%s: %s\r\n", headers[i][0], headers[i][1]);
        Rio_writen_p(clientfd, buf, strlen(buf));
    }

    sprintf(buf, "\r\n");
    Rio_writen_p(clientfd, buf, strlen(buf));

    i = 0;
    dbg_printf("[request %d] forwarding.", (int)proxyufd);
    while (Rio_readlineb(&rio, buf, MAXLINE)) {
        i++;
        if (i % 10 == 0)
            dbg_printf(".");
        Rio_writen_p(proxyufd, buf, strlen(buf));
    }
    dbg_printf("\n[request %d] forwarding done.\n", (int)proxyufd);    
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
    Rio_writen_p(fd, buf, strlen(buf));
    sprintf(buf, "Content-type: text/html\r\n");
    Rio_writen_p(fd, buf, strlen(buf));
    sprintf(buf, "Content-length: %d\r\n\r\n", (int)strlen(body));
    Rio_writen_p(fd, buf, strlen(buf));
    Rio_writen_p(fd, body, strlen(body));
}

/*
 * parse_uri - URI parser
 * 
 * Given a URI from an HTTP proxy GET request (i.e., a URL), extract
 * the host name, path name, and port.  The memory for hostname and
 * pathname must already be allocated and should be at least MAXLINE
 * bytes. Return -1 if there are any problems.
 */
int parse_uri(char *uri, char *hostname, char *pathname, int *port)
{
    char *hostbegin;
    char *hostend;
    char *pathbegin;
    int len;

    if (strncasecmp(uri, "http://", 7) != 0) {
       hostname[0] = '\0';
       return -1;
    }
       
    /* Extract the host name */
    hostbegin = uri + 7;
    hostend = strpbrk(hostbegin, " :/\r\n\0");
    if (!hostend) {
        hostend = hostbegin + strlen(hostbegin);
        hostend[0] = '/';
        hostend[1] = '\0';
    }
    len = hostend - hostbegin;
    strncpy(hostname, hostbegin, len);
    hostname[len] = '\0';
    
    /* Extract the port number */
    *port = 80; /* default */
    if (hostend && *hostend == ':')   
        *port = atoi(hostend + 1);
    
    /* Extract the path */
    pathbegin = strchr(hostbegin, '/');
    if (pathbegin == NULL) {
        pathname[0] = '/';
        pathname[1] = '\0';
    } else {
        strcpy(pathname, pathbegin);
    }
    return 0;
}

int need_header(char *k, header_t headers, int *hc) {
    // preset headers
    if (!strcmp(k, "User-Agent")) return 0;
    if (!strcmp(k, "Accepts")) return 0;
    if (!strcmp(k, "Accept-Encoding")) return 0;
    if (!strcmp(k, "Connection")) return 0;
    if (!strcmp(k, "Proxy-Connection")) return 0;                
    int i;
    for (i = 0; i < *hc; ++i) {
        if (!strcmp(headers[i][0], k)) return 0; // exist
    }
    return 1;
}

void append_header(char *k, char *v, header_t headers, int *hc) {
    strcpy(headers[*hc][0], k);
    strcpy(headers[*hc][1], v);    
    *hc = *hc + 1;
}

void sigpipe_handler(int sig) {
    dbg_printf("[Error]SIGPIPE caught, recovered.\n");        
    siglongjmp(pipe_buf, -1);
}

void Rio_writen_p(int fd, void *usrbuf, size_t n) {
    if (rio_writen(fd, usrbuf, n) != n) {
        switch (errno) {
        case ECONNRESET:
            dbg_printf("[Error]connection reset caught, recovered.\n");
            longjmp(error_buf, -1);
        default:
            dbg_printf("[Error]Unknown.");                
        }
    }
}

