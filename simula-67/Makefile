.PHONY: all clean
SIM = cim -H
SIMO = $(SIM) -c
LIBS = -lreadline -lhistory -lcim

test: readline.o argv.o util.o test.o
	$(CC) $(LIBS) -o $@ $^

readline.o: readline.c
	$(CC) -c -o $@ $<

argv.o: argv.c
	$(CC) -c -o $@ $<

util.o: util.sim
	$(SIM) $<

test.o: test.sim util.o
	$(SIMO) $<

repl: readline.o argv.o util.o repl.o
	$(CC) $(LIBS) -o $@ $^

repl.o: repl.sim util.o
	$(SIMO) $<

clean:
	$(RM) *.o *.atr *.shl test repl
