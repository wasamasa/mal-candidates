RM = rm -f
.PHONY: all clean

all: mod_util.splb mod_readline.so

mod_%.splb: %.spl
	splrun -N -x $@ $<

mod_%.so: %.c
	$(CC) -shared -o $@ $<

clean:
	$(RM) mod_util.splb
	$(RM) mod_readline.so
