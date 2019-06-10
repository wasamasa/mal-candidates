.PHONY: all clean

CFLAGS = -fPIC -I. -std=gnu99 -Wall
LDLIBS = -lhistory -lreadline

all: readline.so

%.so: %.o
	$(LD) -shared $(LDFLAGS) $(LDLIBS) -o $@ $<

clean:
	$(RM) readline.so
