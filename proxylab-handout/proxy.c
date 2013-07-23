#include <stdio.h>
#include "csapp.h"

#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400

static const char *user_agent = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n";
static const char *accepts = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n";
static const char *accept_encoding = "Accept-Encoding: gzip, deflate\r\n";


/*********************************
 * Function prototype
 *********************************/
void serve_client(int fd);
void request(int fd, char *hostp, char *pathp, int port);

void parse_header(rio_t *rp, char *hostp);
void client_error(int fd, char *cause, char *errnum, char *shortmsg, char *longmsg);
int parse_uri(char *uri, char *target_addr, char *path, int  *port);
void format_log_entry(char *logstring, struct sockaddr_in *sockaddr, char *uri, int size);


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
    while (1) {
        clientlen = sizeof(clientaddr);
        connfd = Accept(listenfd, (SA *)&clientaddr, (socklen_t*)&clientlen);
        #ifdef DEBUG
        printf("[Connected] %d\n", (int)connfd);
        #endif        
        serve_client(connfd);  
        Close(connfd); 
        #ifdef DEBUG
        printf("[Disconnected] %d\n", (int)connfd);
        #endif                
    }

    Close(listenfd);
    exit(0);
}

/*********************************
 * Internal Helper functions
 *********************************/
void serve_client(int fd) {
    char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE], host[MAXLINE], path[MAXLINE];
    int port;
    rio_t rio;
  
    /* Read request line and headers */
    Rio_readinitb(&rio, fd);
    Rio_readlineb(&rio, buf, MAXLINE);                   
    sscanf(buf, "%s %s %s", method, uri, version);       
    if (strcasecmp(method, "GET")) {                     
        client_error(fd, method, "501", "Not Implemented", "Does not implement this method");
        return;
    }
    if (strlen(uri) == 0) {
        client_error(fd, uri, "400", "Bad Request", "Missing uri");
        return;
    }
    if (strcasecmp(version, "HTTP/1.0")) {
        client_error(fd, version, "400", "Bad Request", "Version not match");
        return;
    }                                                                                                                                                            
    if (parse_uri(uri, host, path, &port) < 0) {
        client_error(fd, uri, "400", "Bad Request", "Malformed uri");
        return;
    }
    parse_header(&rio, host);
    request(fd, host, path, port);
}

void request(int proxyufd, char *hostp, char *pathp, int port) {
    rio_t rio;
    char buf[MAXLINE];
    int clientfd = Open_clientfd(hostp, port);

    Rio_readinitb(&rio, clientfd);
    sprintf(buf, "GET %s HTTP/1.0\r\n", pathp);
    #ifdef DEBUG
    printf("%s", buf);
    #endif
    Rio_writen(clientfd, buf, strlen(buf));

    sprintf(buf, "Host: %s\r\n", hostp);
    #ifdef DEBUG
    printf("%s", buf);
    #endif
    Rio_writen(clientfd, buf, strlen(buf));

    strcpy(buf, user_agent);
    #ifdef DEBUG
    printf("%s", buf);
    #endif
    Rio_writen(clientfd, buf, strlen(buf));

    strcpy(buf, accepts);
    #ifdef DEBUG
    printf("%s", accepts);
    #endif
    Rio_writen(clientfd, buf, strlen(buf));

    strcpy(buf, accept_encoding);
    #ifdef DEBUG
    printf("%s", accept_encoding);
    #endif
    Rio_writen(clientfd, buf, strlen(buf));

    sprintf(buf, "\r\n");
    #ifdef DEBUG
    printf("%s", buf);
    #endif    
    Rio_writen(clientfd, buf, strlen(buf));

    while (Rio_readlineb(&rio, buf, MAXLINE)) {
        Rio_writen(proxyufd, buf, strlen(buf));
    }
}

void parse_header(rio_t *rp, char *hostp) {
    #ifdef DEBUG
    printf("Reading headers.\n");
    #endif    
    char buf[MAXLINE];
    char *tok;

    Rio_readlineb(rp, buf, MAXLINE);
    while(strcmp(buf, "\r\n")) {
        #ifdef DEBUG
        printf("%s", buf);
        #endif
        tok = strchr(buf, ':');
        if (tok) {
            *tok = '\0';
            if (!strcmp(buf, "Host")) {
                tok = tok + 2;
                tok[strlen(tok)-2] = '\0';
                strcpy(hostp, tok);
            }
        }
        Rio_readlineb(rp, buf, MAXLINE);
    }
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
    Rio_writen(fd, buf, strlen(buf));
    sprintf(buf, "Content-type: text/html\r\n");
    Rio_writen(fd, buf, strlen(buf));
    sprintf(buf, "Content-length: %d\r\n\r\n", (int)strlen(body));
    Rio_writen(fd, buf, strlen(buf));
    Rio_writen(fd, body, strlen(body));
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
        hostbegin[strlen(hostbegin)] = '/';
        hostbegin[strlen(hostbegin)+1] = '\0';        
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

/*
 * format_log_entry - Create a formatted log entry in logstring. 
 * 
 * The inputs are the socket address of the requesting client
 * (sockaddr), the URI from the request (uri), and the size in bytes
 * of the response from the server (size).
 */
void format_log_entry(char *logstring, struct sockaddr_in *sockaddr, 
              char *uri, int size)
{
    time_t now;
    char time_str[MAXLINE];
    unsigned long host;
    unsigned char a, b, c, d;

    /* Get a formatted time string */
    now = time(NULL);
    strftime(time_str, MAXLINE, "%a %d %b %Y %H:%M:%S %Z", localtime(&now));

    /* 
     * Convert the IP address in network byte order to dotted decimal
     * form. Note that we could have used inet_ntoa, but chose not to
     * because inet_ntoa is a Class 3 thread unsafe function that
     * returns a pointer to a static variable (Ch 13, CS:APP).
     */
    host = ntohl(sockaddr->sin_addr.s_addr);
    a = host >> 24;
    b = (host >> 16) & 0xff;
    c = (host >> 8) & 0xff;
    d = host & 0xff;


    /* Return the formatted log entry string */
    sprintf(logstring, "%s: %d.%d.%d.%d %s", time_str, a, b, c, d, uri);
}