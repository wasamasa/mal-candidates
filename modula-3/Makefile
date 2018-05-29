.PHONY: clean

M3 ?= /usr/local/cm3/bin/cm3
M3 := $(M3) -O

AMD64_LINUX/Test: src/Test.m3 src/Util.m3 src/Util.i3

AMD64_LINUX/%: src/%.m3
	$(M3)

clean:
	rm -rf AMD64_LINUX
