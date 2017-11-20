.PHONY: all clean

all: mod_util.splb mod_readline.so

mod_%.splb: mod_%.spl
	splrun -N -x $@ $<

mod_%.so: mod_%.c
	$(CC) -shared -o $@ $<

clean:
	$(RM) mod_util.splb mod_readline.so
