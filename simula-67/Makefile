.PHONY: all clean
SIM = cim -H
SIMO = $(SIM) -c
LDLIBS = -lreadline -lhistory -lcim

test: readline.o argv.o util.o test.o

util.o: util.sim
	$(SIM) $<

test.o: test.sim util.o
	$(SIMO) $<

repl: readline.o argv.o util.o repl.o

repl.o: repl.sim util.o
	$(SIMO) $<

clean:
	$(RM) *.o *.atr *.shl test repl
