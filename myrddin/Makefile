MYR = 6m
MYRRT += /usr/lib/myr/_myrrt.o
MYRFLAGS += -O .
MUSE = muse
MUSELIBS += -lreadline
LDFLAGS += --gc-sections -L/usr/lib/myr -L.
ARFLAGS = -rcs

COMPILE.myr = $(MYR) $(MYRFLAGS)
LINK.use = $(MUSE) $(LDFLAGS) $(MUSEFLAGS)
LINK.o = $(LD) $(LDFLAGS) $(LDLIBS) $(MYRRT)
LINK.glue.o = $(CC)

lib%.use: %.use
	$(MUSE) $(MUSELIBS) -o $@ -p $* $<

lib%.a: %.o
	$(AR) $(ARFLAGS) $@ $^

%.glue.o: %.glue.c
	$(LINK.glue.o) -c $^ $(LDLIBS) -o $@

%.use: %.myr
	$(COMPILE.myr) $<

%.o: %.myr
	$(COMPILE.myr) -I . -o $@ $<

%: %.o
	$(LINK.o) $< $(LDLIBS) -o $@

.PHONY: all clean

all: test repl
test: test.o util.o
test: LDLIBS += -lutil -lregex -lbio -lstd -lsys
test.o: test.myr util.myr libutil.use libutil.a
repl: repl.o libreadline.glue.o
repl: LDFLAGS += -dynamic-linker /lib64/ld-linux-x86-64.so.2
repl: LDLIBS += -llibreadline -lreadline -lbio -lfileutil -lstd -lsys
repl.o: repl.myr libreadline.myr liblibreadline.use liblibreadline.a
liblibreadline.a: libreadline.glue.o libreadline.o

clean:
	$(RM) *.a *.o *.use test repl
