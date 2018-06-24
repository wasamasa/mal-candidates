.PHONY: all clean

LDLIBS= -lgc
CFLAGS = -Wall -Wextra -Wpedantic -std=c99 -O2

all: test

test: test.o util.o
util.o: util.h

clean:
	$(RM) *.o test
