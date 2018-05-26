.PHONY: all clean
SIM = cim -H
SIMO = $(SIM) -c
LIBS = -lreadline -lcim

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

clean:
	$(RM) *.o *.atr *.shl test
