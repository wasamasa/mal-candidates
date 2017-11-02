RM = rm -f
.PHONY: all clean

all: mod_util.splb

mod_%.splb: %.spl
	splrun -N -x $@ $<

clean:
	$(RM) mod_util.splb
