FC = gfortran
FFLAGS = -std=f2008 -Wall -Wextra -Wpedantic -Waliasing -Wsurprising
COMPILE.f90 = $(FC) $(FFLAGS) $(LDLIBS)
LDLIBS = -lreadline

.PHONY: all clean

all: test repl

test.o: util.o
test: util.o test.o
repl.o: iso_readline.o readline.o
repl: iso_readline.o readline.o repl.o

%.o: %.f90
	$(COMPILE.f90) -c $<

%: %.o
	$(COMPILE.f90) -o $@ $^

clean:
	$(RM) *.o *.mod test repl
