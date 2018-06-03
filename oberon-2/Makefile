.PHONY: all clean

LDLIBS = -lreadline

OBNC ?= obnc
OBNC := LDLIBS=$(LDLIBS) $(OBNC)

all: Test Repl

Test: Test.obn Util.obn
Repl: Repl.obn Readline.obn Readline.c Readline.h

%: %.obn
	$(OBNC) $<

clean:
	rm -rf .obnc
	$(RM) Test Repl
