.PHONY: all clean

RM = rm -f

all: repl

repl: repl.red
	bash -c "red -r $<"

clean:
	$(RM) repl
