CFLAGS = -D_OS_LINUX -D_CC_GCC -fPIC -shared
LDLIBS = -lreadline

.PHONY: all clean

all: libaikidoreadline.so

libaikido%.so: %.cc
	$(CC) $(CFLAGS) $(LDLIBS) -o $@ $<

clean:
	$(RM) *.so
