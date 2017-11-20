.PHONY: all clean

RM = rm -f
RMR = rm -rf

all: box commandbox.properties

box.zip:
	curl -Lo box.zip https://www.ortussolutions.com/parent/download/commandbox/type/bin

box: box.zip
	unzip -fo $<

commandbox.properties:
	@printf 'commandbox_home=$(CURDIR)/.commandbox' > commandbox.properties

clean:
	$(RM) box box.zip commandbox.properties
	$(RMR) .commandbox
