.PHONY: all clean
SIM = cim -H -c
LDLIBS = -lreadline -lhistory -lcim

%.o: %.sim
	$(SIM) $<

test: readline.o argv.o util.o test.o
repl: readline.o argv.o util.o repl.o

util.o: util.sim

test.o: test.sim util.o
repl.o: repl.sim util.o

clean:
	$(RM) *.o *.atr *.shl test repl
