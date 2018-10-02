UNICON ?= unicon
UNICONFLAGS += -s -O
IPL ?= /usr/lib/unicon/ipl/lib

COMPILE.unicon = IPATH=$(IPL):$(IPATH) $(UNICON) $(UNICONFLAGS)
LDLIBS += -lreadline

%.u: %.icn
	$(COMPILE.unicon) -c -o $@ $<

%: %.icn
	$(COMPILE.unicon) -o $@ $<

lib%.so: %.c
	$(CC) $(LDLIBS) $(CFLAGS) -shared -o $@ $<

.PHONY: all clean

all: test repl
test: util.u
repl: libcfunc.so

clean:
	$(RM) *.u *.so uniclass.* test repl
