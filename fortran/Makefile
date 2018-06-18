FC = gfortran
FFLAGS = -std=f2008 -Wall -Wextra -Wpedantic -Waliasing -Wsurprising
COMPILE.f90 = $(FC) $(FFLAGS)

.PHONY: all clean

all: test

test.o: util.o
test: util.o test.o

%.o: %.f90
	$(COMPILE.f90) -c $<

%: %.o
	$(COMPILE.f90) -o $@ $^

clean:
	$(RM) *.o *.mod test
