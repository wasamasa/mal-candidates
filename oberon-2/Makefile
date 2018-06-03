.PHONY: all clean

LDLIBS = -lreadline

OBNC ?= obnc

all: Test Repl

Test: Test.obn Util.obn
Repl: Repl.obn Readline.obn Readline.c Readline.h

%: %.obn
	LDLIBS=$(LDLIBS) $(OBNC) $<

clean:
	rm -rf .obnc
	$(RM) Test Repl
