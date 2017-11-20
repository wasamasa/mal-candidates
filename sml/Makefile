.PHONY: all clean

RM = rm -f

all: test

test: test.sml util.sml
	polyc -o $@ $<

clean:
	$(RM) test
