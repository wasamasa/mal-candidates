VALAC = valac
GEEFLAGS = --pkg gee-0.8
RLFLAGS = --pkg readline -X -lreadline
GIOFLAGS = --pkg gio-2.0
BINARIES = test repl

.PHONY: all clean

all: $(BINARIES)

test: test.vala util.vala
	$(VALAC) $(GEEFLAGS) $^

repl: repl.vala
	$(VALAC) $(RLFLAGS) $(GIOFLAGS) $^

clean:
	$(RM) $(BINARIES)
