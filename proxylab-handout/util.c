#include "util.h"

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