.PHONY: clean

JAVA = $(JAVA)
JAVA := /usr/bin/java
ASC = $(ASC)
ASC := /usr/lib/redtamarin/support/asc2.jar
ASRUNTIME = $(ASRUNTIME)
ASRUNTIME := /usr/lib/redtamarin/lib/redtamarin.abc

all: test.abc

test.abc: util.as3

%.abc: %.as3
	$(JAVA) -jar $(ASC) -import $(ASRUNTIME) $<

clean:
	$(RM) *.abc
