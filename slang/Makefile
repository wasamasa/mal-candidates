.PHONY: all clean

$(RM) = rm -f

all: readline-module.so

readline-module.so: readline-module.c
	$(CC) -shared -lreadline -o $@ $<

clean:
	$(RM) readline-module.so
