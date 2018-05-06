.PHONY = all clean

INFERNO_ROOT = $(INFERNO_ROOT)
INFERNO_ROOT := /usr/local/inferno
LIMBO = $(INFERNO_ROOT)/Linux/386/bin/limbo -I/ -w

all: test.dis util.dis

util.dis: util.m

%.dis: %.b
	$(LIMBO) $<

clean:
	$(RM) *.dis
