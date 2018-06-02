.PHONY: all clean

OBNC ?= obnc

all: Test

Test: Test.obn Util.obn

%: %.obn
	$(OBNC) $<

clean:
	rm -rf .obnc
	$(RM) Test
