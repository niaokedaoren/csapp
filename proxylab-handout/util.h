#ifndef _UTIL_H_
#define _UTIL_H_

#include "csapp.h"

#define MAX_HEADER 40

#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
#else
# define dbg_printf(...)
#endif

/* store HTTP request header */
typedef char header_t[MAX_HEADER][2][MAXLINE]; 

int   need_header(char *k, header_t headers, int *hc);
void  append_header(char *k, char *v, header_t headers, int *hc);
int   parse_uri(char *uri, char *target_addr, char *path, int  *port);

#endif