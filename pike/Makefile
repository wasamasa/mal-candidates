.PHONY: clean

PIKE ?= pike

Readline.pmod/module.so:
	cd Readline.pmod && $(PIKE) -x module

clean:
	cd Readline.pmod && $(RM) -r *.cache *.c *.log *.o *.status *.so \
	configure dependencies linker_options make_variables \
	Makefile modlist_segment propagated_variables stamp-h
