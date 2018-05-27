.PHONY: clean

JAVA ?= /usr/bin/java
ASC ?= /usr/lib/redtamarin/support/asc2.jar
ASRUNTIME ?= /usr/lib/redtamarin/lib/redtamarin.abc

all: test.abc

test.abc: util.as3

%.abc: %.as3
	$(JAVA) -jar $(ASC) -import $(ASRUNTIME) $<

clean:
	$(RM) *.abc
