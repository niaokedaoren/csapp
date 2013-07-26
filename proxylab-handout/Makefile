CC = gcc
CFLAGS = -g -Wall -DDEBUG
LDFLAGS = -lpthread

all: proxy

csapp.o: csapp.c csapp.h
	$(CC) $(CFLAGS) -c csapp.c

sbuf.o: sbuf.c sbuf.h
	$(CC) $(CFLAGS) -c sbuf.c	

cache.o: cache.c cache.h	
	$(CC) $(CFLAGS) -c cache.c		

util.o: util.c util.h	
	$(CC) $(CFLAGS) -c util.c		

proxy.o: proxy.c csapp.h
	$(CC) $(CFLAGS) -c proxy.c

proxy: proxy.o csapp.o sbuf.o cache.o util.o

submit:
	(make clean; cd ..; tar cvf proxylab.tar proxylab-handout)

clean:
	rm -f *~ *.o proxy core

