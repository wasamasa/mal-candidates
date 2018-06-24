.PHONY: all clean

LDLIBS= -lgc -lreadline
CFLAGS = -Wall -Wextra -Wpedantic -std=c99 -O2

all: test repl

test: test.o util.o
repl: repl.o
util.o: util.h

clean:
	$(RM) *.o test repl
