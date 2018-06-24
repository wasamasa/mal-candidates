CHPL ?= chpl

.PHONY: all clean

%: %.chpl
	$(CHPL) $<

all: test repl

test: util.chpl test.chpl
repl: repl.chpl

clean:
	$(RM) test repl
