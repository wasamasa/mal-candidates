.PHONY: all clean

all: test

test: test.sml util.sml
	polyc -o $@ $<

clean:
	$(RM) test
