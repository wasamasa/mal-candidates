#include <string.h>
#include <time.h>
#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>

#include <icall.h>

int Cnow(int argc, descriptor *argv) {
    static struct timespec t0;
    static int initialized = 0;
    if (!initialized) {
        if (clock_gettime(CLOCK_REALTIME, &t0) != 0) {
            Fail;
        }
        initialized = 1;
    }

    struct timespec t1;
    if (clock_gettime(CLOCK_REALTIME, &t1) != 0) {
        Fail;
    }

    RetReal(t1.tv_sec * 1000.0 + t1.tv_nsec / 1000000.0 -
            (t0.tv_sec * 1000.0 + t0.tv_nsec / 1000000.0));
}

int Creadline(int argc, descriptor *argv) {
    ArgString(1);
    char *ret = readline(StringVal(argv[1]));
    if (ret == NULL) {
        Fail;
    } else {
        RetAlcString(ret, strlen(ret));
    }
}

int Cadd_history(int argc, descriptor *argv) {
    ArgString(1);
    add_history(StringVal(argv[1]));
    RetNull();
}
