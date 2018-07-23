MBLD ?= mbld

.PHONY: all clean

all: obj/test obj/repl

obj/test: util.myr test.myr
obj/repl: repl.myr libreadline.myr libreadline.glue.c

obj/%: %.myr
	$(MBLD) -I obj

clean:
	$(MBLD) clean
