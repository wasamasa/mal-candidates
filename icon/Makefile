ICONT ?= icont
ICONTFLAGS += -s
ICONLIB ?= /usr/share/icon/lib

COMPILE.icon = IPATH=$(IPATH):$(ICONLIB) $(ICONT) $(ICONTFLAGS)
CFLAGS += -I$(ICONLIB)
LDLIBS += -lreadline

%.u1 %.u2: %.icn
	$(COMPILE.icon) -c $<

%: %.icn
	$(COMPILE.icon) -o $@ $<

lib%.so: %.c
	$(CC) $(LDLIBS) $(CFLAGS) -shared -o $@ $<

.PHONY: all clean

all: libcfunc.so test repl
test: util.u1 util.u2

clean:
	$(RM) *.u1 *.u2 *.so test repl
