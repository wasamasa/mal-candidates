MBLD ?= mbld

.PHONY: all clean

all: obj/test

obj/test: util.myr test.myr

obj/%: %.myr
	$(MBLD) -I obj

clean:
	$(MBLD) clean
