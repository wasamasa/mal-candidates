RM = rm -f

.PHONY: all clean

all: sclang_conf.yaml

sclang_conf.yaml:
	@printf 'includePaths:\n  - $(CURDIR)/lib\n' > sclang_conf.yaml

clean:
	$(RM) sclang_conf.yaml
