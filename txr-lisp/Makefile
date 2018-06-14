TXR ?= txr

.PHONY: all clean

all: test.tlo repl.tlo

test.tlo: util.tlo

# txr evals all top-level forms on compilation, so code reading user
# input will hang unless stdin is redirected to it
%.tlo: %.tl
	echo "" | $(TXR) -e '(compile-file "$<")'

clean:
	$(RM) *.tlo
