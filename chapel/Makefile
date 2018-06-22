CHPL ?= chpl

.PHONY: all clean

%: %.chpl
	$(CHPL) $<

all: test

test: util.chpl test.chpl

clean:
	$(RM) test
