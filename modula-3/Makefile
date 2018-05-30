.PHONY: all clean

M3 ?= /usr/local/cm3/bin/cm3
M3 := $(M3) -O

all: AMD64_LINUX/Test AMD64_LINUX/Repl

AMD64_LINUX/Test: src/Test.m3 src/Util.m3 src/Util.i3
AMD64_LINUX/Repl: src/Repl.m3 src/Readline.m3 src/Readline.i3

AMD64_LINUX/%: src/%.m3
	$(M3) -D$*

clean:
	rm -rf AMD64_LINUX
