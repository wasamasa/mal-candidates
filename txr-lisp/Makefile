TXR ?= txr

.PHONY: all clean

all: test.tlo repl.tlo

test.tlo: util.tlo

%.tlo: %.tl
	$(TXR) -e '(compile-file "$<")'

clean:
	$(RM) *.tlo
